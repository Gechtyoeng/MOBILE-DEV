import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  //add point attribute to the question default = 1
  int point;

  Question({String? id, required this.title, required this.choices, required this.goodChoice, this.point = 1}) : id = id ?? uuid.v4(); //generate id if not contain id

  // Convert to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'choices': choices,
        'goodChoice': goodChoice,
        'point': point,
      };

  // Convert from JSON
  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        title: json['title'],
        choices: List<String>.from(json['choices']),
        goodChoice: json['goodChoice'],
        point: json['point'],
      );
}

class Answer {
  final String id;
  final Question question;
  final String answerChoice;

  Answer({String? id, required this.question, required this.answerChoice}) : id = id ?? uuid.v4();

  //return true if the answer is correct
  bool isGood() => answerChoice == question.goodChoice;

  //convert to Json
  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question.toJson(),
        'answerChoice': answerChoice,
      };

  //convert from Json
  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(id: json['id'], question: Question.fromJson(json['question']), answerChoice: json['answerChoice']);
  }
}

//class for multiple players
class Player {
  final String id;
  final String name;
  final List<Answer> answers;

  Player({String? id, required this.name, List<Answer>? answers})
      : id = id ?? uuid.v4(),
        answers = answers ?? [];

  //add the answer for the player
  void addAnswer(Answer asnwer) => answers.add(asnwer);
  //clear answer for the player
  void clearAnswer() => answers.clear();

  //return the total score of the answers
  double getTotalScore() {
    double totalSCore = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalSCore += answer.question.point;
      }
    }
    return totalSCore;
  }

  //get answer by id
  Answer? getAnswerById(String id) {
    for (var a in answers) {
      if (a.id == id) return a;
    }
    return null; //return null if not found
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }

  // Constructor for loading from JSON
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      answers: (json['answers'] as List).map((a) => Answer.fromJson(a)).toList(),
    );
  }
}

class Quiz {
  final String id;
  final List<Question> questions;
  final List<Player> players;

  Quiz({String? id, required this.questions, required this.players}) : id = id ?? uuid.v4();

  //getter for id
  String get quizId => this.id;

  //funtion to add more player
  void addPlayer(Player newPlayer) => players.add(newPlayer);

  //return all the questions total score
  int questionTotalScores() {
    int totalQScore = 0;
    for (var question in this.questions) {
      totalQScore += question.point;
    }
    return totalQScore;
  }

  // return the total score in percentage
  double getScoreInPercentage(Player player) {
    return (player.getTotalScore() / questionTotalScores()) * 100;
  }

  //display all the players score
  void displayPlayerScore() {
    for (var player in this.players) {
      print('Player: ${player.name}\t\tScore: ${player.getTotalScore()}');
    }
  }

  //function to return player if exist and null if not
  Player? ifPlayerExist(String name) {
    for (var player in this.players) {
      if (player.name == name) {
        return player;
      }
    }
    return null;
  }

  //get question by id
  Question? getQuestionById(String id) {
    for (var q in questions) {
      if (q.id == id) return q;
    }
    return null;//return null id question not exist
  }

  // Convert to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'questions': questions.map((q) => q.toJson()).toList(),
        'players': players.map((p) => p.toJson()).toList(),
      };

  // Convert from JSON
  factory Quiz.fromJson(Map<String, dynamic> data) {
    var questionsJson = data['questions'] as List;
    var playersJson = data['players'] as List;
    return Quiz(
      id: data['id'],
      questions: questionsJson.map((q) => Question.fromJson(q)).toList(),
      players: playersJson.map((p) => Player.fromJson(p)).toList(),
    );
  }
}
