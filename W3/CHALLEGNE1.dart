//code the DOMAIN from the UML class
class Question {
  final String title;
  final List<String> chioces;
  final String goodChoice;

  Question({required this.title, required this.chioces, required this.goodChoice});
}

class Answer {
  final Question question;
  final String answerChioce;

  Answer({required this.question, required this.answerChioce});

  //check if the answer is correct
  bool isGoodAnswer () => this.answerChioce == this.question.goodChoice;
}

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz(this.questions) : answers = [];

  //add aswer to a quiz
  void addAnswer(Question question, String answer) {
    var newAnswer = Answer(question: question, answerChioce: answer);
    answers.add(newAnswer);
  }
  //get the total score 
  int getTotalScore() {
    int totalScore = 0;
    for(var answer in answers) {
      if(answer.isGoodAnswer()) totalScore++;
    }
    return totalScore;
  }

}
