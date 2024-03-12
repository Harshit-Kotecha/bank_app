import 'package:bank_app/features/dashboard/data/models/graph_model.dart';
import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/services/local_notification_service.dart';
import 'package:bank_app/services/network/dio_client.dart';
import 'package:bank_app/utils/custom_print.dart';
import 'package:flutter/material.dart';

abstract class DashboardService {
  static Future<List<TransactionModel>> getTransactionData({
    required int rowCount,
    required int page,
    required String type,
  }) async {
    try {
      final json =
          await DioClient.dioWithAuth?.post("/bank/transaction/listing", data: {
        "row_count": rowCount,
        "page_number": page,
        "type": type,
      });
      final data = json?.data?["data"]?["listing"] as List;

      final List<TransactionModel> result = [];
      for (final x in data) {
        result.add(TransactionModel.fromJson(x));
      }
      return result;
    } catch (e) {
      return [];
    }
  }

  static Future<void> sendMoney(
      {required TransactionModel transactionModel}) async {
    try {
      final json = await DioClient.dioWithAuth
          ?.post("/bank/transaction/payment", data: transactionModel.toJson());

      if (json == null) {
        throw Exception("An error occured");
      }

      if (json.statusCode != 200 && json.statusCode != 201) {
        throw Exception("Couldn't make the payment");
      }
      FocusManager.instance.primaryFocus?.unfocus();

      if (json.data["data"]["alert"]) {
        await LocalNotificationService().showNotificationAndroid(
            "Alert!", "You have exceeded the amount limit");
      }

      NavigationHandler.navigateTo(NamedRoutes.receiptScreen);
    } catch (e) {
      printErr(e);
    }
  }

  static Future<Graph?> getGraphData() async {
    try {
      final json = await DioClient.dioWithAuth?.get("/bank/transaction/graph");

      if (json == null || (json.statusCode != 200 && json.statusCode != 201)) {
        return null;
      }

      final data = Graph.fromJson(json.data["data"]);

      return data;
    } catch (e) {
      return null;
    }
  }
}
