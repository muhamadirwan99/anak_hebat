import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:universal_html/html.dart' as html;

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

  logout() {
    FirebaseAuth.instance.signOut();
    html.window.location.replace("/");
  }

  @override
  void initState() {
    instance = this;
    // playBackgroundMusic();
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
