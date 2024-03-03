import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:bank_app/features/dashboard/data/controller/insights_controller.dart';
import 'package:bank_app/features/dashboard/data/models/sector.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/graph_widget.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/my_app_bar.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/payment_tile.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/pie_chart_widget.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InsightsScreen extends StatelessWidget {
  InsightsScreen({super.key});
  final InsightsController insightsController = Get.put(InsightsController());
  final DashboardController dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleW(context, 25.5),
                vertical: scaleH(context, 8)),
            child: Column(
              children: [
                const MyAppBar(text: "Expense Tracker"),
                Spacing.verticalSpacing(context, 14),
                _budgetBalance(context),
                Spacing.verticalSpacing(context, 14),
                Row(
                  children: [
                    ...insightsController.chartTab
                        .asMap()
                        .map((index, value) =>
                            MapEntry(index, _getChartTab(index, context)))
                        .values
                        .toList(),
                  ],
                ),
                if (insightsController.selectedChartTab.value == 0)
                  GraphWidget()
                else
                  PieChartWidget(
                    sectors: [
                      Sector(color: AppColors.assignedBlue, value: 40),
                      Sector(color: AppColors.red, value: 30),
                      Sector(color: AppColors.green, value: 10),
                      Sector(color: AppColors.primaryColor, value: 1),
                    ],
                  ),
                Spacing.verticalSpacing(context, 36),
                Row(
                  children: [
                    ...insightsController.paymentOptions
                        .asMap()
                        .map((index, value) =>
                            MapEntry(index, _getPaymentsTab(index, context)))
                        .values
                        .toList(),
                  ],
                ),
                Spacing.verticalSpacing(context, 8),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const PaymentTile();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: scaleW(context, 25.5), vertical: scaleH(context, 0)),
        child: AppElevatedButton(
            title: "Send Money",
            onPress: () {
              dashboardController.selectedTabIndex.value = 1;
              NavigationHandler.navigateTo(NamedRoutes.dashboardScreen);
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _budgetBalance(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Household Budget",
          textStyle: CustomTextStyle.textStyle16Bold(
            context,
            color: AppColors.black,
          ),
        ),
        CustomText(
          text: "- £6570",
          textStyle: CustomTextStyle.textStyle16SemiBold(
            context,
            color: AppColors.red,
          ),
        ),
      ],
    );
  }

  _getChartTab(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        insightsController.selectedChartTab.value = index;
      },
      child: _getChartWidget(index, context),
    );
  }

  _getChartWidget(int index, BuildContext context) {
    if (index == insightsController.selectedChartTab.value) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: AppColors.black),
        child: CustomText(
            text: insightsController.chartTab[index],
            textStyle: CustomTextStyle.textStyle12Bold(context,
                color: AppColors.white)),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: CustomText(
            text: insightsController.chartTab[index],
            textStyle: CustomTextStyle.textStyle12SemiBold(context,
                color: AppColors.lightTitleText)),
      );
    }
  }

  _getPaymentsTab(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        insightsController.selectedPaymentIndex.value = index;
      },
      child: _getPaymentWidget(index, context),
    );
  }

  _getPaymentWidget(int index, BuildContext context) {
    if (index == insightsController.selectedPaymentIndex.value) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: AppColors.black),
        child: CustomText(
          text: insightsController.paymentOptions[index],
          textStyle: CustomTextStyle.textStyle12Bold(
            context,
            color: AppColors.white,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: CustomText(
          text: insightsController.paymentOptions[index],
          textStyle: CustomTextStyle.textStyle12SemiBold(
            context,
            color: AppColors.lightTitleText,
          ),
        ),
      );
    }
  }
}
