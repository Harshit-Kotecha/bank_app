import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/icon_container.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/transaction_tile.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeHeader(context),
            Spacing.verticalSpacing(context, 20),
            _cardDetails(context),
            Spacing.verticalSpacing(context, 20),
            _cardOptions(context),
            Spacing.verticalSpacing(context, 20),
            _seeTransactions(context),
            Spacing.verticalSpacing(context, 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TransactionTile(
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _welcomeHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Good Evening,",
          textStyle: CustomTextStyle.textStyle12R(
            context,
            color: AppColors.lightTitleText,
          ),
        ),
        CustomText(
          text: "Sarah Tucker",
          textStyle: CustomTextStyle.textStyle20Bold(
            context,
            color: AppColors.primaryColor,
          ),
        ),
      ],
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
                    text: "£25,890.00",
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
                text: "2342 2212 **** ****",
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

  _cardOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconContainer(
          assets: Assets.sendSvg,
          text: "Send",
          onTap: () {},
        ),
        IconContainer(
          assets: Assets.recieveSvg,
          text: "Recieve",
          onTap: () {},
        ),
        IconContainer(
          assets: Assets.lockSvg,
          text: "LockCard",
          onTap: () {},
        ),
        IconContainer(
          assets: Assets.settingsSvg,
          text: "Settings",
          onTap: () {},
        ),
      ],
    );
  }

  _seeTransactions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "Recent Transactions",
          textStyle: CustomTextStyle.textStyle18Bold(
            context,
            color: AppColors.primaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            NavigationHandler.navigateTo(NamedRoutes.insightsScreen);
          },
          child: CustomText(
            text: "See All",
            textStyle: CustomTextStyle.textStyle12R(
              context,
            ),
          ),
        ),
      ],
    );
  }
}
