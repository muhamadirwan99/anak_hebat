import 'package:anak_hebat/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

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
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: newRouter,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFEC5338),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEC5338),
        ),
      ),
    );
  }
}
