import 'package:bank_app/features/auth/data/models/sign_in_response.dart';
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
  static Future<SignInResponse?> signIn({String? email, String? firstName, String? lastName}) async {
    try {
      final json =
          await DioClient.dioWithoutAuth?.post("/bank/user/login", data: {
        "email": email,
        "first_name" : firstName,
        "last_name" : lastName
      });
      print("sign in $json");
    if (json == null) {
        throw Exception("No data recieved");
      }
      if (json.statusCode != 200 && json.statusCode != 201) {
        throw Exception(json.data["message"]);
      }
      final data = json.data["data"];
      SignInResponse signInResponse = SignInResponse.fromJson(data);
      // SAVE USER DATA
      await SharedPref.saveString(kToken, signInResponse.access ?? '');
      if(signInResponse.access != null){
      await DioClient.initWithAuth();
      }
      return signInResponse;
    } catch (e) {
      snackBar("$e", isError: true);
      return null;
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
      var request = (balance != null) ? {
        "first_name": userFirstName,
        "last_name": userLastName,
        "account_number": accountNo,
         "balance": balance,
        "id": id,
      } : {
        "first_name": userFirstName,
        "last_name": userLastName,
        "account_number": accountNo,
        "id": id,
      };
      final json =
          await DioClient.dioWithAuth?.post("/bank/user/update", data: request);
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
      if(balance != null){
      await SharedPref.saveString(kBalance, balance);
      }

      final HomeController homeController = Get.put(HomeController());

      await homeController.updateInfo();

      final DashboardController dashboardController = Get.put(DashboardController());
      NavigationHandler.removeAllNavigateTo(NamedRoutes.dashboardScreen);

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
