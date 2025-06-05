import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../const/colors.dart';
import '../../providers/transaction_provider.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;

    // Group expenses by category
    Map<String, double> dataMap = {};
    for (var txn in transactions) {
      if (txn.type == 'expense') {
        dataMap[txn.category] = (dataMap[txn.category] ?? 0) + txn.amount;
      }
    }

    final pieSections = dataMap.entries.map((entry) {
      final color = _getColor(entry.key);
      return PieChartSectionData(
        value: entry.value,
        title: '${entry.key}\n${entry.value.toStringAsFixed(0)}',
        color: color,
        titleStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        radius: 80,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Reports"),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryLight,
                AppColors.primaryDark,],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade50, Colors.grey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: dataMap.isEmpty
              ? _buildEmptyState()
              : _buildChartWithLegend(dataMap, pieSections),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.pie_chart_outline,
          size: 64,
          color: Colors.grey.shade400,
        ),
        const SizedBox(height: 16),
        Text(
          'No expenses yet',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildChartWithLegend(
      Map<String, double> dataMap, List<PieChartSectionData> pieSections) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Expense Breakdown',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    sections: pieSections,
                    centerSpaceRadius: 60,
                    sectionsSpace: 2,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildCategoryChips(dataMap),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips(Map<String, double> dataMap) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: dataMap.entries.map((entry) {
        return Chip(
          backgroundColor: _getColor(entry.key),
          label: Text(
            '${entry.key}: ${entry.value.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }

  Color _getColor(String key) {
    final colors = [
      Colors.blueAccent.shade700,
      Colors.redAccent.shade700,
      Colors.green.shade700,
      Colors.orange.shade700,
      Colors.purple.shade700,
      Colors.teal.shade700,
    ];
    return colors[key.hashCode % colors.length];
  }
}