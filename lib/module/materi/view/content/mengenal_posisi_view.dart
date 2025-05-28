import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalPosisiView extends StatefulWidget {
  final MateriController controller;

  const MengenalPosisiView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalPosisiView> createState() => MengenalPosisiState();
}

class MengenalPosisiState extends State<MengenalPosisiView> {
  @override
  void initState() {
    super.initState();
    widget.controller.playSoundsSequentially([
      MediaRes.audio.numerasi.mengenalPosisi.mengenalPosisi,
      MediaRes.audio.numerasi.mengenalPosisi.atasMeja,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                widget.controller.changePageState(EnumMateriState.ayoBelajar);
              },
              child: SvgPicture.asset(
                MediaRes.button.back,
                width: 100,
                height: 100,
              ),
            ),
            const Spacer(),
            Text(
              "Mengenal Posisi",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 17.0,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              widget.controller.modelMengenalPosisi.image,
            ),
            _buildButtonNext(),
            widget.controller.modelMengenalPosisi.level == 1
                ? const SizedBox()
                : Positioned(
                    left: -(125 / 2), // Jarak dari kanan, bisa disesuaikan
                    top: (766 / 2) - 62.5, // 125 / 2 (tinggi tombol)
                    child: InkWell(
                      onTap: () {
                        SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                        widget.controller.backMengenalPosisi();
                      },
                      child: SvgPicture.asset(
                        MediaRes.button.kembali,
                        width: 125,
                        height: 125,
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }

  Widget _buildButtonNext() {
    final model = widget.controller.modelMengenalPosisi;
    final list = widget.controller.listMengenalPosisi();
    int currentIndex = list.indexWhere((element) => element.level == model.level);
    final isLast = currentIndex == list.length - 1;

    if (isLast) {
      return const SizedBox();
    }

    return Positioned(
      right: -(125 / 2), // Jarak dari kanan, bisa disesuaikan
      top: (766 / 2) - 62.5, // 125 / 2 (tinggi tombol)
      child: InkWell(
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller.nextMengenalPosisi();
        },
        child: Transform.rotate(
          angle: 3.14159, // 180 degrees in radians
          child: SvgPicture.asset(
            MediaRes.button.kembali,
            width: 125,
            height: 125,
          ),
        ),
      ),
    );
  }
}

class MengenalPosisiModel {
  final int level;
  final String image, sound;

  MengenalPosisiModel({
    required this.level,
    required this.image,
    required this.sound,
  });
}
