import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizUtils {
  static List<QuizModel> numerasiList = [
    QuizModel(
      soal: Column(
        children: [
          Text(
            "Manakah gambar yang berbeda dari yang lain?",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          SvgPicture.asset(
            MediaRes.quiz.numerasi.soal1,
            height: 75,
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban1A,
        jawabanB: MediaRes.quiz.numerasi.jawaban1B,
        jawabanC: "Tidak ada yang berbeda",
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban1B,
    ),
    QuizModel(
      soal: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lihatlah pola berikut ini: ",
                style: GoogleFonts.baloo2(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SvgPicture.asset(
                MediaRes.quiz.numerasi.soal2,
                height: 70,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            "Apakah  buah selanjutnya?",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban2A,
        jawabanB: MediaRes.quiz.numerasi.jawaban2B,
        jawabanC: MediaRes.quiz.numerasi.jawaban2C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban2A,
    ),
    QuizModel(
      soal: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ani punya 2 bola merah dan 1 bola biru.\nBerapa bola merah  yang Ani miliki ?",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          SvgPicture.asset(
            MediaRes.quiz.numerasi.soal3,
            height: 166,
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban3A,
        jawabanB: MediaRes.quiz.numerasi.jawaban3B,
        jawabanC: MediaRes.quiz.numerasi.jawaban3C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban3C,
    ),
    QuizModel(
      soal: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lihatlah pola berikut ini: ",
                style: GoogleFonts.baloo2(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SvgPicture.asset(
                MediaRes.quiz.numerasi.soal4,
                height: 56,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            "Apa bentuk selanjutnya?",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban4A,
        jawabanB: MediaRes.quiz.numerasi.jawaban4B,
        jawabanC: MediaRes.quiz.numerasi.jawaban4C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban4A,
    ),
    QuizModel(
      soal: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Berapa jumlah jari di gambar ini? ",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          SvgPicture.asset(
            MediaRes.quiz.numerasi.soal5,
            height: 125,
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban5A,
        jawabanB: MediaRes.quiz.numerasi.jawaban5B,
        jawabanC: MediaRes.quiz.numerasi.jawaban5C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban5C,
    ),
    QuizModel(
      soal: Column(
        children: [
          Text(
            "Manakah yang lebih banyak?",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                MediaRes.quiz.numerasi.soal6A,
                height: 86,
              ),
              Text(
                " atau ",
                style: GoogleFonts.baloo2(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SvgPicture.asset(
                MediaRes.quiz.numerasi.soal6B,
                height: 86,
              ),
            ],
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban6A,
        jawabanB: MediaRes.quiz.numerasi.jawaban6B,
        jawabanC: "SAMA",
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban6B,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Urutan bilangan yang benar dari kecil ke besar adalah...",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban7A,
        jawabanB: MediaRes.quiz.numerasi.jawaban7B,
        jawabanC: MediaRes.quiz.numerasi.jawaban7C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban7A,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Benda manakah yang berbentuk lingkaran?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban8A,
        jawabanB: MediaRes.quiz.numerasi.jawaban8B,
        jawabanC: MediaRes.quiz.numerasi.jawaban8C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban8A,
    ),
    QuizModel(
      soal: Text(
        "Kucing ada di bawah meja. Di mana posisi kucing?",
        style: GoogleFonts.baloo2(
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: "Di atas meja",
        jawabanB: "Di dalam meja",
        jawabanC: "Di bawah meja ",
      ),
      jawabanBenar: "Di bawah meja ",
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Manakah benda yang bisa berguling?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.numerasi.jawaban10A,
        jawabanB: MediaRes.quiz.numerasi.jawaban10B,
        jawabanC: MediaRes.quiz.numerasi.jawaban10C,
      ),
      jawabanBenar: MediaRes.quiz.numerasi.jawaban10B,
    ),
  ];

  static List<QuizModel> literasiList = [
    QuizModel(
      soal: Center(
        child: Text(
          "Pilih huruf A dan gambar  ayam!",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban1A,
        jawabanB: MediaRes.quiz.literasi.jawaban1B,
        jawabanC: MediaRes.quiz.literasi.jawaban1C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban1A,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Pilih hewan yang suka makan wortel!",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban2A,
        jawabanB: MediaRes.quiz.literasi.jawaban2B,
        jawabanC: MediaRes.quiz.literasi.jawaban2C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban2B,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Yang manakah 2 hewan yang hidupnya di air?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban3A,
        jawabanB: MediaRes.quiz.literasi.jawaban3B,
        jawabanC: MediaRes.quiz.literasi.jawaban3C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban3A,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Manakah dari gambar berikut yang menunjukkan  huruf A ?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban4A,
        jawabanB: MediaRes.quiz.literasi.jawaban4B,
        jawabanC: MediaRes.quiz.literasi.jawaban4C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban4C,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Coba tunjuk huruf 'O' di antara huruf-huruf berikut:",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban5A,
        jawabanB: MediaRes.quiz.literasi.jawaban5B,
        jawabanC: MediaRes.quiz.literasi.jawaban5C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban5A,
    ),
    QuizModel(
      soal: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            MediaRes.quiz.numerasi.jawaban8A,
            height: 70,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            "Huruf awal dari gambar berikut adalah...",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban6A,
        jawabanB: MediaRes.quiz.literasi.jawaban6B,
        jawabanC: MediaRes.quiz.literasi.jawaban6C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban6C,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Gambar mana saja yang namanya dimulai dengan huruf 'S'?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban7A,
        jawabanB: MediaRes.quiz.literasi.jawaban7B,
        jawabanC: MediaRes.quiz.literasi.jawaban7C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban7B,
    ),
    QuizModel(
      soal: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bunyi huruf  apakah ini?",
            style: GoogleFonts.baloo2(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          InkWell(
            onTap: () async {
              await SoundUtils.playSound(
                MediaRes.quiz.literasi.quiz8,
              );
            },
            child: SvgPicture.asset(
              MediaRes.button.speakerOn,
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban8A,
        jawabanB: MediaRes.quiz.literasi.jawaban8B,
        jawabanC: MediaRes.quiz.literasi.jawaban8C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban8C,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Dalam cerita kelinci dan kura kura yang lomba lari siapakah yang menjadi juri ?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban9A,
        jawabanB: MediaRes.quiz.literasi.jawaban9B,
        jawabanC: MediaRes.quiz.literasi.jawaban9C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban9A,
    ),
    QuizModel(
      soal: Center(
        child: Text(
          "Setelah mendengar cerita “Kelinci dan Kura-kura”, siapa yang akhirnya menang lomba lari?",
          style: GoogleFonts.baloo2(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      jawaban: QuizAnswerModel(
        jawabanA: MediaRes.quiz.literasi.jawaban10A,
        jawabanB: MediaRes.quiz.literasi.jawaban10B,
        jawabanC: MediaRes.quiz.literasi.jawaban10C,
      ),
      jawabanBenar: MediaRes.quiz.literasi.jawaban10C,
    ),
  ];
}
