import 'package:flutter/material.dart';
import 'package:limo/core/components/question_message_shape.dart';
import 'package:limo/core/utils/navigation_functions.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/components/slow_speech_sound_container.dart';
import '../../../../core/components/wordSelectionWidget.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/translationInputController.dart';
import '../../../../core/utils/tts_service.dart';
import '../../../listening1/presentation/screen/questionType1Screen.dart';
import '../../../listening12/presentation/widgets/answersGrid.dart';
import '../../../../data/model/word.dart';


class QuestionType5Screen extends StatefulWidget {
  const QuestionType5Screen({super.key});

  @override
  State<QuestionType5Screen> createState() => _QuestionType5ScreenState();
}

class _QuestionType5ScreenState extends State<QuestionType5Screen> {
  final String correctFullAnswer ="Hello how are you";
  String question = "Hello,how are ";
  bool isCorrect = false;
  bool isWrong = false;
  String selected = "";
  bool hasChecked = false;
  late final TranslationInputController _inputController;

  @override
  void initState() {
    super.initState();
    final initialWords = [
      Word('hello'), Word('how'), Word('are'), Word('you'), Word('day'),Word('today'), Word('bear')
    ];
    _inputController = TranslationInputController(initialWords: initialWords);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TtsService.speak(correctFullAnswer);
    });
    @override
    void dispose() {
      _inputController.dispose();
      super.dispose();
    }
  }

  void _checkAnswer() {
    final userSentence = _inputController.selectedWords.map((word) => word.text).join(' ');

    final bool isAnswerCorrect = userSentence.toLowerCase() == correctFullAnswer.toLowerCase();

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
                  ProgressBar(progress: 0.9, question: "انقر على ما تسمعه"),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    CustomSoundButton(
                      width: 150,
                      height: 150,
                      iconSize: 80,
                      text: correctFullAnswer,
                    ),
SizedBox(width: 20,),
CustomSlowSoundButton(
  width: 80,
  height: 80,
  iconSize: 45,
  text: correctFullAnswer,
),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                 WordSelectionWidget(controller: _inputController, isLocked: hasChecked, isArabic:true),

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

