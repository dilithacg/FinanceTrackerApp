import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final double remaining;
  final double budget;
  final String currencySymbol;

  const WalletCard({
    super.key,
    required this.remaining,
    required this.budget,
    this.currencySymbol = '\$',
  });

  @override
  Widget build(BuildContext context) {
    final percent = budget > 0 ? (remaining / budget).clamp(0, 1).toDouble() : 0.0;
    final usedAmount = budget - remaining;
    final isOverBudget = remaining < 0;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.teal.shade700,
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BUDGET OVERVIEW',
                  style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                Icon(Icons.account_balance_wallet, color: Colors.yellow.withOpacity(0.8),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Remaining Balance',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$currencySymbol${remaining.abs().toStringAsFixed(2)}',
              style: TextStyle(
                color: isOverBudget ? Colors.orange.shade300 : Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isOverBudget)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Over budget by $currencySymbol${remaining.abs().toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.orange.shade300,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.white.withOpacity(0.2),
              color: isOverBudget
                  ? Colors.orange.shade400
                  : percent > 0.7
                  ? Colors.tealAccent.shade400
                  : Colors.greenAccent.shade400,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spent: $currencySymbol${usedAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Budget: $currencySymbol${budget.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(100 - (percent * 100)).toStringAsFixed(0)}% used',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${(percent * 100).toStringAsFixed(0)}% remaining',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}