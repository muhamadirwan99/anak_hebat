import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anak Hebat',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
