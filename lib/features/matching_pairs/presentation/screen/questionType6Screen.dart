import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/widgets/answersGrid.dart';
import '../../../../core/components/answer_result_section.dart';
import '../../../../core/components/custom_btn_continue.dart';
import '../../../../core/components/custom_sound.dart';
import '../../../../core/components/progressBar.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/navigation_functions.dart';
import '../../../../core/utils/tts_service.dart';
import '../../../translation1/presentation/screen/questionType2Screen.dart';
import '../../data/models/pair.dart';
import '../widgets/answersGrid.dart';


class QuestionType6Screen extends StatefulWidget {
  const QuestionType6Screen({super.key});

  @override
  State<QuestionType6Screen> createState() => _QuestionType6ScreenState();
}

class _QuestionType6ScreenState extends State<QuestionType6Screen> {
  String? selectedAnswer;
  bool isCorrect = false;
  bool isWrong = false;
  late List<String> englishWords;
  late List<String> arabicWords;

  final List<Pair> pairs = [
    Pair(en: "Milk", ar: "حليب"),
    Pair(en: "Tea", ar: "شاي"),
    Pair(en: "Coffee", ar: "قهوة"),
    Pair(en: "Water", ar: "ماء"),
    Pair(en: "Hello", ar: "هاي"),
  ];


  String selected = "";
  bool hasChecked = false;

  @override
  void initState() {
    super.initState();
    englishWords = pairs.map((p) => p.en).toList()..shuffle();
    arabicWords = pairs.map((p) => p.ar).toList()..shuffle();
  }
  String? selectedEn;
  String? selectedAr;

  bool isMatch() {
    if (selectedEn == null || selectedAr == null) return false;
    return pairs.any((p) => p.en == selectedEn && p.ar == selectedAr);
  }
  void checkMatch() {
    if (isMatch()) {
      englishWords.remove(selectedEn);
      arabicWords.remove(selectedAr);
    }

    selectedEn = null;
    selectedAr = null;
    setState(() {});
  }
  Widget card(String text, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: selected ? Colors.white : Colors.black,
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
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: englishWords.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12),
                            itemBuilder: (_, index) {
                              final word = englishWords[index];
                              return card(
                                word,
                                selectedEn == word,
                                    () {
                                  selectedEn = word;
                                  checkMatch();
                                },
                              );
                            },
                          ),
                        ),

                        SizedBox(width: 16),

                        // Arabic column
                        Expanded(
                          child: ListView.separated(
                            itemCount: arabicWords.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12),
                            itemBuilder: (_, index) {
                              final word = arabicWords[index];
                              return card(
                                word,
                                selectedAr == word,
                                    () {
                                  selectedAr = word;
                                  checkMatch();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            if (isCorrect || isWrong)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnswerResultSection(
                  isCorrect: isCorrect,
                  isWrong: isWrong,
                  correctAnswer: "",
                  onTap: () {
                    setState(() { hasChecked = !hasChecked;
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
                isEnabled: selectedAnswer != null,
                onTap: () {
                  if (!hasChecked) {
                    setState(() {
                      if (selectedAnswer == "") {
                        isCorrect = true;
                      } else {
                        isWrong = true;
                      }
                      hasChecked = !hasChecked;
                    });}else{
                  };

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

