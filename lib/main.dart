import 'package:finance_tracker_app/providers/auth_provider.dart';
import 'package:finance_tracker_app/providers/budget_provider.dart';
import 'package:finance_tracker_app/providers/transaction_provider.dart'; // <-- Import this
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TransactionProvider()), // <-- Add this
        ChangeNotifierProvider(create: (_) => BudgetProvider()),

      ],
      child: MaterialApp.router(
        title: 'Finance Tracker',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
