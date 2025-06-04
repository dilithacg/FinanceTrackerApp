class TransactionModel {
  final String id;
  final double amount;
  final String category;
  final String type; // 'income' or 'expense'
  final DateTime date;
  final String description;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.type,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'type': type,
      'date': date.toIso8601String(),
      'description': description,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      date: DateTime.parse(map['date']),
      description: map['description'] ?? '',
    );
  }
}
