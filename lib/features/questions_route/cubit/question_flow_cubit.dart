import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/features/questions_route/cubit/question_flow_state.dart';

import '../../../data/model/question.dart';
import '../../listeningbubbles/data/models/question_type5_model.dart';
import '../repo/questions_repo.dart';
import '../../../features/listening1/data/models/question1_model.dart';
import '../../../features/listening12/data/models/question12_model.dart';
import '../../../features/translation1/data/models/question2model.dart';
import '../model/slide_direction.dart';

class QuestionFlowCubit extends Cubit<QuestionFlowState> {
  final QuestionsRepository repo;

  List<Map<String, dynamic>> questions = [];
  int index = 0;

  SlideDirection direction = SlideDirection.left;
  int get currentIndex => index;

  QuestionFlowCubit(this.repo) : super(QuestionFlowInitial());

  Future<void> start() async {
    emit(QuestionFlowLoading());
    questions = await repo.getAllRawQuestions();
    index = 0;
    if (questions.isEmpty) {
      emit(QuestionFlowFinished());
    } else {
      _emitCurrentQuestion();
    }
  }

  void next() {
    direction = SlideDirection.left;
    index++;

    if (index < questions.length) {
      _emitCurrentQuestion();
    } else {
      emit(QuestionFlowFinished());
    }
  }

  void previous() {
    if (index > 0) {
      direction = SlideDirection.right;
      index--;
      _emitCurrentQuestion();
    }
  }

  void _emitCurrentQuestion() {
    final data = questions[index];
    final type = data['question_type'];

    switch (type) {
      case "TYPE1":
        emit(ShowQuestionType1(
          QuestionType1Model.fromFirestore(data),
          direction,
        ));
        break;

      case "TYPE1-2":
        emit(ShowQuestionType12(
          QuestionType12Model.fromMap(data),
          direction,
        ));
        break;

      case "TYPE2":
        emit(ShowQuestionType2(
          QuestionType2Model.fromJson(data),
          direction,
        ));
        break;
      case "TYPE5":
        emit(ShowQuestionType5(
          QuestionType5Model.fromJson(data),
          direction,
        ));
        break;
      default:
        emit(QuestionFlowError("Unknown question type"));
    }
  }
}

