import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/features/dashboard/data/services/dashboard_service.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  RxString name = RxString("");
  int userId = 1;
  RxString greeting = RxString("Evening");

  RxList<TransactionModel> transactions = RxList([]);

  @override
  Future<void> onInit() async {
    name.value =
        "${await SharedPref.getStringValueFor(firstName)} ${await SharedPref.getStringValueFor(lastName)}";

    name.value = name.value.trim().isEmpty ? "Mohit" : name.value;

    userId = await SharedPref.getIntValue(userKey);
    greeting.value = greetingMsg();
    await fetchRecentTransactions();
    super.onInit();
  }

  Future<void> fetchRecentTransactions() async {
    String type = "all";
    try {
      final result = await DashboardService.getTransactionData(
        rowCount: 20,
        page: 1,
        type: type,
      );
      if (result.isEmpty) {
        return;
      }
      transactions.assignAll(result);
    } catch (e) {
      printErr(e);
    }
  }

  void setUserDetails({required String username, required int id}) {
    name.value = username;
    userId = id;
  }

  String greetingMsg() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
}
