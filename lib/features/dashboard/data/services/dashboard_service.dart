import 'package:bank_app/features/dashboard/data/models/transaction_model.dart';
import 'package:bank_app/services/network/dio_client.dart';
import 'package:bank_app/utils/custom_print.dart';

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
      printWarning(json);
    } catch (e) {
      return [];
    }
    return [];
  }
}
