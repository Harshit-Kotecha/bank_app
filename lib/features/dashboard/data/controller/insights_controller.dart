import 'package:bank_app/utils/base_controller.dart';
import 'package:get/get.dart';

class InsightsController extends BaseController {
  RxInt selectedChartTab = RxInt(0);
  List chartTab = ["Graph", "Pie-Chart"];

  RxInt selectedPaymentIndex = RxInt(0);
  List paymentOptions = ["ALL", "UPI", "Credit Card"];
}
