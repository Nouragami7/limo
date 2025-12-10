import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/tts_service.dart';
import '../widgets/answersGrid.dart';


class QuestionType2Screen extends StatefulWidget {
  const QuestionType2Screen({super.key});

  @override
  State<QuestionType2Screen> createState() => _QuestionType2ScreenState();
}

class _QuestionType2ScreenState extends State<QuestionType2Screen> {
  String? selectedAnswer;

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
                  ProgressBar(progress: 0.4, question: "ما الذي تسمعه ؟"),

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
                    onTap: (s) {
                      setState(() {
                        selectedAnswer = s;
                      });
                    },
                  ),
                ],
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 30,
              child: CustomButton(
                text: "تحقق",
                isEnabled: selectedAnswer != null,
                onTap: () {
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

