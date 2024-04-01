import 'package:bank_app/constants/app_colors.dart';
import 'package:bank_app/core/custom_text_style.dart';
import 'package:bank_app/features/dashboard/data/controller/home_controller.dart';
import 'package:bank_app/features/dashboard/data/models/graph_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineGraph extends StatefulWidget {
  final Graph? data;
  const LineGraph({Key? key, this.data}) : super(key: key);

  @override
  _LineGraphState createState() => _LineGraphState();
}

class _LineGraphState extends State<LineGraph> {
  List<_SalesData> transactionPerMonth = [];
  List<_SalesData> incomePerMonth = [];
  List<_SalesData> expensePerMonth = [];
  List<_SalesData> expenseTracker = [];
  Expense? expense;

  List<String> months = [
    'Jan',
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  void initState() {
    super.initState();
    widget.data?.transactionPerMonth?.forEach((element) {
      transactionPerMonth.add(
          _SalesData(months[element.monthNum - 1], element.value.toDouble()));
    });
    print("transaction permonth ${widget.data?.transactionPerMonth?.length}");
    widget.data?.incomePerMonth?.forEach((element) {
      incomePerMonth.add(_SalesData(months[(element.monthNum ?? 1) - 1],
          (element.monthIncome ?? 0.toDouble()).toDouble()));
    });
    print("income permonth ${widget.data?.incomePerMonth?.length}");
    widget.data?.expensePerMonth?.forEach((element) {
      expensePerMonth.add(_SalesData(months[(element.monthNum ?? 1) - 1],
          (element.value ?? 0.toDouble()).toDouble()));
    });
    print("expense permonth ${widget.data?.expensePerMonth?.length}");

    expense = widget.data?.expense;
    print(
        "expense tracker ${widget.data?.expense?.totalIncome} ${widget.data?.expense?.expanse} ${widget.data?.expense?.left}");
    expenseTracker.addAll([
      _SalesData(
          "Total Income", (widget.data?.expense?.totalIncome ?? 0).toDouble()),
      _SalesData("Expense", (widget.data?.expense?.expanse ?? 0).toDouble()),
      _SalesData("Left Over", (widget.data?.expense?.left ?? 0).toDouble()),
    ]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Initialize the chart widget
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.gradientColor1),
              child: Column(
                children: [
                  Text(
                    "Total Income",
                    style: CustomTextStyle.textStyle14SemiBold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "${expense?.totalIncome ?? Get.find<HomeController>().balance}",
                    style: CustomTextStyle.textStyle12Medium(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.gradientColor1),
              child: Column(
                children: [
                  Text(
                    "Expenses",
                    style: CustomTextStyle.textStyle14SemiBold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "${expense?.expanse ?? 0}",
                    style: CustomTextStyle.textStyle12Medium(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.gradientColor1),
              child: Column(
                children: [
                  Text(
                    "Left balance",
                    style: CustomTextStyle.textStyle14SemiBold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "${expense?.left ?? 0}",
                    style: CustomTextStyle.textStyle12Medium(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          // Chart title
          title: const ChartTitle(text: "Transactions per month"),
          // Enable legend
          legend: const Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: transactionPerMonth,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Transactions',
                color: Colors.black,

                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ]),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(text: "Income per month"),
              primaryYAxis: NumericAxis(
                  minimum: 0, maximum: getMaxIncome(), interval: 10),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_SalesData, String>>[
                ColumnSeries<_SalesData, String>(
                    dataSource: incomePerMonth,
                    xValueMapper: (_SalesData data, _) => data.year,
                    yValueMapper: (_SalesData data, _) => data.sales,
                    name: 'Income per month',
                    trackBorderWidth: 20,
                    color: Colors.black)
              ])),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(text: "Expense per month"),
              primaryYAxis: NumericAxis(
                  minimum: 0, maximum: getMaxExpanses(), interval: 10),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_SalesData, String>>[
                ColumnSeries<_SalesData, String>(
                    dataSource: expensePerMonth,
                    xValueMapper: (_SalesData data, _) => data.year,
                    yValueMapper: (_SalesData data, _) => data.sales,
                    name: 'Expense per month',
                    trackBorderWidth: 20,
                    color: Colors.black)
              ])),
      SfCircularChart(
          tooltipBehavior: TooltipBehavior(enable: true),
              title: const ChartTitle(text: "Expense Tracker"),
          series: <CircularSeries<_SalesData, String>>[
            DoughnutSeries<_SalesData, String>(
                dataSource: expenseTracker,
                xValueMapper: (_SalesData data, _) => data.year,
                yValueMapper: (_SalesData data, _) => data.sales,
                name: 'Expanses')
          ])
    ]);
  }

  double getMaxIncome() {
    double max = 0;
    for (var income in incomePerMonth) {
      if (max < income.sales) {
        max = income.sales;
      }
    }
    return max;
  }

  getMaxExpanses() {
    double max = 0;
    for (var expanse in expensePerMonth) {
      if (max < expanse.sales) {
        max = expanse.sales;
      }
    }
    return max;
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
