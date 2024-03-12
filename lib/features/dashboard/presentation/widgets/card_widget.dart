import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.mastercardSvg),
              Spacing.horizontalSpacing(context, 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "**** 2236",
                    textStyle: CustomTextStyle.textStyle14Bold(
                      context,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  CustomText(
                    text: "Balance: £ 55300.00",
                    textStyle: CustomTextStyle.textStyle12R(
                      context,
                      color: AppColors.lightTitleText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SvgPicture.asset(
            Assets.downArrowSvg,
          ),
        ],
      ),
    );
  }
}
