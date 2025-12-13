

import '../../../features/listening1/data/models/question1_model.dart';
import '../../../features/listening12/data/models/question12_model.dart';
import '../../../features/translation1/data/models/question2model.dart';
import '../../listeningbubbles/data/models/question_type5_model.dart';
import '../model/slide_direction.dart';

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
  final SlideDirection direction;

  ShowQuestionType12(this.model,this.direction);
}

class ShowQuestionType1 extends QuestionFlowState {
  late final QuestionType1Model model;
  final SlideDirection direction;

  ShowQuestionType1(this.model,this.direction);
}

class ShowQuestionType2 extends QuestionFlowState {
  late final QuestionType2Model model;
  final SlideDirection direction;

  ShowQuestionType2(this.model,this.direction);

}
class ShowQuestionType5 extends QuestionFlowState {
  late final QuestionType5Model model;
  final SlideDirection direction;

  ShowQuestionType5(this.model,this.direction);


}