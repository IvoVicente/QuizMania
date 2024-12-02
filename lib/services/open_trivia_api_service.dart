import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizmania/models/question.dart';

class OpenTriviaApiService {
  final String baseUrl = 'https://opentdb.com/api.php?';

  Future<List<Question>> fetchQuestions(int category, String difficulty) async{
    const int amount = 10;

    final String finalUrl = '${baseUrl}amount=$amount&category=$category&difficulty=$difficulty&type=multiple';

    print(finalUrl);

    try{
      print('aqui');
      Uri uri = Uri.parse(finalUrl);
      print(uri);
      final response = await http.get(Uri.parse(finalUrl));
      print(response.body);
      if(response.statusCode == 200){
        print('reponse funcionou');
        /* var data = json.decode(response.body);

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
          print('Tipo: ${item['type']}');
          String difficulty = '${item['difficulty']}';
          print('Dificuldade: ${item['difficulty']}');
          String category = '${item['category']}';
          print('Categoria: ${item['category']}');
          String question = '${item['question']}';
          print('Questão: ${item['question']}');
          String correctAnswer = 'Resposta correta: ${item['correct_answer']}';
          List<dynamic> incorrectAnswers = List<dynamic>.from(item['incorrect_answers']);

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

        for (var question in questions){
          print(question);
        }

        return questions; */
        return _parseQuestions(response.body);
      } else {
        throw Exception('Dados não encontrados. Status: ${response.statusCode}');
      }
    } catch (e){
      throw Exception('Não foi possível acessar a API. Erro: $e');
    }
  }

  List<Question> _parseQuestions(String responseBody) {
    var data = json.decode(responseBody);
    List<dynamic> results = data['results'];

    List<Question> questions = results.map<Question>((item) {
      return Question(
        type: item['type'],
        difficulty: item['difficulty'],
        category: item['category'],
        question: _decodeText(item['question']),
        correctAnswer: _decodeText(item['correct_answer']),
        incorrectAnswers: _decodeList(List<String>.from(item['incorrect_answers'])),
      );
    }).toList();

    /* for (var question in questions) {
      print('A questão ${question} .incorrectAnswers.length');
    } */

   for (int i = 0; i < questions.length; i++){
    print('A questão ${i} tem ${questions[i].incorrectAnswers.length} respostas incorretas');
   }

    return questions;
  }

  String _decodeText(String text){
    return text.replaceAll('&quot;', '"')
               .replaceAll('&#039;', "'")
               .replaceAll('&amp;', '&')
               .replaceAll('&eacute;', 'é')
               .replaceAll('&aacute;', 'á')
               .replaceAll('&uacute;', 'ú')
               .replaceAll('&lt;', '<')
               .replaceAll('&gt;', '>');
  }

  List<String> _decodeList(List<String> list){
    for (int i = 0; i < list.length; i++){
      list[i] = _decodeText(list[i]);
    }
    return list;
  }

}