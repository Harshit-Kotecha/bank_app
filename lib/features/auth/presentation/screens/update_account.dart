
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/features/auth/data/controller/auth_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/progress_widget.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/custom_text_field.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAccount extends StatelessWidget {
  UpdateAccount({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(
                // horizontal: scaleW(context, 0), vertical: scaleH(context, 0)
                ),
            child: _authController.isLoading.value
                ? const Center(
                    child: ProgressWidget(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Spacing.verticalSpacing(context, 8),
                        _welcomeWidget(context),
                        Spacing.verticalSpacing(context, 32),
                        CustomTextField(
                          labelText: "Enter your first name",
                          controller: _authController.firstNameTextController,
                        ),
                        Spacing.verticalSpacing(context, 16),
                        CustomTextField(
                          labelText: "Enter your last name",
                          controller: _authController.lastNameTextController,
                        ),
                        Spacing.verticalSpacing(context, 16),
                        CustomTextField(
                          labelText: "Enter your account number",
                          controller: _authController.accountNoTextController,
                          keyboardType: TextInputType.number,
                        ),
                        Spacing.verticalSpacing(context, 16),
                        CustomTextField(
                          labelText: "Enter your balance",
                          controller: _authController.balanceTextController,
                          keyboardType: TextInputType.number,
                        ),
                        Spacing.verticalSpacing(context, 24),
                        AppElevatedButton(
                            title: "Update Account",
                            onPress: _authController.updateAccount),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  _welcomeWidget(BuildContext context) {
    return const Column(
      children: [
        Image(
          image: AssetImage(Assets.signInImg),
          fit: BoxFit.fill,
        ),
        // Spacing.verticalSpacing(context, 10),
        // CustomText(
        //   text: "Bank on-the-go with our app",
        //   textStyle: CustomTextStyle.textStyle34Bold(
        //     context,
        //     color: AppColors.primaryColor,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}
