import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/utils/AppRoute.dart';
import '../../../data/model/question.dart';
import '../../../features/listening1/data/models/question1_model.dart';
import '../../../features/listening1/presentation/screen/questionType1Screen.dart';
import '../../../features/listening12/data/models/question12_model.dart';
import 'package:flutter/material.dart';

import '../../../features/listening12/presentation/screen/questionType1_2Screen.dart';
import '../../../features/translation1/presentation/screen/questionType2Screen.dart';
import '../../listeningbubbles/presentation/screen/questionType5Screen.dart';
import '../../matching_pairs/presentation/screen/questionType6Screen.dart';
import '../cubit/question_flow_cubit.dart';
import '../cubit/question_flow_state.dart';
import '../model/slide_direction.dart';


class QuestionRouterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionFlowCubit, QuestionFlowState>(
      listener: (context, state) {
        if (state is QuestionFlowFinished) {
          Navigator.pushReplacementNamed(context, AppRoute.home);
        }
      },
      child: BlocBuilder<QuestionFlowCubit, QuestionFlowState>(
        buildWhen: (prev, curr) => curr is! QuestionFlowLoading,
        builder: (context, state) {
          if (state is QuestionFlowLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          Widget page;
          SlideDirection direction;

          if (state is ShowQuestionType1) {
            page = QuestionType1Screen(model: state.model);
            direction = state.direction;
          } else if (state is ShowQuestionType12) {
            page = QuestionType12Screen(model: state.model);
            direction = state.direction;
          } else if (state is ShowQuestionType2) {
            page = QuestionType2Screen(model: state.model);
            direction = state.direction;
          } else if (state is ShowQuestionType5) {
            page = QuestionType5Screen(model: state.model);
            direction = state.direction;
          } else if (state is ShowQuestionType6) {
            page = QuestionType6Screen(model: state.model);
            direction = state.direction;
          } else {
            return const SizedBox.shrink();
          }

          final index =
              context.read<QuestionFlowCubit>().currentIndex;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: KeyedSubtree(
              key: ValueKey(index),
              child: page,
            ),
            transitionBuilder: (child, animation) {
              final beginOffset = direction == SlideDirection.left
                  ? const Offset(1, 0)
                  : const Offset(-1, 0);

              return SlideTransition(
                position: Tween<Offset>(
                  begin: beginOffset,
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}

