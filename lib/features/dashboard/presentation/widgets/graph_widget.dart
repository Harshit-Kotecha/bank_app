import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/features/dashboard/data/controller/insights_controller.dart';
import 'package:bank_app/features/dashboard/data/models/bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GraphWidget extends StatelessWidget {
  GraphWidget({super.key, required this.bars});

  final List<Bar> bars;
  final InsightsController insightsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: SizedBox(
        height: 200,
        width: bars.length * 60,
        child: BarChart(
          BarChartData(
            barGroups: _chartGroups(),
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(color: AppColors.fF2F2F2),
              ),
            ),
            gridData: const FlGridData(show: false),
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              // show: false,
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {
    return bars
        .map(
          (bar) => BarChartGroupData(
            x: bar.date?.day ?? 1,
            barsSpace: 8,
            barRods: [
              BarChartRodData(
                toY: bar.credit ?? 0,
                color: AppColors.f8E8E8E,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                width: 10,
              ),
              BarChartRodData(
                toY: bar.debit ?? 0,
                color: AppColors.f494949,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                width: 10,
              )
            ],
          ),
        )
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return Text(
            "${value.toInt()} ${insightsController.graph.value?.month?.substring(0, 3)}",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.f494949,
            ),
          );
        },
      );
}
