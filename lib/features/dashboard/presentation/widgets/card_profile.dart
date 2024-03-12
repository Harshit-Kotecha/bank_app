import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/constants/assets.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/widgets.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(Assets.profileImg),
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        Spacing.verticalSpacing(context, 15),
        CustomText(
          text: "James Anderson",
          textStyle: CustomTextStyle.textStyle20Bold(
            context,
            color: AppColors.primaryColor,
          ),
        ),
        Spacing.verticalSpacing(context, 4),
        CustomText(
          text: "A/C No - 7890 6754 6689 7753",
          textStyle: CustomTextStyle.textStyle14R(
            context,
            color: AppColors.lightTitleText,
          ),
        ),
      ],
    );
  }
}
