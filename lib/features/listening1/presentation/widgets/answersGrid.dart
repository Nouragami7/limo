import 'package:flutter/material.dart';
import '../widgets/answerCardWithPhoto.dart';

class AnswersGrid extends StatelessWidget {
  const AnswersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> options = [
      {"label": "Water", "image": "assets/images/water.png"},
      {"label": "Coffee", "image": "assets/images/water.png"},
      {"label": "Tea", "image": "assets/images/water.png"},
      {"label": "Milk", "image": "assets/images/water.png"},
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
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          return AnswerCardWithPhoto(
            label: options[index]["label"]!,
            image: options[index]["image"],
            onTap: (s) {},
          );
        },
      ),
    );
  }
  }