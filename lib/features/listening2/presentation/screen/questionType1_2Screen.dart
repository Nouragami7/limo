import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/tts_service.dart';
import '../widgets/answersGrid.dart';


class QuestionType12Screen extends StatefulWidget {
  const QuestionType12Screen({super.key});

  @override
  State<QuestionType12Screen> createState() => _QuestionType12ScreenState();
}

class _QuestionType12ScreenState extends State<QuestionType12Screen> {
  String? selectedAnswer;
  bool isCorrect = false;
  bool isWrong = false;
  String correctAnswer = "a";
  String selected = "";
  bool hasChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TtsService.speak("a");
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
                      text: "a",
                    ),
                  ),

                  const SizedBox(height: 10),

                  AnswersGridType2(
                    disabled: hasChecked,
                    isWrong: isWrong,
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
                  setState(() {
                    if (selectedAnswer == correctAnswer) {
                      isCorrect = true;
                    } else {
                      isWrong = true;
                    }
                    hasChecked = !hasChecked;
                  });
                  if (hasChecked) {
                    TtsService.speak(selectedAnswer!);
                  }
                  print("Selected answer = $selectedAnswer");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

