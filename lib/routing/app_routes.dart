import 'package:bank_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:bank_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/receipt_screen.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static List<GetPage> screensRoutes() {
    return [
      GetPage(
        name: "/",
        page: () => SplashScreen(),
      ),
      GetPage(
        name: NamedRoutes.signinScreen,
        page: () => const SignInScreen(),
      ),
      GetPage(
        name: NamedRoutes.dashboardScreen,
        page: () => DashboardScreen(),
      ),
      GetPage(
        name: NamedRoutes.receiptScreen,
        page: () => ReceiptScreen(),
      ),
    ];
  }
}
