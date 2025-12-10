import 'package:flutter/material.dart';
import 'answerCardWithoutPhoto.dart';

class AnswersGridType2 extends StatelessWidget {
  const AnswersGridType2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> options = [
      {"label": "a"},
      {"label": "h"},
      {"label": "c"},
      {"label": "d"},
    ];

    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
         // childAspectRatio: 0.2,
        ),
        itemBuilder: (context, index) {
          return AnswerCardWithoutPhoto(
            label: options[index]["label"]!,
            onTap: (s) {},
          );
        },
      ),
    );
  }
  }