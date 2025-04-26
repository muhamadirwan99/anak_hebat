import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class HomeController extends State<HomeView> {
  static late HomeController instance;
  late HomeView view;

  bool isSoundPlay = false;

  playSound() {
    if (isSoundPlay) {
      SoundUtils.playSound(
        MediaRes.audio.bg,
      );
    }
  }

  void playBackgroundMusic() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.bgm.play(
      MediaRes.audio.bg,
    );
    isSoundPlay = FlameAudio.bgm.isPlaying;
    update();
  }

  void toggleMute() async {
    if (isSoundPlay) {
      await FlameAudio.bgm.pause();
    } else {
      await FlameAudio.bgm.resume();
    }
    isSoundPlay = FlameAudio.bgm.isPlaying;

    update();
  }

  @override
  void initState() {
    instance = this;
    playBackgroundMusic();
    super.initState();
  }

  @override
  void dispose() {
    FlameAudio.bgm.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
