import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';

loadImage() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final context = Get.navigatorKey.currentContext;
    if (context != null) {
      precacheImage(AssetImage(MediaRes.images.login), context);
      precacheImage(AssetImage(MediaRes.background.kelas), context);
      precacheImage(AssetImage(MediaRes.background.outside), context);
      precacheImage(AssetImage(MediaRes.button.belajar), context);
      precacheImage(AssetImage(MediaRes.button.belajarAngka), context);
      precacheImage(AssetImage(MediaRes.button.belajarHuruf), context);
      precacheImage(AssetImage(MediaRes.button.quiz), context);
      precacheImage(AssetImage(MediaRes.button.quizAngka), context);
      precacheImage(AssetImage(MediaRes.button.quizHuruf), context);
      precacheImage(AssetImage(MediaRes.logo.logo), context);
      precacheImage(AssetImage(MediaRes.materi.a), context);
      precacheImage(AssetImage(MediaRes.materi.b), context);
      precacheImage(AssetImage(MediaRes.materi.c), context);
      precacheImage(AssetImage(MediaRes.materi.d), context);
      precacheImage(AssetImage(MediaRes.materi.e), context);
      precacheImage(AssetImage(MediaRes.materi.f), context);
      precacheImage(AssetImage(MediaRes.materi.g), context);
      precacheImage(AssetImage(MediaRes.materi.h), context);
      precacheImage(AssetImage(MediaRes.materi.i), context);
      precacheImage(AssetImage(MediaRes.materi.j), context);
      precacheImage(AssetImage(MediaRes.materi.k), context);
      precacheImage(AssetImage(MediaRes.materi.l), context);
      precacheImage(AssetImage(MediaRes.materi.m), context);
      precacheImage(AssetImage(MediaRes.materi.n), context);
      precacheImage(AssetImage(MediaRes.materi.o), context);
      precacheImage(AssetImage(MediaRes.materi.p), context);
      precacheImage(AssetImage(MediaRes.materi.q), context);
      precacheImage(AssetImage(MediaRes.materi.r), context);
      precacheImage(AssetImage(MediaRes.materi.s), context);
      precacheImage(AssetImage(MediaRes.materi.t), context);
      precacheImage(AssetImage(MediaRes.materi.u), context);
      precacheImage(AssetImage(MediaRes.materi.v), context);
      precacheImage(AssetImage(MediaRes.materi.w), context);
      precacheImage(AssetImage(MediaRes.materi.x), context);
      precacheImage(AssetImage(MediaRes.materi.y), context);
      precacheImage(AssetImage(MediaRes.materi.z), context);
    }
  });
}
