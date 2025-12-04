import 'package:flutter/material.dart';
import 'result_screen.dart';
import 'welcome_screen.dart';
import 'question_screen.dart';
import 'history_screen.dart';
import '../../models/quiz.dart';

enum AppScreen { welcomeScreen, quizScreen, resultScreen, historyScreen }

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  AppScreen currentScreen = AppScreen.welcomeScreen;

  late Quiz quiz;
  late Player player;
  Submission? submission;

  @override
  void initState() {
    super.initState();
    // Load quiz data here (hardcoded or from repository)
    quiz = Quiz(
      questions: [
        Question(title: "What is Flutter?", choices: ["Framework", "Language", "IDE"], goodChoice: "Framework"),
        Question(title: "Who develops Dart?", choices: ["Google", "Microsoft", "Apple"], goodChoice: "Google"),
      ],
    );

    // Example player
    player = Player(name: "Gech");
  }

  void navigateTo(AppScreen screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentScreen) {
      case AppScreen.welcomeScreen:
        return WelcomeScreen(onStartQuiz: () => navigateTo(AppScreen.quizScreen), onHistory: () => navigateTo(AppScreen.historyScreen));

      case AppScreen.quizScreen:
        return QuestionScreen(
          quiz: quiz,
          player: player,
          onFinish: () {
            submission = quiz.submissions.last; // last submission
            navigateTo(AppScreen.resultScreen);
          },
        );

      case AppScreen.resultScreen:
        return ResultScreen(submission: submission!,quiz: quiz, onRestart: () => navigateTo(AppScreen.welcomeScreen), onHistory: () => navigateTo(AppScreen.historyScreen));

      case AppScreen.historyScreen:
        return HistoryScreen(onReturn: () => navigateTo(AppScreen.welcomeScreen));
    }
  }
}
