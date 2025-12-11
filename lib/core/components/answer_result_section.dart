import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AnswerResultSection extends StatelessWidget {
  final bool isCorrect;
  final bool isWrong;
  final String correctAnswer;
  final VoidCallback onTap;


  const AnswerResultSection({
    super.key,
    required this.isCorrect,
    required this.isWrong,
    required this.correctAnswer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color resultBg;
    if (isCorrect) {
      resultBg = AppColors.hoverBG;
    } else if (isWrong) {
      resultBg = AppColors.errorBg;
    } else {
      resultBg = Colors.transparent;
    }

    String resultText = "";
    if (isCorrect) resultText ="عمل رائع";
    if (isWrong) resultText = " $correctAnswer : الإجابة الصحيحة ";

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 150,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: resultBg,
          ),
          child: Text(
            resultText, textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Cairo",
              color: isWrong? Colors.red : AppColors.mainColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),


      ],
    );
  }
}

