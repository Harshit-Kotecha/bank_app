import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/features/dashboard/data/controller/transfer_money_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/card_profile.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/my_app_bar.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
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
      body: Column(
        children: [
          MyAppBar(text: "Transfer"),
          Spacing.verticalSpacing(context, 32),
          const CardProfile(),
          Spacing.verticalSpacing(context, 60),
          _inputAmount(context),
        ],
      ),
      floatingActionButton: AppElevatedButton(
          title: "Send Money",
          onPress: () {
            NavigationHandler.navigateTo(NamedRoutes.receiptScreen);
          }),
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
