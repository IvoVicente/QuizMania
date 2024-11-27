import 'package:flutter/material.dart';
import 'package:quizmania/models/question.dart';

class QuizProvider with ChangeNotifier{
  final _maxQuestionIndex = 9;
  int _currentQuestionIndex = 0;
  List<Question> _questions = [];
  //List<int>? _scoreList = [];
  int? totalScore;

  int get currentQuestionIndex => _currentQuestionIndex;
  List<Question> get questions => _questions;
  int get maxQuestionIndex => _maxQuestionIndex;

  void setQuestions(List<Question> questions){
    _questions = questions;
  }
}