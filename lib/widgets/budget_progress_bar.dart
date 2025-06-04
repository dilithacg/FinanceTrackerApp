import 'package:flutter/material.dart';

class BudgetProgressBar extends StatelessWidget {
  final double totalExpense;
  final double budget;

  const BudgetProgressBar({
    super.key,
    required this.totalExpense,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (budget == 0) ? 0 : (totalExpense / budget).clamp(0, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Monthly Budget'),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          color: Colors.green,
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Text('\$${totalExpense.toStringAsFixed(2)} / \$${budget.toStringAsFixed(2)}'),
      ],
    );
  }
}
