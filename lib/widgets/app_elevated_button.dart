import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.leadingIcon = '',
    this.trailingIcon = '',
    this.width = double.infinity,
    this.reverseColors = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final String leadingIcon;
  final String trailingIcon;
  final double? width;
  final bool reverseColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: scaleH(context, 39),
      child: Directionality(
        textDirection:
            trailingIcon.isNotEmpty ? TextDirection.rtl : TextDirection.ltr,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(scaleW(context, 10)),
          child: ElevatedButton.icon(
            onPressed: onPress,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  reverseColors ? Colors.white : AppColors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            label: Text(
              title,
              style: Get.theme.textTheme.titleMedium?.copyWith(
                color: reverseColors ? AppColors.black : Colors.white,
                fontSize: scaleW(context, 16),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            icon: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
