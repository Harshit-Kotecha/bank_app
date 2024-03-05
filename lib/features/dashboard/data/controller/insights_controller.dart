import 'package:bank_app/features/dashboard/data/services/dashboard_service.dart';
import 'package:bank_app/utils/base_controller.dart';
import 'package:get/get.dart';

class InsightsController extends BaseController {
  RxInt selectedChartTab = RxInt(0);
  List chartTab = ["Graph", "Pie-Chart"];

  RxInt selectedPaymentIndex = RxInt(0);
  List paymentOptions = ["ALL", "UPI", "Credit Card"];

  Future<void> getData(int index) async {
    if (index == 0) {
    } else if (index == 1) {
      await DashboardService.getUpiData(rowCount: 1, page: 1);
    }
  }
}
