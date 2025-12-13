class QuestionType12Model {
  final String question;
  final String questionType;
  final List<String> options;
  //final String correctAnswer;

  QuestionType12Model({
    required this.question,
    required this.questionType,
    required this.options,
   // required this.correctAnswer,
  });

  factory QuestionType12Model.fromMap(Map<String, dynamic> map) {
    return QuestionType12Model(
      question: map['question'] as String,
      questionType: map['question_type'] as String,
      options: List<String>.from(map['options']),
    //  correctAnswer: map['correct_answer'] as String,
    );
  }
}
