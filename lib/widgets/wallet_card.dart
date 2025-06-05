import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final double remaining;
  final double budget;

  const WalletCard({
    super.key,
    required this.remaining,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    final percent = budget > 0 ? (remaining / budget).clamp(0, 1).toDouble() : 0.0;



    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.teal.shade600,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Remaining Budget',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              ' \$ ${remaining.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.white24,
              color: Colors.greenAccent,
              minHeight: 8,
            ),
            const SizedBox(height: 6),
            Text(
              'Used: ${(100 - (percent * 100)).toStringAsFixed(1)}%',
              style: const TextStyle(color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }
}
