import 'package:flutter/material.dart';
import '../../data/models/question1_model.dart';
import '../widgets/answerCardWithPhoto.dart';

class AnswersGrid extends StatefulWidget {
  final bool isWrong;
  final Function(String option) onTap; final List<Map<String, String>> options;
  final bool disabled;
  const AnswersGrid({super.key, required this.onTap, required this.isWrong, required this.disabled,required this.options});

  @override
  State<AnswersGrid> createState() => _AnswersGridState();
}

class _AnswersGridState extends State<AnswersGrid> {
  int? selectedIndex;

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
        child:Opacity(
            opacity: widget.disabled ? 0.4 : 1,
            child: IgnorePointer(
              ignoring: widget.disabled,
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
            isWrong: widget.isWrong,
            label: options[index]["label"]!,
            image: options[index]["image"],
            isSelected: selectedIndex == index,
            onTap: (s) {  widget.disabled ? null :
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(options[index]["label"]!);
            },
          );
        },
      ),),)
    );
  }
}