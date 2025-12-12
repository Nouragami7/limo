import 'package:flutter/material.dart';

import '../../data/model/word.dart';
import '../constants/colors.dart';
import '../utils/translationInputController.dart';
class WordSelectionWidget extends StatelessWidget {
  final TranslationInputController controller;
  final bool isLocked;
  final bool isArabic;
  const WordSelectionWidget({super.key, required this.controller,required this.isLocked,this.isArabic = false});

  Widget _buildSelectedWordChip(Word word) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: isLocked ? null : () => controller.removeWordFromAnswer(word),
        child: Container(
          key: word.key,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color:AppColors.color200,
                offset: Offset(-3, -3),
                blurRadius: 6,
              ),
              BoxShadow(
                color: AppColors.color300,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            word.text,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.color700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ),
    );
  }

  Widget _buildWordBubble(Word word) { final bool canTap = !isLocked;
    return InkWell(
      onTap: canTap ? () => controller.addWordToAnswer(word) : null,
      child: Container(
        key: word.key,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isLocked ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color:AppColors.color200,
              offset: Offset(-3, -3),
              blurRadius: 6,
            ),
            BoxShadow(
              color: AppColors.color300,
              offset: Offset(0, 3),
            ),
          ],
          // border: Border.all(
          //   color: AppColors.color200,
          //   width: 2,
          // ),
        ),
        child: Text(
          word.text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.color700,
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerLines(TranslationInputController controller) {
    const double chipHeight = 40.0;
    const double runSpacing = 20.0;
    const double separatorHeight = 1.5;

    const double chipsAreaHeight = (chipHeight * 2) + runSpacing;
    const double totalStackHeight = chipsAreaHeight + separatorHeight + 5.0;

    return Directionality(
      textDirection: isArabic ? TextDirection.ltr :TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          height: totalStackHeight,
          child: Stack(
            children: [

              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: runSpacing,
                    children: controller.selectedWords.map((word) => _buildSelectedWordChip(word)).toList(),
                  ),
                ),
              ),

              Positioned(
                top: chipHeight + (runSpacing / 2) + 2,
                left: 0,
                right: 0,
                height: separatorHeight,
                child: Container(
                  color: Colors.grey[400],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: separatorHeight,
                child: Container(
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildAnswerLines(controller),
            ),

            const SizedBox(height: 70),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                alignment: WrapAlignment.center,
                children: controller.availableWords.map((word) => _buildWordBubble(word)).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}


