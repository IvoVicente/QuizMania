import 'package:quizmania/models/question.dart';

class BooleanQuestion extends Question {
  bool correctAnswer;

  BooleanQuestion(String text, this.correctAnswer) : super(text);
}
