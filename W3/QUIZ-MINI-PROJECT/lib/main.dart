import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() async {
  final repo = QuizRepository(filePath: '../quiz_Data.json');
  Quiz quiz = await repo.readQuiz();

  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();
  await repo.writeQuiz(quiz);
}
