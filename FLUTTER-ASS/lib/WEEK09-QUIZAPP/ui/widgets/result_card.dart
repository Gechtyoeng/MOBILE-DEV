import 'package:flutter/material.dart';
import '../../models/quiz.dart';

class ResultCard extends StatelessWidget {
  final int quiestionIdentifier;
  final bool iscorrect;
  final Question question;

  const ResultCard({super.key, required this.question, required this.quiestionIdentifier, required this.iscorrect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$quiestionIdentifier . ${question.title}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        for (var choice in question.choices)
          Row(
            children: [
              Icon(iscorrect ? Icons.check_circle : Icons.circle_outlined, color: choice == question.goodChoice ? Colors.green : Colors.grey, size: 20),
              const SizedBox(width: 8),
              Text(choice, style: TextStyle(fontSize: 16, color: choice == question.goodChoice ? Colors.green : Colors.black)),
            ],
          ),
      ],
    );
  }
}
