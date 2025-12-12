import 'package:flutter/material.dart';
import 'package:limo/core/components/question_message_shape.dart';
import 'package:limo/core/utils/navigation_functions.dart';
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
import '../../../listening1/presentation/screen/questionType1Screen.dart';
import '../../../listening2/presentation/widgets/answersGrid.dart';
import '../../data/models/word.dart';


class QuestionType2Screen extends StatefulWidget {
  const QuestionType2Screen({super.key});

  @override
  State<QuestionType2Screen> createState() => _QuestionType12ScreenState();
}

class _QuestionType12ScreenState extends State<QuestionType2Screen> {
  final String correctFullAnswer ="مرحبًا كيف حالك";
  String question = "Hello,how are you?";
  bool isCorrect = false;
  bool isWrong = false;
  String selected = "";
  bool hasChecked = false;
  late final TranslationInputController _inputController;

  @override
  void initState() {
    super.initState();
    final initialWords = [
      Word('من'), Word('فضلك'), Word('مرحبًا'), Word('قهوة'), Word('شاي'),Word('كيف'), Word('حالك')
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

  void _checkAnswer() {
    final userSentence = _inputController.selectedWords.map((word) => word.text).join(' ');

    final bool isAnswerCorrect = userSentence == correctFullAnswer;

    setState(() {
      if (isAnswerCorrect) {
        isCorrect = true;
        isWrong = false;
      } else {
        isCorrect = false;
        isWrong = true;
      }
      hasChecked = true;
    });

    if (isWrong) {
       TtsService.speak(correctFullAnswer);
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
                  const SizedBox(height: 20),
                  WordSelectionWidget(controller: _inputController, isLocked: hasChecked),

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
                  correctAnswer: correctFullAnswer,
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
              child: ListenableBuilder(
                listenable: _inputController,
                builder: (context, child) {

                  final bool buttonEnabled = !_inputController.isAnswerEmpty;

                  return CustomButton(
                    text: hasChecked ? "استمر" : "تحقق",

                    isEnabled: buttonEnabled,

                    onTap: () {
                      if (!buttonEnabled && !hasChecked) {
                        return;
                      }

                      if (hasChecked) {

                        setState(() {
                          isCorrect = false;
                          isWrong = false;
                          hasChecked = false;
                        });

                        NavigationFunctions.navigateWithSlide(context, const QuestionType1Screen());

                      } else {
                        _checkAnswer();
                      }
                    },
                  );
                },
              ),
            ),  ],
        ),
      ),
    );
  }
}

