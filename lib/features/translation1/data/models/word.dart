import 'package:flutter/cupertino.dart';

class Word {
  final String text;
  final Key key;
  Word(this.text) : key = UniqueKey();
}