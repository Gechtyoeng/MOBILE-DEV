import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

main() {
  group('Quiz Test', () {
    // Create 2 questions and the quiz
    Question q1 = Question(title: "2+2", choices: ["1", "2", "4"], goodChoice: "4", point: 5);

    Question q2 = Question(title: "2+3", choices: ["1", "2", "5"], goodChoice: "5", point: 4);

    Player player = Player(name: "Gechty");

    Quiz quiz = Quiz(questions: [q1, q2], players: []);

    test('All answers are good (100%)', () {
      // Create the answer here
      player.addAnswer(Answer(question: q1, answerChoice: '4'));
      player.addAnswer(Answer(question: q2, answerChoice: '5'));

      expect(player.getTotalScore(), equals(9.00));
      expect(quiz.getScoreInPercentage(player), equals(100.00));
    });

    test('overwrite the score', () {
      player.clearAnswer();
      player.addAnswer(Answer(question: q1, answerChoice: '2'));
      player.addAnswer(Answer(question: q2, answerChoice: '2'));

      // Check something
      expect(player.getTotalScore(), equals(0.00));
      expect(quiz.getScoreInPercentage(player), equals(0.00));
    });

    test('check if the player exist and return player if exist', () {
      quiz.addPlayer(player);

      // Check something
      expect(quiz.ifPlayerExist("Gechty")?.name, player.name);
      expect(quiz.ifPlayerExist("Haha"), null);
    });
  });
}
