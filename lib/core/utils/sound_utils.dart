import 'dart:async';
import 'dart:developer';

import 'package:flame_audio/flame_audio.dart';

class SoundUtils {
  static final AudioPlayer _player = AudioPlayer(); // Reuseable instance

  static Future<void> playSound(String fileName) async {
    try {
      await _player.setReleaseMode(ReleaseMode.stop);

      final completer = Completer<void>();
      _player.onPlayerComplete.listen((_) {
        completer.complete();
      });

      await _player.play(AssetSource(fileName));
      await completer.future;
    } catch (e) {
      log('Error playing sound: $e');
    }
  }

  static Future<void> stopSound() async {
    try {
      await _player.stop();
    } catch (e) {
      log('Error stopping sound: $e');
    }
  }
}
