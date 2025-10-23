import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() async {
  final repo = QuizRepository(filePath: '../quiz_Data.json');
  Quiz? quiz = await repo.readQuiz();

if(quiz == null){
  List<Question> questions = [
  Question(title: "Capital of France?", choices: ["Paris", "London", "Rome"], goodChoice: "Paris", point: 5),
  Question(title: "2 + 2 = ?", choices: ["2", "4", "5"], goodChoice: "4", point: 4),
  ];

  List<Player> players = [];

  quiz = Quiz(questions: questions, players: players);
}

  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();
  await repo.writeQuiz(quiz);
}
