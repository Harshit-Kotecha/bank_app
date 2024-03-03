import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  const IconContainer(
      {super.key,
      required this.assets,
      required this.text,
      required this.onTap});

  final String assets;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                color: AppColors.fCFCFCF,
              ),
            ),
            child: SvgPicture.asset(assets),
          ),
          Spacing.verticalSpacing(context, 5),
          CustomText(
            text: text,
            textStyle: CustomTextStyle.textStyle12R(
              context,
              color: AppColors.lightTitleText,
            ),
          ),
        ],
      ),
    );
  }
}
