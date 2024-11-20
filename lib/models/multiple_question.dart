import 'package:quizmania/models/question.dart';

class MultipleQuestion extends Question {
  String correctAnswer;
  List<String> incorrectAnswers;

  MultipleQuestion(String text, this.correctAnswer, this.incorrectAnswers)
      : super(text);
}
