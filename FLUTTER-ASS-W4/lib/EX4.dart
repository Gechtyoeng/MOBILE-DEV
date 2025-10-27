import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomCard(text: 'OOP', firstColor: Colors.blue[100]!, secondColor: Colors.blue[300]!),
            CustomCard(text: 'DART', firstColor: Colors.blue[300]!, secondColor: Colors.blue[600]!),
            CustomCard(text: 'FLUTTER', firstColor: Colors.blue[600]!, secondColor: Colors.blue[900]!),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color firstColor;
  final Color secondColor;
  const CustomCard({super.key, required this.text, required this.firstColor, required this.secondColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [firstColor, secondColor]),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
