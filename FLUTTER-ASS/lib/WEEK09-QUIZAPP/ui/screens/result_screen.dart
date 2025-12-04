import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../../models/quiz.dart';
import '../widgets/result_card.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart; // call when user want to restart the quiz
  final VoidCallback onHistory;
  final Submission submission;
  final Quiz quiz;
  const ResultScreen({super.key, required this.onRestart, required this.onHistory, required this.submission, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final totalScore = submission.totalScore();
    final maxScore = quiz.questionTotalScore();

    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.blue[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answered ${totalScore.toInt()} on $maxScore!",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Question breakdown
          Expanded(
            child: ListView.builder(
              itemCount: submission.answers.length,
              itemBuilder: (context, index) {
                final answer = submission.answers[index];
                final question = answer.question;
                final isCorrect = answer.isGoodAnswer();

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ResultCard(question: question, quiestionIdentifier: index, iscorrect: isCorrect),
                );
              },
            ),
          ),

          const SizedBox(height: 20),
          Button(title: "Restart", onButtonClick: onRestart),
          const SizedBox(height: 10),
          Button(title: "View History", onButtonClick: onHistory),
        ],
      ),
    );
  }
}
