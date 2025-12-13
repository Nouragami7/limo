import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/model/question.dart';

// class QuestionsRepository {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   Future<List<Map<String, dynamic>>> getAllRawQuestions() async {
//     final snapshot = await firestore.collection('Test_Questions').get();
//     print('FIRESTORE DOCS = ${snapshot.docs.length}');
//
//     return snapshot.docs.map((e) => e.data()).toList();
//   }
// }

class QuestionsRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllRawQuestions() async {
    final snapshot =
    await firestore.collection('Test_Questions').get();

    final filtered = snapshot.docs
        .map((e) => e.data())
        .where((data) =>
    data.containsKey('question') &&
        data['question'] != null &&
        data['question'].toString().isNotEmpty)
        .toList();

    print('FIRESTORE DOCS = ${filtered.length}');
    return filtered;
  }
}
