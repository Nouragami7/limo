import 'package:flutter/material.dart';
import 'answerCardWithoutPhoto.dart';

class AnswersGridType2 extends StatelessWidget {
  final Function(String option) onTap;

  const AnswersGridType2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<String> options =
      ["a",
      "h",
      "c",
      "d"]
    ;

    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 25,
         // childAspectRatio: 0.2,
        ),
        itemBuilder: (context, index) {
          return AnswerCardWithoutPhoto(
            label: options[index],
            onTap: (s) {
              onTap(s);
            },
          );
        },
      ),
    );
  }
  }