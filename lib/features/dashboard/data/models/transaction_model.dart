class TransactionModel {
  int? id;
  int? amount;
  bool isCredit;
  String? type;
  String? transactionType;
  int? user;

  TransactionModel(
      {this.id,
      this.amount,
      this.isCredit = false,
      this.type,
      this.transactionType,
      this.user});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      amount: json['amount'],
      isCredit: json['is_credit'] ?? false,
      type: json['type'],
      transactionType: json['transaction_type'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['is_credit'] = isCredit;
    data['type'] = type;
    data['transaction_type'] = transactionType;
    data['user'] = user;
    return data;
  }
}
