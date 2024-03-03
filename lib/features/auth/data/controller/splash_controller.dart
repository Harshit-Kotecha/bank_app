import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  RxBool isSoftUpdate = RxBool(false);

  @override
  Future<void> onInit() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await handleLoginFlow();
    });
    super.onInit();
  }

  Future<void> handleLoginFlow() async {
    // NavigationHandler.removeAllNavigateTo(NamedRoutes.signinScreen);
    NavigationHandler.removeAllNavigateTo(NamedRoutes.dashboardScreen);
  }
}
