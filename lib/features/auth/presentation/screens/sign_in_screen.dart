import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/app_elevated_button.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: scaleW(context, 25.5), vertical: scaleH(context, 8)),
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
                  CustomText(
                    text: " Sign In",
                    textStyle: CustomTextStyle.textStyle16SemiBold(
                      context,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
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
        Container(
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
                text: "Sign Up With Google",
                textStyle: CustomTextStyle.textStyle16Bold(
                  context,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
