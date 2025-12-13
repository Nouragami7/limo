import '../data/model/question.dart';
import '../features/listening1/data/models/question1_model.dart';
import '../features/listening12/data/models/question12_model.dart';

abstract class QuestionFlowState {}

class QuestionFlowInitial extends QuestionFlowState {}
class QuestionFlowLoading extends QuestionFlowState {}
class QuestionFlowFinished extends QuestionFlowState {}

class QuestionFlowError extends QuestionFlowState {
  final String message;
  QuestionFlowError(this.message);
}

class ShowQuestionType12 extends QuestionFlowState {
  final QuestionType12Model model;
  ShowQuestionType12(this.model);
}

class ShowQuestionType1 extends QuestionFlowState {
  late final QuestionType1Model model;

  ShowQuestionType1(this.model);
}

