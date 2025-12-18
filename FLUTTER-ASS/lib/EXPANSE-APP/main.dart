import 'package:flutter/material.dart';
import './ui/screens/expense_page.dart';
import './data/expense_data.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ExpenseApp(myExpanse: myexpanse)));
}
