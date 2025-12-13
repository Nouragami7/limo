import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import 'package:limo/features/listening12/presentation/screen/questionType1_2Screen.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/components/question_text_with_speaker.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/navigation_functions.dart';
import '../../../../core/utils/tts_service.dart';
import '../../../../domain/question_flow_cubit.dart';
import '../../data/models/question1_model.dart';
import '../widgets/answerCardWithPhoto.dart';

class QuestionType1Screen extends StatefulWidget {
  final QuestionType1Model model;

  const QuestionType1Screen({super.key,required this.model});

  @override
  State<QuestionType1Screen> createState() => _QuestionType1ScreenState();
}

class _QuestionType1ScreenState extends State<QuestionType1Screen> {
  String? selectedAnswer;
  bool isCorrect = false;
  bool isWrong = false;
  late String correctAnswer = widget.model.correctAnswer;
  String selected = "";
  bool hasChecked = false;
  @override
  void didUpdateWidget(covariant QuestionType1Screen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.model != widget.model) {
      setState(() {
        selectedAnswer = null;
        isCorrect = false;
        isWrong = false;
        hasChecked = false;
        correctAnswer = widget.model.correctAnswer;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        TtsService.speak(widget.model.question.toLowerCase());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TtsService.speak(widget.model.question.toLowerCase());
    }); print("model : ${widget.model.toString()}");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                  children: [
                  ProgressBar(progress: 0.2, question: "اختر الاجابة الصحيحة"),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: QuestionTextWithSpeaker(text: widget.model.question.toLowerCase(),speakerWord: widget.model.question.toLowerCase()),
              ),
              SizedBox(height: 15),
              AnswersGrid(
                disabled: hasChecked,
                isWrong: isWrong, options: widget.model.options,
                onTap: (s) {
                  setState(() {
                    selectedAnswer = s;
                  });
                },
              )
                  ]
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

                   // NavigationFunctions.navigateWithSlide(context, const QuestionType12Screen());
              }}
                ,
              ),
            ),

          ],
        ),
      ),
    );

  }
}
