import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/database_service.dart';

class TransactionProvider with ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  Future<void> loadTransactions(String uid) async {
    _dbService.getTransactions(uid).listen((txnList) {
      _transactions = txnList;
      notifyListeners();
    });
  }

  Future<void> addTransaction(String uid, TransactionModel txn) async {
    await _dbService.addTransaction(uid, txn);
  }
}
