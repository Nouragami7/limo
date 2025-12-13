import 'package:limo/data/model/word.dart';

class QuestionType5Model {
  final String correctFullAnswer;
  final List<Word> initialWords;
  final String question;
  final String questionType;

  QuestionType5Model({
    required this.correctFullAnswer,
    required this.initialWords,
    required this.question,
    required this.questionType,
  });

  factory QuestionType5Model.fromJson(Map<String, dynamic> json) {
    final words = (json['initialWords'] as List)
        .map((e) => Word(e as String))
        .toList();

    return QuestionType5Model(
      correctFullAnswer: json['correctFullAnswer'] as String,
      initialWords: words,
      question: json['question'] as String,
      questionType: json['question_type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'correctFullAnswer': correctFullAnswer,
      'initialWords': initialWords,
      'question': question,
      'question_type': questionType,
    };
  }
}
