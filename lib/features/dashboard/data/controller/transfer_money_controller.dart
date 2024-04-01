import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/features/dashboard/data/services/dashboard_service.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:bank_app/utils/shared_pref.dart';
import 'package:bank_app/utils/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TransferMoneyController extends BaseController {
  TextEditingController textController = TextEditingController();

  RxBool isLoading = RxBool(false);

  Future<void> sendMoney() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if(textController.text.trim().isNotEmpty && (int.tryParse(textController.text.trim()) ?? 0) <= 0){
      snackBar("Please enter valid amount to transfer.", isError: true);
      return;
    }
    isLoading.value = true;
    try {
      final id = await SharedPref.getIntValue(userKey);
      TransactionModel transactionModel = TransactionModel(
        id: id,
        amount: int.parse(
            textController.text.trim().isEmpty ? "0" : textController.text),
        type: "upi",
      );

      await DashboardService.sendMoney(transactionModel: transactionModel);

      
    } catch (e) {
      printErr(e);
    }
    isLoading.value = false;
  }
}
