import 'package:flutter/material.dart';

import '../../features/translation1/data/models/word.dart';

class TranslationInputController extends ChangeNotifier {
  final List<Word> _initialPool;
  final List<Word> _selectedWords = [];
  late List<Word> _availableWords;

  TranslationInputController({required List<Word> initialWords})
      : _initialPool = List.from(initialWords) {
    _availableWords = List.from(_initialPool);
  }

  List<Word> get selectedWords => _selectedWords;
  List<Word> get availableWords => _availableWords;

  bool get isAnswerEmpty => _selectedWords.isEmpty;


  void addWordToAnswer(Word word) {
    _availableWords.removeWhere((w) => w.key == word.key);
    _selectedWords.add(word);
    notifyListeners();
  }

  void removeWordFromAnswer(Word word) {
    _selectedWords.removeWhere((w) => w.key == word.key);
    _availableWords.add(word);
    _availableWords.sort((a, b) {
      final aIndex = _initialPool.indexWhere((w) => w.key == a.key);
      final bIndex = _initialPool.indexWhere((w) => w.key == b.key);
      return aIndex.compareTo(bIndex);
    });
    notifyListeners();
  }
}