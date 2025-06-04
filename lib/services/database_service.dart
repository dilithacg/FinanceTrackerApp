import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTransaction(String uid, TransactionModel txn) async {
    final ref = _db.collection('users').doc(uid).collection('transactions').doc(txn.id);
    await ref.set(txn.toMap());
  }

  Stream<List<TransactionModel>> getTransactions(String uid) {
    return _db
        .collection('users')
        .doc(uid)
        .collection('transactions')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => TransactionModel.fromMap(doc.data()))
        .toList());
  }
}
