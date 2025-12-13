import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/domain/question_flow_cubit.dart';
import 'package:limo/domain/question_flow_state.dart';

import '../data/model/question.dart';
import '../features/listening1/data/models/question1_model.dart';
import '../features/listening1/presentation/screen/questionType1Screen.dart';
import '../features/listening12/data/models/question12_model.dart';
import 'package:flutter/material.dart';

import '../features/listening12/presentation/screen/questionType1_2Screen.dart';


class QuestionRouterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionFlowCubit, QuestionFlowState>(
      builder: (context, state) {
        if (state is QuestionFlowLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ShowQuestionType1) {
          return QuestionType1Screen(
            key: ValueKey(state.model.question),
            model: state.model,
          );
        }

        if (state is ShowQuestionType12) {
          return QuestionType12Screen(
            key: ValueKey(state.model.question),
            model: state.model,
          );
        }
        //
        // if (state is QuestionFlowFinished) {
        //   return const FinishScreen();
        // }

        return const SizedBox.shrink();
      },
    );
  }
}

