import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/models/points.dart';
import 'package:bank_app/utils/dimensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class GraphWidget extends StatelessWidget {
  GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: _chartGroups(),
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(color: AppColors.fF2F2F2),
            ),
          ),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            // show: false,
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }

  final points = [
    Points(x: 2, y: 4),
    Points(x: 3, y: 5),
    Points(x: 4, y: 6),
  ];
  List<BarChartGroupData> _chartGroups() {
    return points
        .map(
          (point) => BarChartGroupData(
            x: point.x.toInt(),
            barsSpace: 8,
            barRods: [
              BarChartRodData(
                toY: point.y,
                color: AppColors.f8E8E8E,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                width: 10,
              ),
              BarChartRodData(
                toY: point.y + 2,
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
          String text = '';
          return Text(
            "${value.toInt()} Feb",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.f494949,
            ),
          );
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
              break;
          }

          return Text(text);
        },
      );
}
