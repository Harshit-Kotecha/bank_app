import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PieChartDataWidget extends StatelessWidget {
  const PieChartDataWidget({
    super.key,
    required this.title,
    required this.percent,
  });

  final String title;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
      // height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle11(
              context,
              color: AppColors.f516160,
            ),
          ),
          Spacing.verticalSpacing(context, 4),
          CustomText(
            text: "${percent.toStringAsFixed(4)}%",
            textStyle: CustomTextStyle.textStyle12R(
              context,
            ),
          ),
          Spacing.verticalSpacing(context, 4),
          LinearPercentIndicator(
            width: 80,
            lineHeight: 7,
            percent: percent / 100,
            barRadius: const Radius.circular(8),
            backgroundColor: Colors.grey.shade200,
            progressColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
