import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:bank_app/features/dashboard/data/controller/home_controller.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/services/network/dio_client.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:bank_app/utils/snackbar.dart';
import 'package:get/get.dart';

abstract class AuthService {
  static Future<void> signIn({String? name, String? password}) async {
    try {
      final json =
          await DioClient.dioWithoutAuth?.post("/bank/user/login", data: {
        "username": name,
        "password": password,
      });
      if (json == null) {
        throw Exception("No data recieved");
      }
      if (json.statusCode != 200 && json.statusCode != 201) {
        throw Exception(json.data["message"]);
      }
      final data = json.data["data"];

      // SAVE USER DATA
      await SharedPref.saveString(kToken, data["access"]);
      await SharedPref.saveString(refreshToken, data["refresh"]);
      await SharedPref.saveString(username, data["username"]);
      await SharedPref.saveString(firstName, data["first_name"]);
      await SharedPref.saveString(lastName, data["last_name"]);
      await SharedPref.saveInt(userKey, data["user_id"]);

      await DioClient.initWithAuth();

      NavigationHandler.removeAllNavigateTo(NamedRoutes.dashboardScreen);
    } catch (e) {
      snackBar(e.toString(), isError: true);
    }
  }

  static Future<void> updateAccount({
    String? userFirstName,
    String? userLastName,
    String? accountNo,
    String? balance,
  }) async {
    try {
      final id = await SharedPref.getIntValue(userKey);
      final json =
          await DioClient.dioWithAuth?.post("/bank/user/update", data: {
        "first_name": userFirstName,
        "last_name": userLastName,
        "account_number": accountNo,
        "balance": balance,
        "id": id
      });
      if (json == null) {
        throw Exception("No data recieved");
      }
      if (json.statusCode != 200 && json.statusCode != 201) {
        throw Exception(json.data["message"]);
      }

      // SAVE USER DATA
      await SharedPref.saveString(firstName, userFirstName ?? "");
      await SharedPref.saveString(lastName, userLastName ?? "");
      await SharedPref.saveString(kAccountNo, accountNo ?? "");
      await SharedPref.saveString(kBalance, balance ?? "");

      final HomeController homeController = Get.find();

      await homeController.updateInfo();

      final DashboardController dashboardController = Get.find();

      dashboardController.selectedTabIndex.value = 0;
    } catch (e) {
      snackBar(e.toString(), isError: true);
    }
  }

  static Future<bool> hasTokenRefreshed() async {
    try {
      final token = await SharedPref.getStringValueFor(refreshToken);
      final json =
          await DioClient.dioWithoutAuth?.post("/bank/user/refresh", data: {
        "refresh": token,
      });
      if (json == null) {
        throw Exception("No data recieved");
      }
      if (json.statusCode != 200 && json.statusCode != 201) {
        throw Exception(json.data["message"]);
      }
      final data = json.data["data"];

      printWarning(data["access"]);

      // SAVE USER DATA
      await SharedPref.saveString(kToken, data["access"]);
      await SharedPref.saveString(refreshToken, data["refresh"]);

      await DioClient.initWithAuth();
      return true;
    } catch (e) {
      snackBar(e.toString(), isError: true);
      return false;
    }
  }
}
