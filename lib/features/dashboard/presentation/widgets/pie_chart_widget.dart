import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/models/sector.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget(
      {super.key,
      required this.sectors,
      required this.month,
      required this.ratio});

  final List<Sector> sectors;
  final String month;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  sections: _chartSections(sectors),
                  centerSpaceRadius: 80.0,
                ),
              ),
              Positioned(
                top: 80,
                left: Dimensions(context: context).screenWidth / 4.2,
                child: _buildCenterWidget(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 20.0;
      final data = PieChartSectionData(
        color: sector.color,
        value: sector.value,
        radius: radius,
        title: '',
      );
      list.add(data);
    }
    return list;
  }

  _buildCenterWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.fF0F4F4,
        ),
        shape: BoxShape.circle,
      ),
      child: Column(
        children: [
          CustomText(
            text: month,
            textStyle: CustomTextStyle.textStyle12R(
              context,
              color: AppColors.lightTitleText,
            ),
          ),
          CustomText(
            text: "2024",
            textStyle: CustomTextStyle.textStyle12R(
              context,
              color: AppColors.lightTitleText,
            ),
          ),
          CustomText(
            text: "${ratio.toStringAsFixed(2)}%",
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.f002424,
            ),
          ),
        ],
      ),
    );
  }
}
