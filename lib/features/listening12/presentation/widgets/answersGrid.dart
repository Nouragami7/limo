import 'package:flutter/material.dart';
import 'answerCardWithoutPhoto.dart';

class AnswersGridType2 extends StatefulWidget {
  final bool isWrong;
  final Function(String option) onTap;
  final bool disabled;
  final List<String> options;

  const AnswersGridType2({super.key,required this.options, required this.onTap, required this.isWrong, required this.disabled });

  @override
  State<AnswersGridType2> createState() => _AnswersGridType2State();
}

class _AnswersGridType2State extends State<AnswersGridType2> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {


    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child:Opacity(
          opacity: widget.disabled ? 0.4 : 1,
          child: IgnorePointer(
            ignoring: widget.disabled,
            child: GridView.builder(
        shrinkWrap: true,
        itemCount: widget.options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 25,
         // childAspectRatio: 0.2,
        ),
        itemBuilder: (context, index) {
          return AnswerCardWithoutPhoto(
            label: widget.options[index],
            isSelected: selectedIndex == index,
            isWrong: widget.isWrong,
            onTap: (s) { widget.disabled ? null :
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(widget.options[index]);            },
          );
        },
      ),),)
    );
  }
}