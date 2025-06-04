import 'package:flutter/material.dart';
import '../models/budget_model.dart';
import '../services/budget_service.dart';

class BudgetProvider with ChangeNotifier {
  final BudgetService _budgetService = BudgetService();
  BudgetModel? _budget;

  BudgetModel? get budget => _budget;

  Future<void> fetchBudget(String uid) async {
    _budget = await _budgetService.getBudget(uid);
    notifyListeners();
  }

  Future<void> setBudget(String uid, BudgetModel model) async {
    await _budgetService.setBudget(uid, model);
    _budget = model;
    notifyListeners();
  }
}
