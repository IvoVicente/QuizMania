import 'dart:convert';
import 'package:http/http.dart' as http;

class TriviaApiService {
  final String baseUrl = 'https://opentdb.com/api.php?';

  Future<dynamic> getApiResponse(int category, String difficulty) async{
    const int amount = 10;

    final String finalUrl = '${baseUrl}amount=$amount&category=$category&difficulty=$difficulty';

    try{
      final response = await http.get(Uri.parse(finalUrl));
      if(response.statusCode == 200){
        return json.decode(response.body);
      } else {
        throw Exception('Dados não encontrados');
      }
    } catch (e){
      throw Exception('Não foi possível acessar a API');
    }
  }
}