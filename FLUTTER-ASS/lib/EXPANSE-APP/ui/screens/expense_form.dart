import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/Expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  late TextEditingController _titleController;
  late TextEditingController _valueController;
  late ExpenseType type;
  DateTime? selectedDate = DateTime.now();

  //date picker form
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context, initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2030)
    );

    if (pickedDate == null) return;
    setState(() {
      selectedDate = pickedDate;
    });
  }

  //create new expense
  void onCreate() {
    if (_titleController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: const SingleChildScrollView(child: Text('The title cannot be empty.')),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    Expense? newExpense = Expense(title: _titleController.text, amount: double.parse(_valueController.text), expenseType: type);
    Navigator.pop<Expense>(context, newExpense);
  }

  //cancle the from
  void onCancel() {
    Navigator.pop<Expense>(context, null);
  }

  //function to create new widget
  void createNewExpense(String title, String value) {
    double doubleValue = double.parse(value);
    Expense(title: title, amount: doubleValue, expenseType: ExpenseType.food); //testing default as food
  }
  
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _valueController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
        child: Column(
          children: [
            SizedBox(
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'title'),
                maxLength: 50,
              ),
            ),
            SizedBox(
              child: TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))],
                // onChanged: (v) => value = double.parse(v),
                decoration: InputDecoration(labelText: 'value', prefixText: '\$'),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<ExpenseType>(
                    width: 400,
                    initialSelection: ExpenseType.food,
                    label: const Text('Select Type', style: TextStyle(fontSize: 12)),
                    dropdownMenuEntries: ExpenseType.values.map((type) => DropdownMenuEntry<ExpenseType>(label: type.name, value: type)).toList(),
                    onSelected: (value) => {
                      setState(() {
                        type = value!;
                      }),
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () => {_selectDate()},
                    icon: const Icon(Icons.date_range, color: Colors.white),
                    style: TextButton.styleFrom(backgroundColor: Colors.grey, padding: EdgeInsets.all(20)),
                    label: Text(selectedDate == null ? "Select Date" : "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(onPressed: onCreate, child: Text("Create")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
