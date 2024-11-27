import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quizmania/models/api_response.dart';
import 'package:quizmania/models/question.dart';

class OpenTriviaApiService {
  final String baseUrl = 'https://opentdb.com/api.php?';

  Future<List<Question>> fetchQuestions(int category, String difficulty) async{
    const int amount = 10;

    final String finalUrl = '${baseUrl}amount=$amount&category=$category&difficulty=$difficulty';

    print(finalUrl);

    try{
      print('aqui');
      Uri uri = Uri.parse(finalUrl);
      print(uri);
      final response = await http.get(Uri.parse(finalUrl));
      print(response.body);
      if(response.statusCode == 200){
        print('reponse funcionou');
        var data = json.decode(response.body);

        print('O result é: ${data['results']}');

        List<dynamic> results = data['results'];

        print('Result convertido: $results');

        print(results[1]['type']);
        print(results.length);

        List<Question> questions = [];

        for (int i=0; i < results.length; i++){
          print(results[i]);

          var item = results[i];
          String type = '${item['type']}';
          print('${item['type']}');
          String difficulty = '${item['difficulty']}';
          print('${item['difficulty']}');
          String category = '${item['category']}';
          print('${item['category']}');
          String question = '${item['question']}';
          print('${item['question']}');
          String correctAnswer = '${item['correct_answer']}';
          List<String> incorrectAnswers = List<String>.from(item['incorrect_answers']);

          questions.add(
            Question(
              type: type,
              difficulty: difficulty,
              category: category,
              question: question,
              correctAnswer: correctAnswer,
              incorrectAnswers: incorrectAnswers
            )
          );
        }

/*         for (var item in results) {

          questions.add(
            Question(
              type: (item['type'] as String),
              difficulty: (item['difficulty']) as String,
              category: (item['category']) as String,
              question: (item['question']) as String,
              correctAnswer: (item['correctAnswer']) as String,
              incorrectAnswers: List<String>.from(item['incorrectAnswers'])
              )
          );
            
          String type = item['type'];
          String difficulty = item['difficulty'];
          String category = item['category'];
          String question = item['question'];
          String correctAnswer = item['correctAnswer'];
          List<String> incorrectAnswers = List<String>.from(item['incorrectAnswers']);

          print('A questão é: $question');
        } */

        for (var question in questions){
          print(question);
        }

        return questions;
      } else {
        throw Exception('Dados não encontrados');
      }
    } catch (e){
      throw Exception('Não foi possível acessar a API. Erro: $e');
    }
  }

/*   List<Question> parseQuestions(String responseBody){
    Map<String, dynamic> data = json.decode(responseBody);
    List<Question> questions = [];
    var lista = data['results'];
    print(lista);
    return questions;
  } */
}