import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/auth/data/controller/auth_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/progress_widget.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _authController.isLoading.value
              ? const Center(
                  child: ProgressWidget(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: scaleW(context, 25.5),
                      vertical: scaleH(context, 8)),
                  child: Column(
                    children: [
                      Spacing.verticalSpacing(context, 30),
                      _welcomeWidget(context),
                      Spacing.verticalSpacing(context, 32),
                      _signInButtons(context),
                      Spacing.verticalSpacing(context, 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Already a member?",
                            textStyle: CustomTextStyle.textStyle16Regular(
                              context,
                              color: AppColors.lightTitleText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationHandler.navigateTo(
                                  NamedRoutes.signinScreen);
                            },
                            child: CustomText(
                              text: " Sign In",
                              textStyle: CustomTextStyle.textStyle16SemiBold(
                                context,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                    ],
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
        Spacing.verticalSpacing(context, 20),
        CustomText(
          text:
              "Manage your finances anytime, anywhere with our online banking app.",
          textStyle: CustomTextStyle.textStyle16Regular(
            context,
            color: AppColors.lightTitleText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _signInButtons(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(title: "Create an Account", onPress: () {}),
        Spacing.verticalSpacing(context, 16),
        GestureDetector(
          onTap: () => _authController.signInWithGoogle(),
          child: Container(
            width: double.maxFinite,
            height: scaleH(context, 39),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.fCFCFCF),
              borderRadius: BorderRadius.circular(scaleW(context, 10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.googleSvg),
                Spacing.horizontalSpacing(context, 16),
                CustomText(
                  text: "Sign In With Google",
                  textStyle: CustomTextStyle.textStyle16Bold(
                    context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
