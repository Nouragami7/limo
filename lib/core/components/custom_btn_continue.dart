
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;


  const CustomButton({
    super.key,
    required this.text,
    required this.isEnabled,
    required this.onTap,
    this.height = 45,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: height,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),

        //width: double.infinity,
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.mainColor : AppColors.color300,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Cairo",
            color: isEnabled ? Colors.white : AppColors.color500,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

