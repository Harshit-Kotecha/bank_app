import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:bank_app/features/dashboard/data/controller/insights_controller.dart';
import 'package:bank_app/features/dashboard/data/models/sector.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/graph_widget.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/my_app_bar.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/payment_tile.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/pie_chart_data_widget.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/pie_chart_widget.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyAppBar(text: "Expense Tracker"),
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
                    GraphWidget(
                      bars: insightsController.graph.value?.bars ?? [],
                    )
                  else
                    Column(
                      children: [
                        PieChartWidget(
                          month:
                              insightsController.graph.value?.month ?? "March",
                          ratio: insightsController.graph.value?.ratio ?? 0,
                          sectors: [
                            Sector(
                              color: Colors.grey.shade800,
                              value: insightsController.graph.value?.pieDebit ??
                                  50,
                            ),
                            Sector(
                              color: Colors.grey.shade400,
                              value:
                                  insightsController.graph.value?.pieCredit ??
                                      50,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PieChartDataWidget(
                              title: "Credit",
                              percent:
                                  insightsController.graph.value?.pieCredit ??
                                      0,
                            ),
                            PieChartDataWidget(
                              title: "Debit",
                              percent:
                                  insightsController.graph.value?.pieDebit ?? 0,
                            ),
                          ],
                        )
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
                  insightsController.transactions.isEmpty
                      ? const SizedBox(
                          height: 80,
                          child: Center(
                            child: CustomText(
                              text: "No transaction found",
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: insightsController.transactions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: insightsController.scrollController,
                          itemBuilder: (context, index) {
                            return PaymentTile(
                              transactionModel:
                                  insightsController.transactions[index],
                            );
                          },
                        ),
                ],
              ),
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
      onTap: () async {
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
      onTap: () async {
        insightsController.currentPage.value = 1;
        insightsController.selectedPaymentIndex.value = index;
        insightsController.transactions.clear();
        await insightsController.getData();
      },
      child: _getPaymentWidget(index, context),
    );
  }

  _getPaymentWidget(int index, BuildContext context) {
    if (index == insightsController.selectedPaymentIndex.value) {
      return GestureDetector(
        onTap: () {
          insightsController.transactions.clear();
          insightsController.getData();
        },
        child: Container(
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
