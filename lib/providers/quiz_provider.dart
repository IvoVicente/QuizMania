import 'package:flutter/material.dart';
import 'package:quizmania/models/question.dart';

class QuizProvider with ChangeNotifier{
  final _maxQuestionIndex = 9;
  int _currentQuestionIndex = 0;
  List<Question> _questions = [];
  int _score = 0;
  List<int> answers = [];

  int get currentQuestionIndex => _currentQuestionIndex;
  List<Question> get questions => _questions;
  int get maxQuestionIndex => _maxQuestionIndex;
  int get score => _score;

  void updateQuestions(List<Question> questions) {
      _questions = questions;
  }

  void updateCurrentQuestionIndex(){
    if(_currentQuestionIndex < _maxQuestionIndex){
      _currentQuestionIndex++;
    } 
  }

  void restartCurrentQuestionIndex(){
    _currentQuestionIndex = 0;
  }

  void updateAnswers(int answerIndex){
    answers.add(answerIndex);
  }

  void updateScore(){
    _score += 10;
  }
}