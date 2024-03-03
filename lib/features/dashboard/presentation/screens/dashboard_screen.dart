import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/features/dashboard/data/controller/dashboard_controller.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: scaleW(context, 25.5),
                vertical: scaleH(context, 8)),
            child: dashboardController
                .widgetOptions[dashboardController.selectedTabIndex.value],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.lightTitleText,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.homeSvg,
                colorFilter: const ColorFilter.mode(
                    AppColors.lightTitleText, BlendMode.srcIn),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.transferSvg),
              label: 'Transfer',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.cardSvg),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.accountSvg),
              label: 'Account',
            ),
          ],
          currentIndex: dashboardController.selectedTabIndex.value,
          selectedItemColor: AppColors.black,
          onTap: (index) {
            dashboardController.selectedTabIndex.value = index;
          },
        ),
      ),
    );
  }
}
