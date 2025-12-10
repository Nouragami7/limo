import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/tts_service.dart';

class CustomSoundButton extends StatelessWidget {
  final double width;
  final double height;
  final double iconSize;
 // final VoidCallback? onTap;
  final String text;


  const CustomSoundButton({
    super.key,
    this.width = 34,
    this.height = 34,
    this.iconSize = 20,
   // this.onTap,
    this.text = "Sound",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){TtsService.speak(text);},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF09D3C6),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color:AppColors.hoverBG,
              offset: Offset(-3, -3),
              blurRadius: 6,
            ),
            BoxShadow(
              color: AppColors.mainColor,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          Icons.volume_up_rounded,
          color: Colors.white,
          size: iconSize,
        ),
      ),
    );
  }
}
