// ==== Exercise 2 cusomize button
import 'package:flutter/material.dart';

//enum for icon position
enum IconPosition { left, right }

//enum for type of the buttons
enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(title: Text('Custom buttons'), backgroundColor: Colors.lightBlue),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomeButton(label: 'Submit', icon: Icons.check),
              CustomeButton(label: 'Time', icon: Icons.timer, buttonType: ButtonType.secondary, position: IconPosition.right),
              CustomeButton(label: 'Account', icon: Icons.account_balance_outlined, buttonType: ButtonType.disabled, position: IconPosition.right),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType buttonType;
  static const Color textColor = Color.fromARGB(255, 58, 68, 90);
  const CustomeButton({super.key, required this.label, required this.icon, this.position = IconPosition.left, this.buttonType = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: buttonType.color),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: position == IconPosition.left
              ? [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(icon, color: textColor),
                  ),
                  Text(label, style: TextStyle(color: textColor)),
                ]
              : [
                  Text(label, style: TextStyle(color: textColor)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(icon, color: textColor),
                  ),
                ],
        ),
      ),
    );
  }
}
