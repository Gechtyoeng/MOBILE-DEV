import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Custom buttons")),
      body: Center(child: Column(children: [CustomeButton(), const SizedBox(height: 10), CustomeButton(), const SizedBox(height: 10)])),
    ),
  ),
);

class CustomeButton extends StatefulWidget {
  const CustomeButton({super.key});

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  bool isclick = false;

  String get buttontext => isclick ? 'Selected' : 'Not Selected';
  Color get backgroundColor => isclick ? Colors.blue[500]! : Colors.blue[50]!;
  Color get textColor => isclick ? Colors.white : Colors.black;

  void handleClick() {
    setState(() {
      isclick = !isclick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: handleClick,
        child: Center(
          child: Text(buttontext, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
