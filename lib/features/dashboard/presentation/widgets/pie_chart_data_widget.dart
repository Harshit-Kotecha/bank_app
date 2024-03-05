import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PieChartDataWidget extends StatelessWidget {
  const PieChartDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 12),
      height: 70,
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
            text: "Lorem",
            textStyle: CustomTextStyle.textStyle11(
              context,
              color: AppColors.f516160,
            ),
          ),
          CustomText(
            text: "20%",
            textStyle: CustomTextStyle.textStyle12R(
              context,
            ),
          ),
          LinearPercentIndicator(
            width: 50,
            lineHeight: 7,
            percent: 0.4,
            barRadius: const Radius.circular(8),
            backgroundColor: Colors.grey.shade200,
            progressColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
