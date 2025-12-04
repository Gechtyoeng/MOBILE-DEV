// quiz app welcome screen
import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStartQuiz; //call back function for start button
  final VoidCallback onHistory;
  const WelcomeScreen({super.key, required this.onStartQuiz, required this.onHistory});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300],
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset('assets/quiz-logo.png', height: 150, fit: BoxFit.contain)),
          const SizedBox(height: 30),
          Button(title: 'Start Quiz', onButtonClick: onStartQuiz),
          const SizedBox(height: 20),
          Button(title: 'History', onButtonClick: onHistory),
        ],
      ),
    );
  }
}
