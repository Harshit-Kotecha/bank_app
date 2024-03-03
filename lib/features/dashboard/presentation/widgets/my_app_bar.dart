import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.backSvg),
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
