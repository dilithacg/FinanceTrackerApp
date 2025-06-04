import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/budget_model.dart';

class BudgetService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> setBudget(String uid, BudgetModel budget) async {
    final ref = _db.collection('users').doc(uid).collection('budget').doc('monthly');
    await ref.set(budget.toMap());
  }

  Future<BudgetModel?> getBudget(String uid) async {
    final ref = _db.collection('users').doc(uid).collection('budget').doc('monthly');
    final doc = await ref.get();
    if (doc.exists) {
      return BudgetModel.fromMap(doc.data()!);
    }
    return null;
  }
}
