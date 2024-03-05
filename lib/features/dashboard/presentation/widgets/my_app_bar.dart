import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key, required this.text});

  final String text;

  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              dashboardController.selectedTabIndex.value = 0;
            },
            child: SvgPicture.asset(Assets.backSvg)),
        CustomText(
          text: text,
          textStyle: CustomTextStyle.textStyle16Bold(
            context,
            color: AppColors.primaryColor,
          ),
        ),
        SvgPicture.asset(
          Assets.threeDotsSvg,
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ],
    );
  }
}
