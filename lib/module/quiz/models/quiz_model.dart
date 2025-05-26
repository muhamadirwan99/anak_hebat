import 'package:flutter/material.dart';

class QuizModel {
  final Widget soal;
  final String backsound;
  final QuizAnswerModel jawaban;
  final String jawabanBenar;

  QuizModel({
    required this.soal,
    required this.backsound,
    required this.jawaban,
    required this.jawabanBenar,
  });
}

class QuizAnswerModel {
  final String jawabanA;
  final String jawabanB;
  final String jawabanC;

  QuizAnswerModel({
    required this.jawabanA,
    required this.jawabanB,
    required this.jawabanC,
  });
}

class QuizState {
  final QuizModel model;
  String? selectedAnswer;

  QuizState({required this.model, this.selectedAnswer});
}
