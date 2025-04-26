import 'package:flutter/material.dart';

class MengenalAngkaModel {
  final String title, subtitle, audio;
  final VoidCallback onTap;

  MengenalAngkaModel({
    required this.title,
    required this.subtitle,
    required this.audio,
    required this.onTap,
  });
}
