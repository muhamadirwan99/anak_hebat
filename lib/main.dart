import 'package:anak_hebat/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
