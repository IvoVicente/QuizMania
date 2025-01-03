import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizmania/models/question.dart';

class OpenTriviaApiService {
  final String baseUrl = 'https://opentdb.com/api.php?';

  Future<List<Question>> fetchQuestions(int category, String difficulty) async{
    const int amount = 10;

    final String finalUrl = 
    '${baseUrl}amount=$amount&category=$category&difficulty=$difficulty&type=multiple';

    try{
      final response = await http.get(Uri.parse(finalUrl));
      if(response.statusCode == 200){
        return _parseQuestions(response.body);
      } else {
        throw Exception('Problema no acesso. Status: ${response.statusCode}');
      }
    } catch (e){
      throw Exception('Não foi possível acessar a API. Erro: $e');
    }
  }

  List<Question> _parseQuestions(String responseBody) {
    var data = json.decode(responseBody);
    List<dynamic> results = data['results'];

    List<Question> questions = results.map<Question>((item) {
      var allAnswers = _decodeList(List<String>.from(item['incorrect_answers']));
      allAnswers.add(_decodeText(item['correct_answer']));
      allAnswers.shuffle();

      return Question(
        type: item['type'],
        difficulty: item['difficulty'],
        category: item['category'],
        question: _decodeText(item['question']),
        correctAnswer: _decodeText(item['correct_answer']),
        allAnswers: allAnswers,
      );
    }).toList();

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
               .replaceAll('&gt;', '>')
               .replaceAll('&pi;', 'π')
               .replaceAll('&sup2;', '²')
               .replaceAll('&rsquo;', '’')
               .replaceAll('&ouml;', 'ö')
               .replaceAll('&Eacute;', 'É');
  }

  List<String> _decodeList(List<String> list){
    for (int i = 0; i < list.length; i++){
      list[i] = _decodeText(list[i]);
    }
    return list;
  }

}