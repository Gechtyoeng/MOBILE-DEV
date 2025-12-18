import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

//Enum class for Expense type
enum ExpenseType {
  food(Icons.food_bank),
  travel(Icons.travel_explore),
  leisure(Icons.music_note),
  work(Icons.work);

  final IconData icon;
  const ExpenseType(this.icon);
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType expenseType;

  Expense({required this.title, required this.amount, required this.expenseType}) : id = uuid.v4(), date = DateTime.now();
  Expense.loadData({required this.id,required this.date, required this.amount, required this.expenseType, required this.title});
}
