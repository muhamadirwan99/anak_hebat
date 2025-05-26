import 'dart:async';
import 'dart:developer';
import 'package:flame_audio/flame_audio.dart';

class SoundUtils {
  static final AudioPlayer _player = AudioPlayer();
  static StreamSubscription<void>? _onCompleteSub;

  static Future<void> playSound(String fileName) async {
    try {
      await _player.setReleaseMode(ReleaseMode.stop);

      final completer = Completer<void>();

      // Hapus listener sebelumnya jika ada!
      await _onCompleteSub?.cancel();

      _onCompleteSub = _player.onPlayerComplete.listen((_) {
        if (!completer.isCompleted) {
          completer.complete();
        }
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
      await _onCompleteSub?.cancel();
    } catch (e) {
      log('Error stopping sound: $e');
    }
  }
}
