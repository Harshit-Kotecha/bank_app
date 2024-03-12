import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/auth/data/controller/auth_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/progress_widget.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/custom_text_field.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleW(context, 25.5),
                vertical: scaleH(context, 8)),
            child: _authController.isLoading.value
                ? const Center(
                    child: ProgressWidget(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Spacing.verticalSpacing(context, 30),
                        _welcomeWidget(context),
                        Spacing.verticalSpacing(context, 32),
                        CustomTextField(
                          labelText: "Enter your username",
                          controller: _authController.userNameTextController,
                        ),
                        Spacing.verticalSpacing(context, 16),
                        CustomTextField(
                          labelText: "Enter your password",
                          controller: _authController.passwordTextController,
                          hasSuffixIcon: true,
                        ),
                        Spacing.verticalSpacing(context, 24),
                        AppElevatedButton(
                            title: "Sign In", onPress: _authController.signIn),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  _welcomeWidget(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(Assets.signInImg),
          fit: BoxFit.fill,
        ),
        Spacing.verticalSpacing(context, 50),
        CustomText(
          text: "Bank on-the-go with our app",
          textStyle: CustomTextStyle.textStyle34Bold(
            context,
            color: AppColors.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
