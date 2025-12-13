import 'package:limo/features/matching_pairs/data/models/pair.dart';

class QuestionType6Model {
  final String questionType;
  final List<PairWords> pairs;

  QuestionType6Model({
    required this.questionType,
    required this.pairs,
  });

  factory QuestionType6Model.fromFirestore(Map<String, dynamic> json) {
    return QuestionType6Model(
      questionType: json['question_type'] ?? '',
      pairs: (json['pairs'] as List<dynamic>?)?.map((e) {
        return PairWords(
          en: e['en'].toString(),
          ar: e['ar'].toString(),
        );
      }).toList() ?? [],
    );
  }
}

