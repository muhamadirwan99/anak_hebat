// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class QuizController extends State<QuizView> {
  static late QuizController instance;
  late QuizView view;

  int currentIndex = 0;
  List<String?> userAnswers = [];
  List dataQuiz = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isSelected(String value) => userAnswers[currentIndex] == value;

  late QuizModel quiz;

  void selectAnswer(String answer) {
    SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

    if (currentIndex >= userAnswers.length) return; // Cegah IndexOutOfBounds
    userAnswers[currentIndex] = answer;
    update();
  }

  void nextQuestion() async {
    SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

    if (userAnswers[currentIndex] == null) return;

    if (currentIndex < dataQuiz.length - 1) {
      currentIndex++;
      quiz = dataQuiz[currentIndex]; // Tambahkan ini!
      update();
      await SoundUtils.playSound(quiz.backsound);
      if (widget.pageState == EnumQuizState.literasi) {
        if (checkIndex(widget.pageState)) {
          showDialogBase(
            maxWidth: 1548,
            barrierDismissible: true,
            content: const DialogCeritaQuiz(),
          );
        }
      }
    } else {
      // Evaluasi
      int correctAnswers = 0;
      List<QuizPayload> incorrectAnswers = [];

      for (int i = 0; i < userAnswers.length; i++) {
        if (userAnswers[i] == dataQuiz[i].jawabanBenar) {
          correctAnswers++;
        } else {
          incorrectAnswers.add(
            QuizPayload(
              noSoal: (i + 1).toString(),
              jawabanUser: userAnswers[i],
            ),
          );
        }
      }

      submitQuizResult(
        point: (correctAnswers * 10).toString(),
        jawabanBenar: correctAnswers.toString(),
        jawabanSalah: incorrectAnswers.length.toString(),
        listQuizPayload: incorrectAnswers,
      );
    }

    update();
  }

  bool checkIndex(EnumQuizState pageState) {
    if (pageState == EnumQuizState.numerasi) {
      return false;
    }

    if (currentIndex == 8 || currentIndex == 9) {
      return true;
    }
    return false;
  }

  void resetAnswers() {
    userAnswers = List<String?>.filled(dataQuiz.length, null);
    currentIndex = 0;
    quiz = dataQuiz[currentIndex]; // Reset soal ke nomor 1
    update();
  }

  void submitQuizResult({
    required String point,
    required String jawabanBenar,
    required String jawabanSalah,
    required List<QuizPayload> listQuizPayload,
  }) async {
    showCircleLoading();

    final userId = FirebaseAuth.instance.currentUser?.uid;
    final quizName = widget.pageState.name;
    final docId = "${userId}_$quizName";

    CollectionReference users = _firestore.collection('users');
    DocumentReference leaderboards = _firestore.collection('leaderboards').doc(docId);

    try {
      // Update user history_quiz as a list (append if exists, else create)
      final userDoc = users.doc(userId);
      final userSnapshot = await userDoc.get();
      Map<String, dynamic>? data;
      String name = 'Anonymous';

      if (userSnapshot.exists) {
        final rawData = userSnapshot.data();
        if (rawData != null && rawData is Map<String, dynamic>) {
          data = rawData;
          name = data['name'] ?? 'Anonymous';
        }
        // If user exists, append to history_quiz array
        await userDoc.update({
          'history_quiz': FieldValue.arrayUnion([
            {
              'quiz': widget.pageState.name,
              'point': point,
              'jawabanBenar': jawabanBenar,
              'jawabanSalah': jawabanSalah,
              'listQuizPayload': listQuizPayload.map((e) => e.toJson()).toList(),
            }
          ]),
        });
      } else {
        // If user doesn't exist, create with history_quiz as a list
        await userDoc.set({
          'history_quiz': [
            {
              'quiz': widget.pageState.name,
              'point': point,
              'jawaban_benar': jawabanBenar,
              'jawaban_salah': jawabanSalah,
              'list_jawaban_salah': listQuizPayload.map((e) => e.toJson()).toList(),
            }
          ],
        });
      }

      // Ambil data lama (jika ada)
      final existing = await leaderboards.get();

      if (existing.exists) {
        final data = existing.data() as Map<String, dynamic>?;
        final existingPointRaw = data?['point'];
        final existingPoint = existingPointRaw is int
            ? existingPointRaw
            : int.tryParse(existingPointRaw.toString()) ?? 0;

        if (int.parse(point) > existingPoint) {
          // Update jika point baru lebih tinggi
          await leaderboards.set({
            "id_user": userId,
            "name": name,
            "quiz": quizName,
            "point": int.parse(point),
            "jawaban_benar": jawabanBenar,
            "jawaban_salah": jawabanSalah,
            "list_jawaban_salah": listQuizPayload.map((e) => e.toJson()).toList(),
          });
        }
      } else {
        // Buat data baru
        await leaderboards.set({
          "id_user": userId,
          "name": name,
          "quiz": quizName,
          "point": point,
          "jawaban_benar": jawabanBenar,
          "jawaban_salah": jawabanSalah,
          "list_jawaban_salah": listQuizPayload.map((e) => e.toJson()).toList(),
        });
      }

      Get.back();

      showDialogBase(
        maxWidth: 500,
        barrierDismissible: true,
        content: DialogSelesaiQuiz(
          point: int.parse(point),
          jawabanBenar: jawabanBenar,
          jawabanSalah: jawabanSalah,
        ),
      );
    } catch (e) {
      Get.back();

      showCustomSnackBar(
        context: context,
        message: "Unexpected error: $e",
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  void initState() {
    instance = this;
    switch (widget.pageState) {
      case EnumQuizState.literasi:
        dataQuiz = QuizUtils.literasiList;
        quiz = QuizUtils.literasiList[currentIndex];
        break;
      case EnumQuizState.numerasi:
        dataQuiz = QuizUtils.numerasiList;
        quiz = QuizUtils.numerasiList[currentIndex];
        break;
    }

    userAnswers = List<String?>.filled(dataQuiz.length, null);
    SoundUtils.playSound(quiz.backsound);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

class QuizPayload {
  final String noSoal;
  final String? jawabanUser;

  QuizPayload({
    required this.noSoal,
    this.jawabanUser,
  });

  Map<String, dynamic> toJson() => {
        'noSoal': noSoal,
        'jawabanUser': jawabanUser,
      };
}
