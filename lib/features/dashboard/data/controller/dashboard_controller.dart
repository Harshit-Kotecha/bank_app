import 'package:bank_app/features/auth/presentation/screens/update_account.dart';
import 'package:bank_app/features/dashboard/presentation/screens/cards_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/home_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/transfer_screen.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  RxInt selectedTabIndex = RxInt(3);

  final widgetOptions = [
    HomeScreen(),
    TransferScreen(),
    CardsScreen(),
    UpdateAccount(),
  ];
}
