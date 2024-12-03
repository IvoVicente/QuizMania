class Question {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<dynamic> allAnswers;

  const Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.allAnswers,
  });

/*   factory Question.fromJson(Map<String, dynamic> json) {
    List<String> allAnswers = List<String>.from(json['incorrect_answers']);
    allAnswers.add(json['correct_answer'] as String);
    
    return Question(
      type: json['type'] as String,
      difficulty: json['difficulty'] as String,
      category: json['category'] as String,
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      allAnswers: List<String>.from(json['incorrect_answers']),
    );
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
  } */
}