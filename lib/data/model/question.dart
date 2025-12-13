class QuestionModel {
  final String id;
  final String questionType;
  final String? question;
  final List<OptionModel>? options;
  final Map<String, dynamic> extraFields;

  QuestionModel({
    required this.id,
    required this.questionType,
    this.question,
    this.options,
    required this.extraFields,
  });

  factory QuestionModel.fromMap(String id, Map<String, dynamic> data) {
    return QuestionModel(
      id: id,
      questionType: data['question_type'] ?? '',
      question: data['question'],
      options: data['options'] != null
          ? (data['options'] as List<dynamic>)
          .map((e) => OptionModel.fromMap(e))
          .toList()
          : null,
      extraFields: data,
    );
  }
}

class OptionModel {
  final String img;
  final String option;

  OptionModel({required this.img, required this.option});

  factory OptionModel.fromMap(Map<String, dynamic> data) {
    return OptionModel(
      img: data['img'] ?? '',
      option: data['option'] ?? '',
    );
  }
}
