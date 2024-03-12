class Bar {
  DateTime? date;
  double? credit;
  double? debit;

  Bar({
    this.credit,
    this.date,
    this.debit,
  });

  factory Bar.fromJson(json) {
    return Bar(
      date: DateTime.parse(json["created_at"]),
      credit: json["credit"].toDouble() ?? 0,
      debit: json["debit"].toDouble() ?? 0,
    );
  }
}
