import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DialogSelesaiQuiz extends StatefulWidget {
  final int point;
  final String jawabanBenar, jawabanSalah;

  const DialogSelesaiQuiz({
    super.key,
    required this.point,
    required this.jawabanBenar,
    required this.jawabanSalah,
  });

  @override
  State<DialogSelesaiQuiz> createState() => _DialogSelesaiQuizState();
}

class _DialogSelesaiQuizState extends State<DialogSelesaiQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32.0),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            "Quiz Selesai!",
            style: GoogleFonts.baloo2(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: green700,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: blueGray50,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  12.0,
                ),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Poin Kamu",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.point.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      MediaRes.images.coin,
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomProgressBar(persen: widget.point / 100), // 60%
              ],
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            children: [
              Expanded(
                child: _containerJawaban(
                  value: widget.jawabanBenar,
                  isJawabanBenar: true,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: _containerJawaban(
                  value: widget.jawabanSalah,
                  isJawabanBenar: false,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomHomeButton(
            text: "Coba Lagi",
            onPressed: () {
              SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
              Get.back();
              QuizController.instance.resetAnswers();
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomHomeButton(
            text: "Selesai",
            onPressed: () async {
              SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

              await SoundUtils.stopSound();
              newRouter.go(RouterUtils.home);
            },
            isPrimary: false,
          ),
        ],
      ),
    );
  }

  Widget _containerJawaban({
    required String value,
    required bool isJawabanBenar,
  }) {
    String image = isJawabanBenar ? MediaRes.images.benar : MediaRes.images.salah;
    String text = isJawabanBenar ? "Jawaban Benar" : "Jawaban Salah";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: blueGray50,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12.0,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            image,
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
