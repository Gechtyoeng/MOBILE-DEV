//contain the mian quiz app
// handle multiple screens
import 'package:flutter/material.dart';
import 'ui/screens/quiz_App.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: QuizApp()
      ),
    ),
  );
}
