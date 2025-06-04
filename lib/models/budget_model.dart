class BudgetModel {
  final double amount;
  final DateTime month;

  BudgetModel({
    required this.amount,
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'month': month.toIso8601String(),
    };
  }

  factory BudgetModel.fromMap(Map<String, dynamic> map) {
    return BudgetModel(
      amount: map['amount']?.toDouble() ?? 0.0,
      month: DateTime.parse(map['month']),
    );
  }
}
