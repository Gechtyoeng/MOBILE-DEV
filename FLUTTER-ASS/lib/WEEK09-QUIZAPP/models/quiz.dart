import 'package:uuid/uuid.dart';

var uuid = Uuid();

//class to store the question
class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point; //future

  Question({String? id, required this.title, required this.choices, required this.goodChoice, this.point = 1}) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'choices': choices, 'goodChoice': goodChoice, 'point': point};

  factory Question.fromJson(Map<String, dynamic> json) =>
      Question(id: json['id'], title: json['title'], choices: List<String>.from(json['choices']), goodChoice: json['goodChoice'], point: json['point']);
}

// class for answer
class Answer {
  final String id;
  final String answerChoice;
  final Question question;

  Answer({String? id, required this.answerChoice, required this.question}) : id = id ?? uuid.v4();

  bool isGoodAnswer() => answerChoice == question.goodChoice; //validate the answer

  Map<String, dynamic> toJson() => {'id': id, 'answerChoice': answerChoice, 'question': question.toJson()};

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(id: json['id'], answerChoice: json['answerChoice'], question: Question.fromJson(json['question']));
}

// class for player
class Player {
  final String id;
  final String name;

  Player({String? id, required this.name}) : id = id ?? uuid.v4();

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  factory Player.fromJson(Map<String, dynamic> json) => Player(id: json['id'], name: json['name']);
}

//class for the submission
class Submission {
  final String id;
  final Player player;
  final List<Answer> answers;

  Submission({String? id, required this.player, List<Answer>? answers}) : id = id ?? uuid.v4(), answers = answers ?? [];

  void addAnswer(Answer answer) => answers.add(answer); //add new answer

  //function to compute the total score
  double totalScore() {
    double score = 0;
    for (var answer in answers) {
      if (answer.isGoodAnswer()) {
        score += answer.question.point;
      }
    }
    return score;
  }

  Map<String, dynamic> toJson() => {'id': id, 'player': player.toJson(), 'answers': answers.map((a) => a.toJson()).toList()};

  factory Submission.fromJson(Map<String, dynamic> json) =>
      Submission(id: json['id'], player: Player.fromJson(json['player']), answers: (json['answers'] as List).map((a) => Answer.fromJson(a)).toList());
}

//class for the quiz
class Quiz {
  final String id;
  final List<Question> questions;
  final List<Submission> submissions;

  Quiz({String? id, required this.questions, List<Submission>? submissions}) : id = id ?? uuid.v4(), submissions = submissions ?? [];
  //function to compute the total score of the quiz based on total questions
  int questionTotalScore() {
    return questions.fold(0, (sum, q) => sum + q.point);
  }

  //function to add new submission
  void addSubmission(Submission submission) => submissions.add(submission);

  Map<String, dynamic> toJson() => {'id': id, 'questions': questions.map((q) => q.toJson()).toList(), 'submissions': submissions.map((s) => s.toJson()).toList()};

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    id: json['id'],
    questions: (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
    submissions: (json['submissions'] as List).map((s) => Submission.fromJson(s)).toList(),
  );
}
