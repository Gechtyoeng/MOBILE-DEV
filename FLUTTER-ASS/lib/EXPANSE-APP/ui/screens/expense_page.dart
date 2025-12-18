import 'package:flutter/material.dart';
import '../../models/Expense.dart';
import '../widgets/expense_item.dart';
import '../screens/expense_form.dart';
import '../widgets/sumary_card.dart';

//stateful expanse app
class ExpenseApp extends StatefulWidget {
  final List<Expense> myExpanse;
  const ExpenseApp({super.key, required this.myExpanse});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<ExpenseType> categories = ExpenseType.values;

  void onAddClick(BuildContext context) async {
    Expense? newExpense = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );
    if (newExpense != null) {
      setState(() {
        widget.myExpanse.add(newExpense);
      });
    } else {
      print("created has been canceled");
    }
  }

  //function to calculate toatal price of each categories
  double getTotalByType(ExpenseType type) {
    double total = 0;

    for (final expense in widget.myExpanse) {
      if (expense.expenseType == type) {
        total += expense.amount;
      }
    }

    return total;
  }

  //remove the expense
  void removedExpense(int index) {
    final removedExpense = widget.myExpanse[index];

    setState(() {
      widget.myExpanse.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${removedExpense.title} deleted.'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              widget.myExpanse.insert(index, removedExpense);
            });
          },
        ),
      ),
    );
  }

  // use to fisplay when empty list
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.hourglass_empty, size: 60, color: Colors.grey),
          SizedBox(height: 10),
          Text('No expenses yet', style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  //use to display non-empty state
  Widget _buildNonEmptyList() {
    return Container(
      color: Colors.lightBlueAccent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Filter Box
            Container(
              height: 90,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SumaryCard(expenseType: category, totalAmount: getTotalByType(category)),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // List of items
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: widget.myExpanse.length,
                itemBuilder: (context, index) {
                  final expanse = widget.myExpanse[index];
                  return Dismissible(
                    key: ValueKey(expanse.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) => removedExpense(index),
                    child: ExpenseItem(expense: expanse),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Gechty - The Best Expense App'),
        actions: [IconButton(onPressed: () => onAddClick(context), icon: Icon(Icons.add))],
      ),
      body: widget.myExpanse.isEmpty ? _buildEmptyState() : _buildNonEmptyList(),
    );
  }
}
