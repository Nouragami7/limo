import 'package:flutter/material.dart';
import 'answerCardWithoutPhoto.dart';

class AnswersGridType2 extends StatefulWidget {
  final Function(String option) onTap;

  const AnswersGridType2({super.key, required this.onTap});

  @override
  State<AnswersGridType2> createState() => _AnswersGridType2State();
}

class _AnswersGridType2State extends State<AnswersGridType2> {
  int? selectedIndex;

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
            label: options[index],              isSelected: selectedIndex == index,

            onTap: (s) {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(options[index]);            },
          );
        },
      ),
    );
  }
}