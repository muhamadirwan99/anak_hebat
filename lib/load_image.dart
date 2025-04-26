import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

loadImage() async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
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
      precacheImage(AssetImage(MediaRes.button.mencocokanAngka), context);
      precacheImage(AssetImage(MediaRes.button.mengenalAngka), context);
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
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.back).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.back).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.dashboard).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.dashboard).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.home).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.home).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.keluar).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.keluar).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.kembali).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.kembali).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.next).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.next).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.retry).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.retry).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.speakerOff).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.speakerOff).loadBytes(null));
      await svg.cache.putIfAbsent(SvgAssetLoader(MediaRes.button.speakerOn).cacheKey(null),
          () => SvgAssetLoader(MediaRes.button.speakerOn).loadBytes(null));
    }
  });
}
