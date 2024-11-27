import 'package:quizmania/models/question.dart';

class ApiResponse {
  final int responseCode;
  final List<Question> results;

  const ApiResponse({
    required this.responseCode,
    required this.results,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      responseCode: json['response_code'] as int,
      results: (json['results'] as List)
          .map((item) => Question.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}