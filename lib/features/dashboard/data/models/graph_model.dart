import 'package:bank_app/features/dashboard/data/models/bar.dart';
import 'package:intl/intl.dart';

class Graph {
  List<Bar>? bars;
  double? pieCredit;
  double? pieDebit;
  String? month;
  double? ratio;

  Graph({
    this.bars,
    this.pieCredit,
    this.pieDebit,
    this.month,
    this.ratio,
  });

  factory Graph.fromJson(json) {
    final bar = (json["bar"] as List?)?.map((e) => Bar.fromJson(e)).toList();

    final month = DateFormat('MMMM').format(bar?.first.date ?? DateTime.now());

    final credit = json["pie"][0]["credit"].toDouble();
    final debit = json["pie"][1]["debit"].toDouble();

    final double ratio = debit != 0.0 ? credit / debit : 0;

    return Graph(
      bars: bar,
      pieCredit: credit,
      pieDebit: debit,
      month: month,
      ratio: ratio,
    );
  }
}
