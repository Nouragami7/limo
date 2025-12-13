import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';

import '../../../../core/constants/colors.dart';
import '../../../questions_route/cubit/question_flow_cubit.dart';

import '../../data/models/pair.dart';
import '../../data/models/question_type6model.dart';
import '../widgets/answersGrid.dart';


class QuestionType6Screen extends StatefulWidget {
  final QuestionType6Model model;
  const QuestionType6Screen({super.key,required this.model});

  @override
  State<QuestionType6Screen> createState() => _QuestionType6ScreenState();
}

class _QuestionType6ScreenState extends State<QuestionType6Screen> {
  String? selectedAnswer;
  bool isCorrect = false;
  bool isWrong = false;
  late List<String> englishWords;
  late List<String> arabicWords;
  String? selectedEn;
  String? selectedAr;
  bool hasAnyCorrectMatch = false;
  bool showCorrectAnswers = false;
  String correctAnswerText = "";

  Set<String> correctItems = {};
  Set<String> wrongItems = {};

  bool checking = false;
  late final List<PairWords> pairs = widget.model.pairs;


  String selected = "";
  bool hasChecked = false;

  @override
  void initState() {
    super.initState();
    englishWords = pairs.map((p) => p.en).toList()..shuffle();
    arabicWords = pairs.map((p) => p.ar).toList()..shuffle();
  }
  String buildRemainingPairsText() {
    return pairs
        .where((p) =>
    englishWords.contains(p.en) ||
        arabicWords.contains(p.ar))
        .map((p) => '${p.en} = ${p.ar}')
        .join(' , ');
  }
  String buildCorrectAnswerText() {
    return pairs
        .map((p) => '${p.en} = ${p.ar}')
        .join('\n');
  }


  bool isMatch() {
    if (selectedEn == null || selectedAr == null) return false;
    return pairs.any((p) => p.en == selectedEn && p.ar == selectedAr);
  }
  void checkMatch() async {
    if (isMatch()) {
      setState(() {
        correctItems.add(selectedEn!);
        correctItems.add(selectedAr!);
        hasAnyCorrectMatch = true;
      });

      await Future.delayed(const Duration(milliseconds: 400));

      setState(() {
        englishWords.remove(selectedEn);
        arabicWords.remove(selectedAr);
      });
    } else {
      setState(() {
        wrongItems.add(selectedEn!);
        wrongItems.add(selectedAr!);
      });

      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        wrongItems.clear();
      });
    }

    selectedEn = null;
    selectedAr = null;
  }

  Widget card(String text, VoidCallback onTap) {
    final isSelected = text == selectedEn || text == selectedAr;
    final isCorrect = correctItems.contains(text);
    final isWrong = wrongItems.contains(text);

    Color bgColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = AppColors.color700;

    if (isCorrect) {
      bgColor = AppColors.hoverBG;
      borderColor = AppColors.mainColor;
      textColor = AppColors.color700;
    } else if (isWrong) {
      bgColor = AppColors.errorBg;
      borderColor = Colors.red;
      textColor = Colors.red;
    } else if (isSelected) {
      bgColor = AppColors.color200;
      borderColor = AppColors.color700;
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: (isCorrect || checking) ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  ProgressBar(progress: 0.7, question: "انقر على الأزواج المتطابقة"),
                  const SizedBox(height: 70),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: englishWords.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 12),
                              itemBuilder: (_, index) {
                                final word = englishWords[index];
                                return card(
                                  word,
                                      () {
                                    if (selectedEn != null || checking) return;

                                    setState(() {
                                      selectedEn = word;
                                    });

                                    if (selectedAr != null) {
                                      checkMatch();
                                    }
                                  },
                                );


                              },
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: ListView.separated(
                              itemCount: arabicWords.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 12),
                              itemBuilder: (_, index) {
                                final word = arabicWords[index];
                                return card(
                                  word,
                                      () {
                                    if (selectedAr != null || checking) return;

                                    setState(() {
                                      selectedAr = word;
                                    });

                                    if (selectedEn != null) {
                                      checkMatch();
                                    }
                                  },
                                );



                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            if (hasChecked)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnswerResultSection(
                  isCorrect: isCorrect,
                  isWrong: isWrong,
                  correctAnswer: correctAnswerText,
                  onTap: () {
                    setState(() {
                      hasChecked = false;
                    });
                  },
                ),
              ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 25,
              child: CustomButton(
                text: hasChecked ? "استمر" : "تحقق",
                isEnabled: hasAnyCorrectMatch,
                onTap: () {
                  if (!hasChecked) {
                    setState(() {
                      correctAnswerText = buildRemainingPairsText();
                      if (correctAnswerText.isNotEmpty) {
                        isCorrect = false;
                        isWrong = true;
                      }else{
                        isCorrect = true;
                        isWrong = false;
                      }
                      hasChecked = true;

                    });
                  } else {
                    context.read<QuestionFlowCubit>().next();
                  }
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}

