import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() async {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Enter your name: ');
      String? nameInput = stdin.readLineSync();

      //check if player does not input name
      if (nameInput == null || nameInput.trim().isEmpty) {
        print('--- Quiz Finished ---');
        break;
      }

      nameInput = nameInput.trim();
      //check if player  exist or not
      Player? existPlayer = quiz.ifPlayerExist(nameInput);
      Player curPlayer;

      if (existPlayer != null) {
        existPlayer.clearAnswer();
        curPlayer = existPlayer; //assign the existed player to current player
      } else {
        curPlayer = Player(name: nameInput);
        quiz.addPlayer(curPlayer);
      }

      //display all the questions
      for (var question in quiz.questions) {
        print('Question: ${question.title}  - (${question.point} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          curPlayer.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      double scoreInPercentage = double.parse(quiz.getScoreInPercentage(curPlayer).toStringAsFixed(2));
      print('${curPlayer.name}, Your score in percentage: $scoreInPercentage %');
      print('${curPlayer.name}, Your score in point: ${curPlayer.getTotalScore()}.');
      //display all the player
      quiz.displayPlayerScore();
    }
  }
}
