import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/models/sector.dart';
import 'package:bank_app/features/dashboard/presentation/widgets/pie_chart_data_widget.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key, required this.sectors});

  final List<Sector> sectors;

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
                left: Dimensions(context: context).screenWidth / 3.8,
                child: _buildCenterWidget(context),
              ),
            ],
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PieChartDataWidget(),
            PieChartDataWidget(),
            PieChartDataWidget(),
            PieChartDataWidget(),
          ],
        )
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
            text: "Feb",
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
          const CustomText(
            text: "43%",
            textStyle: TextStyle(
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
