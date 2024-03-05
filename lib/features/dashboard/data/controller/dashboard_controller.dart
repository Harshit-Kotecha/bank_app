import 'package:bank_app/features/dashboard/presentation/screens/account_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/cards_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/home_screen.dart';
import 'package:bank_app/features/dashboard/presentation/screens/transfer_screen.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:get/get.dart';

class DashboardController extends BaseController {
  RxInt selectedTabIndex = RxInt(0);

  final widgetOptions = [
    HomeScreen(),
    TransferScreen(),
    const CardsScreen(),
    AccountScreen(),
  ];
}
