import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/answerCardWithPhoto.dart';

class QuestionType1Screen extends StatelessWidget {
  const QuestionType1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
            ProgressBar(progress: 0.2, question: "اختر الاجابة الصحيحة"),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text(
          "قهوة",
          style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 24,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dotted,
            decorationThickness: 1,
          fontWeight: FontWeight.w600,
          color: AppColors.color700,
          ),
          textDirection: TextDirection.rtl,
          ),
        
          const SizedBox(width: 12),
        
          GestureDetector(
          onTap: () {},
          child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
          color: const Color(0xFF09D3C6),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
          BoxShadow(
          color: AppColors.hoverBG,
          offset: Offset(-3, -3),
          blurRadius: 6,
          ),
          BoxShadow(
          color: AppColors.mainColor,
          offset: Offset(0, 3),
          ),
          ],
          ),
          child: const Icon(
          Icons.volume_up_rounded,
          color: Colors.white,
          size: 20,
          ),
          ),
          ),
          ],
          ),
        ),
        SizedBox(height: 15),
        AnswersGrid()
            ]
        ),
      ),
    );

  }
}
