import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text,{double rate = 0.40}) async {
    await _tts.setLanguage("en-GB");
    await _tts.setSpeechRate(rate);
    await _tts.setPitch(1.0);

    await _tts.stop();
    await _tts.speak(text);
  }
}
