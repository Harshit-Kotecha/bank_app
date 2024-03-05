import 'package:bank_app/services/network/dio_client.dart';

abstract class DashboardService {
  static Future<void> getUpiData(
      {required int rowCount, required int page}) async {
    final json =
        await DioClient.dioWithAuth?.get("/bank/transaction/listing", data: {
      "row_count": rowCount,
      "page_number": page,
      "type": "upi",
    });
  }
}
