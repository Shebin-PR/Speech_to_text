import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final _speech = SpeechToText();

  Future<bool> toggleRecording({
    required Function(String text) onResult,
    required ValueChanged<bool> onListening,
  }) async {
    final isAvailabale = await _speech.initialize(
      onStatus: (status) => onListening(_speech.isListening),
      onError: (errorNotification) => print("error: $errorNotification"),
    );

    if (isAvailabale) {
      _speech.listen(onResult: (value) => onResult(value.recognizedWords));
    }
    return isAvailabale;
  }
}
