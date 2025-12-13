import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/navigation_functions.dart';
import '../../../../core/utils/tts_service.dart';
import '../../../../domain/question_flow_cubit.dart';
import '../../../translation1/presentation/screen/questionType2Screen.dart';
import '../../data/models/question12_model.dart';
import '../widgets/answersGrid.dart';


class QuestionType12Screen extends StatefulWidget {
  final QuestionType12Model model;

  const QuestionType12Screen({super.key, required this.model});

  @override
  State<QuestionType12Screen> createState() => _QuestionType12ScreenState();
}

class _QuestionType12ScreenState extends State<QuestionType12Screen> {
  String? selectedAnswer;
  bool isCorrect = false;
  bool isWrong = false;
  late String correctAnswer = widget.model.question;
  String selected = "";
  bool hasChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TtsService.speak(widget.model.question);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Positioned.fill(
              child: Column(
                children: [
                  ProgressBar(progress: 0.7, question: "ترجم تلك الكلمة"),

                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CustomSoundButton(
                      width: 100,
                      height: 100,
                      iconSize: 60,
                      text: widget.model.question,
                    ),
                  ),

                  const SizedBox(height: 10),

                  AnswersGridType2(
                    disabled: hasChecked,
                    isWrong: isWrong,
                    options: widget.model.options,
                    onTap: (s) {
                      setState(() {
                        selectedAnswer = s;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (isCorrect || isWrong)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnswerResultSection(
                  isCorrect: isCorrect,
                  isWrong: isWrong,
                  correctAnswer: correctAnswer,
                  onTap: () {
                    setState(() { hasChecked = !hasChecked;
                    });
                  },
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 25,
              child: CustomButton(
                text: hasChecked ? "استمر" : "تحقق",
                isEnabled: selectedAnswer != null,
                onTap: () {
                  if (!hasChecked) {
                    setState(() {
                      if (selectedAnswer == correctAnswer) {
                        isCorrect = true;
                      } else {
                        isWrong = true;
                      }
                      hasChecked = !hasChecked;
                    });}else{
                    context.read<QuestionFlowCubit>().next();
                    Navigator.pop(context);
                   // NavigationFunctions.navigateWithSlide(context, const QuestionType2Screen());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

