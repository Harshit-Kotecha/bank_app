import 'package:bank_app/features/dashboard/data/models/bar.dart';
import 'package:intl/intl.dart';

class Graph {
  List<Bar>? bars;
  double? pieCredit;
  double? pieDebit;
  String? month;
  double? ratio;
  List<TransactionPerMonth>? transactionPerMonth;
  List<IncomePerMonth>? incomePerMonth;
  List<ExpensePerMonth>? expensePerMonth;
  Expense? expense;

  Graph(
      {this.bars,
      this.pieCredit,
      this.pieDebit,
      this.month,
      this.ratio,
      this.transactionPerMonth,
      this.incomePerMonth,
      this.expensePerMonth,
      this.expense});

  factory Graph.fromJson(json) {
    Expense expense = Expense.fromJson(json['expense']);
    print("expense data ${expense.totalIncome} ${expense.left} ${expense.expanse}");
    List<TransactionPerMonth> transactionList =
        List.from(json['transactions_per_month']).map((e) {
      print("transaction element $e");
      return TransactionPerMonth.fromJson(e);
    }).toList();
    List<IncomePerMonth> incomeList =
        List.from(json['income_per_month'])
            .map((e) => IncomePerMonth.fromJson(e))
            .toList();
    // // print("income list ${incomeList.length}");
    List<ExpensePerMonth> expenseList =
        List.from(json['expense_per_month'])
            .map((e) => ExpensePerMonth.fromJson(e))
            .toList();
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
        transactionPerMonth: transactionList,
        incomePerMonth: incomeList,
        expensePerMonth: expenseList,
        expense: expense);
  }
}

class TransactionPerMonth {
  final int monthNum;
  final int value;
  TransactionPerMonth({required this.monthNum, required this.value});
  factory TransactionPerMonth.fromJson(json) {
    return TransactionPerMonth(
        monthNum: json['monthName'], value: json['value']);
  }
}

class IncomePerMonth {
  final int? monthNum;
  final int? value;
  final int? monthIncome;
  IncomePerMonth({this.monthNum, this.value, this.monthIncome});
  factory IncomePerMonth.fromJson(json) {
    return IncomePerMonth(
        monthNum: json['monthName'],
        value: json['value'],
        monthIncome: json['monthIncome']);
  }
}

class ExpensePerMonth {
  final int? monthNum;
  final int? value;
  final int? monthIncome;
  final String? transactionType;
  ExpensePerMonth(
      {this.monthNum, this.value, this.monthIncome, this.transactionType});
  factory ExpensePerMonth.fromJson(json) {
    return ExpensePerMonth(
      monthNum: json['monthName'],
      value: json['value'],
      monthIncome: json['monthIncome'],
      transactionType: json['transaction_type'],
    );
  }
}

class Expense {
  final int? totalIncome;
  final int? expanse;
  final int? left;
  Expense({
    this.totalIncome,
    this.expanse,
    this.left,
  });
  factory Expense.fromJson(json) {
    return Expense(
      totalIncome: json['total_income'],
      expanse: json['expense'],
      left: json['left'],
    );
  }
}
