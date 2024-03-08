import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:bank_app/features/dashboard/data/controller/transfer_money_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/card_profile.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/my_app_bar.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/progress_widget.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferScreen extends StatelessWidget {
  TransferScreen({super.key});

  final TransferMoneyController transferMoneyController =
      Get.put(TransferMoneyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => transferMoneyController.isLoading.value
              ? const Center(
                  child: ProgressWidget(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        MyAppBar(text: "Transfer"),
                        Spacing.verticalSpacing(context, 32),
                        const CardProfile(),
                        Spacing.verticalSpacing(context, 60),
                        _inputAmount(context),
                      ],
                    ),
                    // Column(
                    //   // mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     AppElevatedButton(
                    //       title: "Send Money",
                    //       onPress: () {
                    //         NavigationHandler.navigateTo(NamedRoutes.receiptScreen);
                    //       },
                    //     ),
                    //     const CardWidget(),
                    //   ],
                    // ),
                  ],
                ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppElevatedButton(
            title: "Send Money",
            onPress: () {
              FocusManager.instance.primaryFocus?.unfocus();
              transferMoneyController.sendMoney();
            },
          ),
          // const CardWidget(),
        ],
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     AppElevatedButton(
      //       title: "Send Money",
      //       onPress: () {
      //         NavigationHandler.navigateTo(NamedRoutes.receiptScreen);
      //       },
      //     ),
      //     const TransactionTile(index: 0),
      //   ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _inputAmount(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: transferMoneyController.textController,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: scaleW(context, 32),
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.number,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: const InputDecoration(
        labelStyle: TextStyle(
          color: AppColors.black, // Grey color
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.fC9C9C9),
        ),
        focusedBorder: UnderlineInputBorder(),
      ),
    );
  }
}
