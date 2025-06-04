import 'package:flutter/material.dart';
import 'add_transaction_screen.dart';
import 'transaction_history_screen.dart';
import 'budget_screen.dart';
import 'reports_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
                );
              },
              child: const Text('Add Transaction'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TransactionHistoryScreen()),
                );
              },
              child: const Text('Transaction History'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BudgetScreen()),
                );
              },
              child: const Text('Budget'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportsScreen()),
                );
              },
              child: const Text('Reports'),
            ),
          ],
        ),
      ),
    );
  }
}
