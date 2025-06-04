import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/budget_model.dart';
import '../../providers/auth_provider.dart';
import '../../services/budget_service.dart';
import '../../widgets/custom_input_field.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _budgetController = TextEditingController();
  bool _isLoading = false;

  void _saveBudget() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final user = Provider.of<AuthProvider>(context, listen: false).user;
    if (user == null) return;

    final budget = BudgetModel(
      amount: double.parse(_budgetController.text),
      month: DateTime.now(),
    );

    await BudgetService().setBudget(user.uid, budget);

    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Budget updated successfully')),
    );
  }

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monthly Budget')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputField(
                controller: _budgetController,
                label: 'Enter Budget Amount',
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _saveBudget,
                child: const Text('Save Budget'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
