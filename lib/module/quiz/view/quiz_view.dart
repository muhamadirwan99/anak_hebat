import 'package:flutter/material.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizView extends StatefulWidget {
  final EnumQuizState pageState;

  const QuizView({
    super.key,
    required this.pageState,
  });

  Widget build(context, QuizController controller) {
    controller.view = this;

    final quiz = controller.quiz; // Soal saat ini
    final answer = quiz.jawaban;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(MediaRes.background.kelas),
            fit: BoxFit.fill,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                            showDialogBase(
                              maxWidth: 600,
                              barrierDismissible: true,
                              content: const DialogExitQuiz(),
                            );
                          },
                          child: SvgPicture.asset(
                            MediaRes.button.back,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Quiz!",
                          style: GoogleFonts.balsamiqSans(
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                            color: gray900,
                          ),
                        ),
                        const Spacer(),
                        Builder(builder: (context) {
                          if (controller.checkIndex(pageState)) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                                    showDialogBase(
                                      maxWidth: 1548,
                                      barrierDismissible: true,
                                      content: const DialogCeritaQuiz(),
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    MediaRes.button.tandaSeru,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                        GreenNumberBox(
                          value: "${controller.currentIndex + 1}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: blue50,
                              border: Border.all(
                                color: blue700,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Center(
                              child: Text(
                                "Jawab Pertanyaan Berikut!",
                                style: GoogleFonts.baloo2(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: blue700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          _soal(context, widget: quiz.soal),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "Silakan pilih jawaban kamu",
                            style: GoogleFonts.baloo2(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: _jawaban(
                                  context,
                                  onTap: () => controller.selectAnswer(answer.jawabanA),
                                  isSelected: controller.isSelected(answer.jawabanA),
                                  value: answer.jawabanA,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: _jawaban(
                                  context,
                                  onTap: () => controller.selectAnswer(answer.jawabanB),
                                  isSelected: controller.isSelected(answer.jawabanB),
                                  value: answer.jawabanB,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: _jawaban(
                                  context,
                                  onTap: () => controller.selectAnswer(answer.jawabanC),
                                  isSelected: controller.isSelected(answer.jawabanC),
                                  value: answer.jawabanC,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          CustomHomeButton(
                            text: "Jawab",
                            onPressed: controller.nextQuestion,
                            isPrimary: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _jawaban(
    BuildContext context, {
    required String value,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return Container(
      height: 152,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: blue50,
        border: Border.all(
          color: blue700,
          width: isSelected ? 5 : 0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Builder(
              builder: (context) {
                bool isImage = value.contains('.png') ||
                    value.contains('.jpg') ||
                    value.contains('.jpeg') ||
                    value.contains('.svg');

                if (!isImage) {
                  return Center(
                    child: Text(
                      value,
                      style: GoogleFonts.baloo2(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return SizedBox(
                  height: 120,
                  child: value.contains('.svg')
                      ? SvgPicture.asset(value, fit: BoxFit.fitHeight)
                      : Image.asset(value, fit: BoxFit.fitHeight),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _soal(
    BuildContext context, {
    required Widget widget,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: neutralWhite,
        border: Border.all(color: blueGray50, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(16),
      child: widget,
    );
  }

  @override
  State<QuizView> createState() => QuizController();
}
