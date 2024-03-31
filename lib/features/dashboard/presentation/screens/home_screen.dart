import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/home_controller.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/icon_container.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/transaction_tile.dart';
import 'package:bank_app/routing/named_routes.dart';
import 'package:bank_app/routing/navigation_handler.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  
  final HomeController homeController = Get.put(HomeController());
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
            Obx(
              () => Expanded(
                child: homeController.transactions.isEmpty
                    ? const Center(
                        child: Text(
                            "Make your first transaction by sending money."),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: homeController.transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionTile(
                            transactionModel:
                                homeController.transactions[index],
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _welcomeHeader(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Good ${homeController.greeting.value},",
            textStyle: CustomTextStyle.textStyle12R(
              context,
              color: AppColors.lightTitleText,
            ),
          ),
          CustomText(
            text: homeController.name.value,
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  _cardDetails(BuildContext context) {
    return Obx(
      () => Container(
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
            Spacing.verticalSpacing(context, 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CustomText(
                text: homeController.accountNo.value,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Assets.visaSvg),
                CustomText(
                  text: homeController.sortCode.value,
                  textStyle: CustomTextStyle.textStyle14R(
                    context,
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _cardOptions(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: scaleW(context, 260),
            height: scaleH(context, 120),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                    colors: [Color(0xffE84B3A), Color(0xffF2AB49)])),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '50% Off',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Free Delivery',
                        style: TextStyle(
                            color: Color(0xffE84B3A),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: scaleH(context, 10),
                ),
                const FittedBox(
                  child: Text(
                    'Make Your First \nOrder Here!!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            width: scaleW(context, 260),
            height: scaleH(context, 120),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                    colors: [Color(0xff22847F), Color(0xff4C8E82)])),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '30% Off',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: const Text(
                        'Free Delivery',
                        style: TextStyle(
                            color: Color(0xffE84B3A),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: scaleH(context, 10),
                ),
                const FittedBox(
                  child: Text(
                    'Make Payments for your\n shopping!!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
