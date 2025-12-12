import 'package:flutter/material.dart';
import 'package:limo/core/components/question_message_shape.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/components/wordSelectionWidget.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/translationInputController.dart';
import '../../../../core/utils/tts_service.dart';
import '../../../listening2/presentation/widgets/answersGrid.dart';
import '../../data/models/word.dart';


class QuestionType2Screen extends StatefulWidget {
  const QuestionType2Screen({super.key});

  @override
  State<QuestionType2Screen> createState() => _QuestionType12ScreenState();
}

class _QuestionType12ScreenState extends State<QuestionType2Screen> {
  String? selectedAnswer;
  String correctAnswer = "a"; String question = "Helloooooooooo";
  bool isCorrect = false;
  bool isWrong = false;
  String selected = "";
  bool hasChecked = false;
  late final TranslationInputController _inputController;

  @override
  void initState() {
    super.initState();
    final initialWords = [
      Word('من'), Word('فضلك'), Word('مرحبًا'), Word('قهوة'), Word('شاي'),
    ];
    _inputController = TranslationInputController(initialWords: initialWords);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TtsService.speak(question);
    });
    @override
    void dispose() {
      _inputController.dispose();
      super.dispose();
    }
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
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChatBubble(
                          text: question,
                          iconColor: AppColors.mainColor,
                          onSoundTap: () {TtsService.speak(question);},
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          Assets.limoImg,
                          height: 120,
                        ),
                      ],
                    ),
                  ),

                  WordSelectionWidget(controller: _inputController),

                  const SizedBox(height: 30),
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

