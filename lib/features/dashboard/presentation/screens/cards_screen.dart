import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/home_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/my_app_bar.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CardsScreen extends StatelessWidget {
  CardsScreen({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              MyAppBar(text: "Card"),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // _welcomeHeader(context),
                    Spacing.verticalSpacing(context, 20),
                    _cardDetails(context),
                    Spacing.verticalSpacing(context, 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cardDetails(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: scaleW(context, 23),
        vertical: scaleH(context, 18),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [AppColors.gradientColor1, AppColors.gradientColor2],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Your Balance:",
                    textStyle: CustomTextStyle.textStyle16Regular(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                  CustomText(
                    text: "£${homeController.balance.value}",
                    textStyle: CustomTextStyle.textStyle34Bold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                Assets.threeDotsSvg,
              ),
            ],
          ),
          Spacing.verticalSpacing(context, 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.visaSvg),
              CustomText(
                text: homeController.accountNo.value,
                textStyle: CustomTextStyle.textStyle14R(
                  context,
                  color: AppColors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
