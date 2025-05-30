import 'package:flutter/material.dart';

class MenghitungAngkaModel {
  final String level, gambar, sound;
  final int jawaban;
  final List<int> pilihan;
  final VoidCallback onTap;

  MenghitungAngkaModel({
    required this.sound,
    required this.level,
    required this.gambar,
    required this.jawaban,
    required this.pilihan,
    required this.onTap,
  });
}
