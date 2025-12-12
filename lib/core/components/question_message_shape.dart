import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:limo/core/constants/colors.dart';

import '../constants/assets.dart';
import '../utils/tts_service.dart';


class ChatBubble extends StatelessWidget {
  final String text;
  final VoidCallback onSoundTap;
  final Color bubbleColor;
  final Color textColor;
  final Color iconColor;

  const ChatBubble({
    super.key,
    required this.text,
    required this.onSoundTap,
    this.bubbleColor = Colors.white,
    this.textColor = Colors.black,
    this.iconColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.color200, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,

            style: TextStyle(
              fontSize: 18,
              fontFamily: "Cairo",
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
              decorationThickness: 1,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
            softWrap: true,
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: onSoundTap,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              child: Icon(
                Icons.volume_up_rounded,
                color: iconColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class QuestionBubble extends StatelessWidget {
//   final String text;
//   final VoidCallback onSoundTap;
//   final Color bubbleColor;
//   final Color textColor;
//   final Color iconColor;
//
//   const QuestionBubble({
//     super.key,
//     required this.text,
//     required this.onSoundTap,
//     this.bubbleColor = Colors.white,
//     this.textColor = Colors.black,
//     this.iconColor = Colors.orange,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         BubbleNormal(
//           text: text,
//           color: bubbleColor,
//           textStyle: TextStyle(
//             fontSize: 18,
//             fontFamily: "Cairo",
//             color: textColor,
//             fontWeight: FontWeight.w500,
//           ),
//           isSender: true,
//           bubbleRadius: 15,
//           tail: true,
//         ),
//
//         Transform(
//           alignment: Alignment.center,
//           transform: Matrix4.identity()..scale(-1.0, 1.0),
//           child: IconButton(
//             icon: Icon(
//               Icons.volume_up_rounded,
//               color: iconColor,
//               size: 30,
//             ),
//             onPressed: onSoundTap,
//           ),
//         ),
//       ],
//     );
//   }
// }
