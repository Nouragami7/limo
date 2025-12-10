import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/answersGrid.dart';

class QuestionType2Screen extends StatelessWidget {
  const QuestionType2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
              ProgressBar(progress: 0.4, question: "ما الذي تسمعه ؟"),                  SizedBox(height: 18),

              Container(
                width: double.infinity,
              alignment: Alignment.center,
              child: CustomSoundButton(
                width: 110,
                height: 110,
                iconSize: 65,
                onTap: () {
                  print("Sound button clicked");
                },
              ),
              ),


                  SizedBox(height: 35),
              AnswersGridType2()
            ]
        ),
      ),
    );

  }
}
