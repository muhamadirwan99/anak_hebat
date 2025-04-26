import 'package:anak_hebat/core.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogPilihQuiz extends StatefulWidget {
  const DialogPilihQuiz({super.key});

  @override
  State<DialogPilihQuiz> createState() => _DialogPilihQuizState();
}

class _DialogPilihQuizState extends State<DialogPilihQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            "PILIH QUIZ!",
            style: GoogleFonts.baloo2(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: gray900,
            ),
          ),
          Text(
            "Kamu mau quiz apa hari ini?",
            style: GoogleFonts.baloo2(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: gray800,
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await FlameAudio.bgm.pause();
                },
                child: Image.asset(
                  MediaRes.button.belajarAngka,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
              InkWell(
                onTap: () async {
                  await FlameAudio.bgm.pause();
                },
                child: Image.asset(
                  MediaRes.button.belajarHuruf,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
