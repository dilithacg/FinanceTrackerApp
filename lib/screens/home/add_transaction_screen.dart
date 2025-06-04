import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../models/transaction_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/transaction_provider.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _amountController = TextEditingController();
  final _descController = TextEditingController();
  String _category = 'Food';
  String _type = 'expense';
  DateTime _selectedDate = DateTime.now();

  final List<String> _categories = ['Food', 'Transport', 'Salary', 'Shopping'];

  Future<void> _submit() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final txnProvider = Provider.of<TransactionProvider>(context, listen: false);

    final txn = TransactionModel(
      id: const Uuid().v4(),
      amount: double.parse(_amountController.text),
      category: _category,
      type: _type,
      date: _selectedDate,
      description: _descController.text,
    );

    await txnProvider.addTransaction(auth.user!.uid, txn);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            DropdownButton<String>(
              value: _category,
              onChanged: (value) => setState(() => _category = value!),
              items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
            ),
            DropdownButton<String>(
              value: _type,
              onChanged: (value) => setState(() => _type = value!),
              items: ['income', 'expense'].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
            ),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submit, child: const Text('Save Transaction')),
          ],
        ),
      ),
    );
  }
}
