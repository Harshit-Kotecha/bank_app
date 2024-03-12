import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/services/network/dio_client.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  RxBool isSoftUpdate = RxBool(false);

  @override
  Future<void> onInit() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await DioClient.initWithAuth();
      await DioClient.initWithoutAuth();
      await handleLoginFlow();
    });
    super.onInit();
  }

  Future<void> handleLoginFlow() async {
    final token = await SharedPref.getToken();
    if (token == null) {
      NavigationHandler.removeAllNavigateTo(NamedRoutes.welcomeScreen);
    } else {
      NavigationHandler.removeAllNavigateTo(NamedRoutes.dashboardScreen);
    }
  }
}
