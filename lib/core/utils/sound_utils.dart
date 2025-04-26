import 'dart:async';
import 'dart:developer';

import 'package:flame_audio/flame_audio.dart';

class SoundUtils {
  static Future<void> playSound(String fileName) async {
    try {
      final player = AudioPlayer();
      await player.setReleaseMode(ReleaseMode.stop); // penting

      final completer = Completer<void>();
      player.onPlayerComplete.listen((_) {
        completer.complete();
      });

      await player.play(AssetSource(fileName)); // hanya nama relatif
      await completer.future;
    } catch (e) {
      log('Error playing sound: $e');
    }
  }
}
