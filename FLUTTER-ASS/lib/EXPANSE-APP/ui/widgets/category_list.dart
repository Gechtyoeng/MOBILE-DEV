import 'package:flutter/material.dart';
import '../../models/Expense.dart';

class CategoryList extends StatelessWidget {
  final List<Expense> expense;
  const CategoryList({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row());
  }
}

class CategoryCard extends StatelessWidget {
  final List<Expense> expense;
  final ExpenseType category;
  const CategoryCard({super.key, required this.expense, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}