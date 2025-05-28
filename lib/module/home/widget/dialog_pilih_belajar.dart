import 'package:anak_hebat/core.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogPilihBelajar extends StatefulWidget {
  const DialogPilihBelajar({super.key});

  @override
  State<DialogPilihBelajar> createState() => _DialogPilihBelajarState();
}

class _DialogPilihBelajarState extends State<DialogPilihBelajar> {
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
            "PILIH MATERI!",
            style: GoogleFonts.baloo2(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: gray900,
            ),
          ),
          Text(
            "Kamu mau belajar apa hari ini?",
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
                  SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

                  await SoundUtils.stopSound();
                  await FlameAudio.bgm.pause();
                  newRouter.go(
                    RouterUtils.materi,
                    extra: EnumMateriState.ayoBelajar,
                  );
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
                  SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);

                  await SoundUtils.stopSound();
                  await FlameAudio.bgm.pause();
                  newRouter.go(
                    RouterUtils.materi,
                    extra: EnumMateriState.mengenalHuruf,
                  );
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
