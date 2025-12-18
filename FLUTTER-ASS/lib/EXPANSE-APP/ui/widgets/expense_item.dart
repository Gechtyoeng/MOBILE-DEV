//stateless expanse items
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/Expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  String get formatedDate => DateFormat('yyyy-MM-dd').format(expense.date);
  String get amount => expense.amount.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left side
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 5),
              Text('$amount \$', style: const TextStyle(color: Colors.green)),
            ],
          ),

          //right side
          Row(children: [Icon(expense.expenseType.icon), const SizedBox(width: 5), Text(formatedDate)]),
        ],
      ),
    );
  }
}
