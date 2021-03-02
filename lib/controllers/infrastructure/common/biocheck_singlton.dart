import 'package:flutter_tts/flutter_tts.dart';

class FlutterTTS {
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  static final FlutterTTS _flutterTts = FlutterTTS._internal();

  factory FlutterTTS() {
    return _flutterTts;
  }

  FlutterTTS._internal();

  FlutterTts initTTS() {
    var tts = FlutterTts();

    return tts;
  }
}
