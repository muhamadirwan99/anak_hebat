import 'package:flutter/material.dart';

class MengenalModel {
  final String title, subtitle, audio;
  final String? image;
  final VoidCallback onTap;

  MengenalModel({
    required this.title,
    required this.subtitle,
    required this.audio,
    required this.onTap,
    this.image,
  });
}
