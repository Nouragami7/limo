import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_sound.dart';
class QuestionTextWithSpeaker extends StatelessWidget {
  final String text;
  final String speakerWord;
  const QuestionTextWithSpeaker({super.key, required this.text ,required this.speakerWord });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
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


        CustomSoundButton(
          width: 30,
          height: 30,
          iconSize: 17,
          text: speakerWord,
        ),


      ],
    );
  }
}
