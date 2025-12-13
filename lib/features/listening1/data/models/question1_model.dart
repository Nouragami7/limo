class QuestionType1Model {
  final String question;
  final String questionType;
  final List<Map<String, String>> options;
final String correctAnswer;

  QuestionType1Model({
    required this.question,
    required this.questionType,
    required this.options, required this.correctAnswer,
  });

  factory QuestionType1Model.fromFirestore(Map<String, dynamic> json) {
    return QuestionType1Model(
      question: json['question'],
      questionType: json['question_type'],
      options: (json['options'] as List)
          .map<Map<String, String>>((e) => {
        'option': e['option'].toString(),
        'img': e['img'].toString(),
      })
          .toList(), correctAnswer: json['correctAnswer'],
    );
  }
}
