import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:bank_app/features/dashboard/data/controller/home_controller.dart';
import 'package:bank_app/features/dashboard/data/controller/transfer_money_controller.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReceiptScreen extends StatelessWidget {
  ReceiptScreen({super.key});
  final TransferMoneyController transferMoneyController = Get.find();
  final DashboardController dashboardController = Get.find();
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: scaleW(context, 25.5), vertical: scaleH(context, 8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.successSvg),
              CustomText(
                text:
                    "£${transferMoneyController.textController.text} has been sent to James Anderson",
                textStyle: CustomTextStyle.textStyle20Bold(
                  context,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              Spacing.verticalSpacing(context, 120),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: scaleW(context, 25.5), vertical: scaleH(context, 8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: scaleH(context, 39),
              child: CustomText(
                  text: "View Receipt",
                  textStyle: CustomTextStyle.textStyle16Bold(context)),
            ),
            AppElevatedButton(
                title: "Close",
                onPress: () async {
                  dashboardController.selectedTabIndex.value = 0;
                  await homeController.fetchRecentTransactions();
                  await homeController.updateInfo();
                  NavigationHandler.removeAllNavigateTo(
                      NamedRoutes.dashboardScreen);
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
