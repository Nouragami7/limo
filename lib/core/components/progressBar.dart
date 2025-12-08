import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final String question;


  const ProgressBar({super.key, required this.progress, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.color200,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FractionallySizedBox(
                        widthFactor: progress,
                        child: Stack(
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(20),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 3,
                                        width: double.infinity,
                                        color: Color(0xFF05E4CD),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              const Icon(Icons.close, size: 22, fontWeight:  FontWeight.bold,color: Color(0xFF0D1C2E),),
            ],
          ),
          const SizedBox(height: 15),
           Text(question,
           textAlign: TextAlign.right
    , style: TextStyle(
                 fontFamily:'Cairo',
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                   color: AppColors.color700,
                   letterSpacing: 0.3
               )
           )

        ],
      ),
    );
  }
}
