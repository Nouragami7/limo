import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/question.dart';

class QuestionsRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllRawQuestions() async {
    final snapshot = await firestore.collection('Test_Questions').get();
    print('FIRESTORE DOCS = ${snapshot.docs.length}');

    return snapshot.docs.map((e) => e.data()).toList();
  }
}

