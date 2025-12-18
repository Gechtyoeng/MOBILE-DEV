import 'package:flutter/material.dart';
import '../../models/Expense.dart';

// sumary card for the categories
class SumaryCard extends StatelessWidget {
  final ExpenseType expenseType;
  final double totalAmount;
  const SumaryCard({super.key, required this.expenseType, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue),

      child: Column(
        children: [
          Icon(expenseType.icon, color: Colors.white),
          SizedBox(height: 5),
          Text('$totalAmount \$', style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
