import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/features/dashboard/data/services/dashboard_service.dart';
import 'package:bank_app/services/local_notification_service.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TransferMoneyController extends BaseController {
  TextEditingController textController = TextEditingController();

  RxBool isLoading = RxBool(false);

  Future<void> sendMoney() async {
    isLoading.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      final id = await SharedPref.getIntValue(userKey);
      TransactionModel transactionModel = TransactionModel(
        id: id,
        amount: int.parse(
            textController.text.trim().isEmpty ? "0" : textController.text),
        type: "upi",
      );

      await DashboardService.sendMoney(transactionModel: transactionModel);

      final balance = await SharedPref.getStringValueFor(kBalance);
      final remainingBalance =
          int.parse(balance) - int.parse(textController.text);
      await SharedPref.saveString(kBalance, remainingBalance.toString());
    } catch (e) {
      printErr(e);
    }
    isLoading.value = false;
  }
}
