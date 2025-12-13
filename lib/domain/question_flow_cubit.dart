import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/domain/question_flow_state.dart';

import '../data/model/question.dart';
import '../data/repositories/questions_repo.dart';
import '../features/listening1/data/models/question1_model.dart';
import '../features/listening12/data/models/question12_model.dart';

class QuestionFlowCubit extends Cubit<QuestionFlowState> {
  final QuestionsRepository repo;

  List<Map<String, dynamic>> questions = [];
  int index = 0;

  QuestionFlowCubit(this.repo) : super(QuestionFlowInitial());

  Future<void> start() async {
    emit(QuestionFlowLoading());

    questions = await repo.getAllRawQuestions();
    index = 0;

    _emitCurrentQuestion();
      print("MODELS COUNT = ${questions.length}");

  }

  void next() {
    index++;
    if (index < questions.length) {
      _emitCurrentQuestion();
    } else {
      emit(QuestionFlowFinished());
    }
  }

  void _emitCurrentQuestion() {
    final data = questions[index];
    final type = data['question_type'];
    print('QUESTION TYPE = ${type}');

    switch (type) {
      case "TYPE1-2":
        emit(
          ShowQuestionType12(
            QuestionType12Model.fromMap(data),
          ),
        );
        break;

      case "TYPE1":
        emit(
          ShowQuestionType1(
            QuestionType1Model.fromFirestore(data),
          ),
        );
        break;

      default:
        emit(QuestionFlowError("Unknown question type"));
    }
  }
}
