import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class AnswerCardWithoutPhoto extends StatefulWidget {
  final String label;
  final Function(String option) onTap;
  final bool isSelected;
  final bool isWrong;


  const AnswerCardWithoutPhoto({
    super.key,
    required this.label,
    required this.onTap,
required this.isSelected,
    required this.isWrong,
  });
  @override
  State<AnswerCardWithoutPhoto> createState() => _AnswerCardWithoutPhotoState();
}

class _AnswerCardWithoutPhotoState extends State<AnswerCardWithoutPhoto> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.label);
      },
      child: Container(
        padding: const EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? (widget.isWrong ? AppColors.errorBg : AppColors.hoverBG)
              : Colors.white,

          borderRadius: BorderRadius.circular(16),
border: Border.all(
  color:widget.isSelected
      ? (widget.isWrong ? Colors.red : AppColors.mainColor)
      : AppColors.color300,
  width: 2,
),
        ),
        child: Center(

           child: Text(
              widget.label,
              style: TextStyle(
                color:  widget.isSelected
                    ? (widget.isWrong ? Colors.red : AppColors.color700)
                    : AppColors.color700,
                fontSize: 40,
                fontWeight: FontWeight.w500,
letterSpacing: 0.3
              ),
            ),
        ),
      ),
    );
  }
//widget.isWrong ? Colors.red : AppColors.color700,
}