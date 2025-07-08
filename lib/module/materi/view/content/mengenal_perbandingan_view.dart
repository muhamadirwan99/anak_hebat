import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalPerbandinganView extends StatefulWidget {
  final MateriController controller;

  const MengenalPerbandinganView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalPerbandinganView> createState() =>
      MengenalPerbandinganViewState();
}

class MengenalPerbandinganViewState extends State<MengenalPerbandinganView> {
  @override
  void initState() {
    super.initState();
    widget.controller.playSoundsSequentially([
      MediaRes.audio.numerasi.mengenalPerbandingan.perbandinganJumlahBenda,
      MediaRes.audio.numerasi.mengenalPerbandingan.manaLebihBanyak,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Mengenal Perbandingan",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            const Spacer(),
          ],
        ),
        Container(
          width: 1600,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Text(
            widget.controller.modelMengenalPerbandingan.soal,
            style: GoogleFonts.balsamiqSans(
              fontSize: 40,
              color: gray900,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          width: 1600,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          padding: const EdgeInsets.all(50),
          child: Row(
            children: [
              Expanded(
                child: containerJawaban(
                  widget.controller.modelMengenalPerbandingan.pilA,
                  widget.controller.modelMengenalPerbandingan.imageA,
                ),
              ),
              const SizedBox(
                width: 50.0,
              ),
              Expanded(
                child: containerJawaban(
                  widget.controller.modelMengenalPerbandingan.pilB,
                  widget.controller.modelMengenalPerbandingan.imageB,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int? selectedPil;

  Widget containerJawaban(int pil, String image) {
    bool isSelected = selectedPil == pil;
    return InkWell(
      onTap: () {
        SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
        setState(() {
          selectedPil = pil;
        });
        widget.controller.checkAnswerMengenalPerbandingan(pil);
      },
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          border: isSelected
              ? Border.all(
                  color: const Color(0xff1E88E5),
                  width: 8,
                )
              : null,
        ),
        padding: const EdgeInsets.all(58),
        child: Center(
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 24,
            children: [
              for (var i = 0; i < pil; i++)
                Image.asset(
                  image,
                  height: 180,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MengenalPerbandinganModel {
  final String soal, imageA, imageB;
  final int jawaban, pilA, pilB;

  MengenalPerbandinganModel({
    required this.soal,
    required this.imageA,
    required this.imageB,
    required this.jawaban,
    required this.pilA,
    required this.pilB,
  });
}
