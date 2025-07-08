import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DialogCeritaQuiz extends StatefulWidget {
  const DialogCeritaQuiz({super.key});

  @override
  State<DialogCeritaQuiz> createState() => _DialogCeritaQuizState();
}

class _DialogCeritaQuizState extends State<DialogCeritaQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      constraints: const BoxConstraints(
        maxHeight: 800, // Atur sesuai kebutuhanmu
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                24, 24, 24, 100), // Sisakan ruang bawah
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cerita: Kelinci dan Kura-Kura",
                        style: GoogleFonts.baloo2(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      InkWell(
                        onTap: () async {
                          SoundUtils.playSoundWithoutWaiting(
                              MediaRes.audio.click);

                          await SoundUtils.playSound(
                              MediaRes.quiz.literasi.quiz910);
                        },
                        child: SvgPicture.asset(
                          MediaRes.button.speakerOn,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Di sebuah hutan, hiduplah seekor kelinci yang suka berlari cepat. Kelinci sangat bangga karena dia bisa berlari lebih kencang dari semua hewan yang lain di hutan.Pada suatu hari, kelinci bertemu dengan kura-kura dan berkata “Hai kura-kura, kamu berjalan lambat sekali, kamu tidak akan bisa menang lomba lari kalau seperti itu,” kata kelinci sambil tertawa.\n\nKura-kura tersenyum dan berkata, “Kalau begitu, ayo kita lomba lari. Siapa tahu aku bisa menang.”Kelinci pun setuju, dan semua hewan di hutan berkumpul untuk menyaksikan perlombaan kelinci dan kura kura. Singa bertugas menjadi juri dan memberi aba-aba.\n\n“Siap… satu, dua, tiga… MULAI!” kata Singa.\n\nKelinci langsung melesat ke depan dengan sangat cepat, sementara kura-kura berjalan pelan tapi pasti. Karena merasa yakin akan menang, kelinci berhenti di bawah pohon dan berkata, “Aku istirahat dulu sebentar, kura-kura masih jauh di belakang.” Namun, kelinci tertidur karena terlalu lama beristirahat.\n\nSementara itu, kura-kura terus berjalan dengan sabar. Langkah demi langkah, ia melewati kelinci yang sedang tidur.\n\nKetika kelinci terbangun, ia melihat kura-kura sudah hampir sampai di garis akhir. Kelinci pun berlari secepat mungkin, tapi sudah terlambat.\n\nKura-kura sampai duluan dan menang!\n\nSemua hewan bersorak, kelincipun menyesali perbuatannya. Ia belajar bahwa kita  tidak boleh sombong, dan yang tekun bisa berhasil.",
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating button
          Positioned(
            bottom: 16,
            right: 24,
            left: 24,
            child: CustomHomeButton(
              text: "Tutup",
              onPressed: () async {
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

                await SoundUtils.stopSound();
                Get.back();
              },
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }
}
