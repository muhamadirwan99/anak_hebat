import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';

class QuizController extends State<QuizView> {
  static late QuizController instance;
  late QuizView view;

  int currentIndex = 0;
  List<String?> userAnswers = [];
  List dataQuiz = [];

  bool isSelected(String value) => userAnswers[currentIndex] == value;

  late QuizModel quiz;

  void selectAnswer(String answer) {
    if (currentIndex >= userAnswers.length) return; // Cegah IndexOutOfBounds
    userAnswers[currentIndex] = answer;
    update();
  }

  void nextQuestion() {
    if (userAnswers[currentIndex] == null) return;

    if (currentIndex < dataQuiz.length - 1) {
      currentIndex++;
      quiz = dataQuiz[currentIndex]; // Tambahkan ini!
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

      showDialogBase(
        maxWidth: 500,
        barrierDismissible: true,
        content: DialogSelesaiQuiz(
          point: correctAnswers * 10,
          jawabanBenar: correctAnswers.toString(),
          jawabanSalah: incorrectAnswers.length.toString(),
        ),
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
}
