import 'package:anak_hebat/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DialogExitQuiz extends StatefulWidget {
  const DialogExitQuiz({super.key});

  @override
  State<DialogExitQuiz> createState() => _DialogExitQuizState();
}

class _DialogExitQuizState extends State<DialogExitQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Keluar dari Kuis?",
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Apakah kamu yakin ingin keluar dari sesi kuis?",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            decoration: const BoxDecoration(
              color: yellow50,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Perhatian:",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: yellow900,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  • ",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: yellow900,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Progresmu tidak akan tersimpan.",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: yellow900,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  • ",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: yellow900,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Kamu harus mengulang dari awal jika ingin kembali nanti.",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: yellow900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: CustomHomeButton(
                  text: "Batal",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isPrimary: false,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CustomHomeButton(
                  text: "Keluar",
                  onPressed: () async {
                    await SoundUtils.stopSound();
                    newRouter.go(RouterUtils.home);
                  },
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
