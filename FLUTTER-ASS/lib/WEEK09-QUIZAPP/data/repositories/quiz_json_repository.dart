import 'dart:convert';
import 'dart:io';

import '../../models/quiz.dart'; 

class QuizRepository {
  final String filePath;

  QuizRepository({required this.filePath});

  /// Save the quiz to a JSON file
  Future<void> writeQuiz(Quiz quiz) async {
    final file = File(filePath);
    final encoder = JsonEncoder.withIndent('  ');
    final content = encoder.convert(quiz.toJson());
    await file.writeAsString(content);
  }

  /// Load the quiz from a JSON file
  Future<Quiz> readQuiz() async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('File path does not exist.');
    }

    final content = await file.readAsString();
    if (content.isEmpty) {
      throw Exception('Content is empty.');
    }

    final data = jsonDecode(content);
    return Quiz.fromJson(data); 
  }
}
