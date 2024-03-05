import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/features/dashboard/data/services/dashboard_service.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsightsController extends BaseController {
  RxInt selectedChartTab = RxInt(0);
  List chartTab = ["Graph", "Pie-Chart"];

  RxInt selectedPaymentIndex = RxInt(0);
  List paymentOptions = ["ALL", "UPI", "Credit Card"];

  ScrollController? scrollController;
  RxInt currentPage = RxInt(1);

  RxList<TransactionModel> transactions = RxList([]);

  @override
  Future<void> onInit() async {
    await getData();
    scrollController = ScrollController()..addListener(scrollListener);

    super.onInit();
  }

  Future<void> getData() async {
    String type = "all";
    try {
      if (selectedPaymentIndex.value == 0) {
        type = "all";
      } else if (selectedPaymentIndex.value == 1) {
        type = "upi";
      } else {
        type = "credit_card";
      }
      final result = await DashboardService.getTransactionData(
        rowCount: 10,
        page: currentPage.value,
        type: type,
      );
      if (result.isEmpty) {
        return;
      }
      if (currentPage.value == 1) {
        transactions.assignAll(result);
      } else {
        transactions.addAll(result);
      }
      currentPage.value++;
    } catch (e) {
      printErr(e);
    }
  }

  void scrollListener() {
    if (scrollController == null) return;
    //load more data
    if (scrollController!.position.pixels ==
        scrollController!.position.maxScrollExtent - 50) {
      try {
        getData();
      } catch (e) {
        printErr(e);
      }
    }
  }
}
