import 'package:flutter/material.dart';
import '../widgets/answer_card.dart';
import '../../models/quiz.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final void Function(String choice) onAnswer;

  const QuestionCard({super.key, required this.question, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(question.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          for (var choice in question.choices)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AnswerCard(answer: choice, isSelected: false, onTap: () => onAnswer(choice)),
            ),
        ],
      ),
    );
  }
}
