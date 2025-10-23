import 'dart:convert';
import 'dart:io';

import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository({required this.filePath});

//this function use to save quiz to json file
  Future<void> writeQuiz(Quiz quiz) async {
    final file = File(filePath);
    final content = jsonEncode(quiz.toJson());
    await file.writeAsString(content);
  }

//load the quiz from json file
  Future<Quiz?> readQuiz() async {
    final file = File(filePath);
    if (!await file.exists()) return null; 

    final content = await file.readAsString();
    if (content.isEmpty) return null; // file is empty
    
    final data = jsonDecode(content);
    return Quiz.fromJson(data);
  }
}
