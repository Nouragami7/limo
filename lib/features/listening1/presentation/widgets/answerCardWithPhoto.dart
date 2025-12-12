import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class AnswerCardWithPhoto extends StatefulWidget {
  final String label;
  final String? image;
  final bool isSelected;
  final bool isWrong;

  final Function(String option) onTap;

  const AnswerCardWithPhoto({
    super.key,
    required this.label,
    this.image,
    required this.isSelected,
    required this.onTap,
    required this.isWrong,

  });
  @override
  State<AnswerCardWithPhoto> createState() => _AnswerCardWithPhotoState();
}

class _AnswerCardWithPhotoState extends State<AnswerCardWithPhoto> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // setState(() {
        //   isSelected = !isSelected;
        // });
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.image != null)
              Image.asset(
                widget.image!,
                width: 90,
                height: 90,
              ),

            if (widget.image!= null)
              SizedBox(height: 15),

            Text(
              widget.label,
              style: TextStyle(
                color: widget.isSelected
                    ? (widget.isWrong ? Colors.red : AppColors.color700)
                    : AppColors.color700,
                fontSize: 20,
                fontWeight: FontWeight.w500,

letterSpacing: 0.3
              ),
            ),
          ],
        ),
      ),
    );
  }

}