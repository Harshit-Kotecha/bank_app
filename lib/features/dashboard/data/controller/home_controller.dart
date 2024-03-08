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
  RxString accountNo = RxString("999 888 777 ***");
  RxString balance = RxString("");

  RxList<TransactionModel> transactions = RxList([]);

  @override
  Future<void> onInit() async {
    name.value =
        "${await SharedPref.getStringValueFor(firstName)} ${await SharedPref.getStringValueFor(lastName)}";

    name.value = name.value.trim().isEmpty ? "Mohit" : name.value;

    userId = await SharedPref.getIntValue(userKey);

    accountNo.value = await SharedPref.getStringValueFor(kAccountNo);

    balance.value = await SharedPref.getStringValueFor(kBalance);

    greeting.value = greetingMsg();
    await fetchRecentTransactions();
    super.onInit();
  }

  Future<void> updateInfo() async {
    name.value =
        "${await SharedPref.getStringValueFor(firstName)} ${await SharedPref.getStringValueFor(lastName)}";

    name.value = name.value.trim().isEmpty ? "Mohit" : name.value;

    final result = await SharedPref.getStringValueFor(kAccountNo);

    accountNo.value = formatAccountNumber(result);

    balance.value = await SharedPref.getStringValueFor(kBalance);
  }

  Future<void> fetchRecentTransactions() async {
    String type = "upi";
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

  String formatAccountNumber(String accountNumber) {
    if (accountNumber.length <= 4) {
      return accountNumber;
    }

    String formattedNumber = '';
    for (int i = 0; i < accountNumber.length; i++) {
      if (i < accountNumber.length - 4) {
        if (i % 4 == 0 && i != 0) {
          formattedNumber += ' '; // Add space after every 4 characters
        }
        formattedNumber += accountNumber[i];
      } else {
        formattedNumber += '*'; // Replace last four characters with *
      }
    }
    return formattedNumber;
  }
}
