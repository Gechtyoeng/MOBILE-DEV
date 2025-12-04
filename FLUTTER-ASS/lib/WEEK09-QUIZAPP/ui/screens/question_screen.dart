import 'package:flutter/material.dart';
import '../widgets/question_card.dart';
import '../../models/quiz.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final Player player;
  final VoidCallback onFinish;

  const QuestionScreen({super.key, required this.quiz, required this.player, required this.onFinish});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;
  late Submission submission;

  @override
  void initState() {
    super.initState();
    submission = Submission(player: widget.player);
  }

  void _handleAnswer(String choice) {
    final question = widget.quiz.questions[currentIndex];
    submission.addAnswer(Answer(answerChoice: choice, question: question));

    if (currentIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // quiz finished
      widget.quiz.addSubmission(submission);
      widget.onFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Question ${currentIndex + 1}"), backgroundColor: Colors.blue[300]),
      body: QuestionCard(question: widget.quiz.questions[currentIndex], onAnswer: _handleAnswer),
    );
  }
}

