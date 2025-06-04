import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/transaction_provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/transaction_model.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  late Future<void> _transactionsFuture;

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final txnProvider = Provider.of<TransactionProvider>(context, listen: false);
    _transactionsFuture = txnProvider.loadTransactions(auth.user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final txnProvider = Provider.of<TransactionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: FutureBuilder(
        future: _transactionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final txns = txnProvider.transactions;

          if (txns.isEmpty) {
            return const Center(child: Text('No transactions yet.'));
          }

          return ListView.builder(
            itemCount: txns.length,
            itemBuilder: (context, index) {
              final txn = txns[index];
              return ListTile(
                leading: Icon(
                  txn.type == 'income' ? Icons.arrow_downward : Icons.arrow_upward,
                  color: txn.type == 'income' ? Colors.green : Colors.red,
                ),
                title: Text('${txn.category} - \$${txn.amount.toStringAsFixed(2)}'),
                subtitle: Text('${txn.date.toLocal().toString().split(' ')[0]} • ${txn.description}'),
                trailing: Text(
                  txn.type,
                  style: TextStyle(
                    color: txn.type == 'income' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
