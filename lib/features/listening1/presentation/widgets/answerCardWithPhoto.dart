import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class AnswerCardWithPhoto extends StatefulWidget {
  final String label;
  final String? image;
  final Function(bool isSelected) onTap;

  const AnswerCardWithPhoto({
    super.key,
    required this.label,
    this.image,
    required this.onTap,

  });
  @override
  State<AnswerCardWithPhoto> createState() => _AnswerCardWithPhotoState();
}

class _AnswerCardWithPhotoState extends State<AnswerCardWithPhoto> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap(isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric( vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.hoverBG: Colors.white,
          borderRadius: BorderRadius.circular(16),
border: Border.all(
  color:isSelected ? AppColors.mainColor : AppColors.color300,
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
                color:AppColors.color700,
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