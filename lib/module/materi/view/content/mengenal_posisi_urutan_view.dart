import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalPosisiUrutanView extends StatefulWidget {
  final MateriController controller;

  const MengenalPosisiUrutanView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalPosisiUrutanView> createState() => MengenalPerbaPosisiUrutantate();
}

class MengenalPerbaPosisiUrutantate extends State<MengenalPosisiUrutanView> {
  @override
  void initState() {
    super.initState();
    widget.controller.playSoundsSequentially([
      MediaRes.audio.numerasi.mengenalPosisiUrutan.mengenalPosisiUrutan,
      MediaRes.audio.numerasi.mengenalPosisiUrutan.ceritaUrutan,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                if (widget.controller.modelMengenalPosisiUrutan.soal == "1") {
                  widget.controller.changePageState(EnumMateriState.ayoBelajar);
                } else {
                  widget.controller.backMengenalPosisiUrutan();
                }
              },
              child: SvgPicture.asset(
                MediaRes.button.back,
                width: 100,
                height: 100,
              ),
            ),
            Text(
              "Mengenal Posisi Urutan",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            widget.controller.modelMengenalPosisiUrutan.soal.contains("Segitiga")
                ? const SizedBox.shrink()
                : InkWell(
                    onTap: () {
                      SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                      widget.controller.nextMengenalPosisiUrutan();
                    },
                    child: Transform.rotate(
                      angle: 3.14159, // 180 degrees in radians
                      child: SvgPicture.asset(
                        MediaRes.button.back,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
          ],
        ),
        _switchContent(),
      ],
    );
  }

  int? selectedPil;

  Widget _switchContent() {
    if (widget.controller.modelMengenalPosisiUrutan.jawaban == 0) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        const SizedBox(
          height: 75,
        ),
        Container(
          width: 1306,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              StaggeredGrid.count(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                children: [
                  for (var i = 0; i < widget.controller.modelMengenalPosisiUrutan.image.length; i++)
                    ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 178 / 225, // 225 - 47 = 178, so crop 47px from bottom
                        child: Image.asset(
                          widget.controller.modelMengenalPosisiUrutan.image[i],
                          height: 225,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                widget.controller.modelMengenalPosisiUrutan.soal,
                style: GoogleFonts.balsamiqSans(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: gray900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  containerJawaban(
                    widget.controller.modelMengenalPosisiUrutan.pilA,
                  ),
                  const SizedBox(
                    width: 32.0,
                  ),
                  containerJawaban(
                    widget.controller.modelMengenalPosisiUrutan.pilB,
                  ),
                  const SizedBox(
                    width: 32.0,
                  ),
                  containerJawaban(
                    widget.controller.modelMengenalPosisiUrutan.pilC,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget containerJawaban(int pil) {
    bool isSelected = selectedPil == pil;
    return InkWell(
      onTap: () {
        SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
        setState(() {
          selectedPil = pil;
        });
        widget.controller.checkAnswerMengenalPosisiUrutan(pil);
      },
      child: Container(
        height: 150,
        width: 150,
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
              : Border.all(
                  color: blueGray50,
                  width: 8,
                ),
        ),
        child: Center(
          child: Text(
            pil.toString(),
            style: GoogleFonts.baloo2(
              fontSize: 128,
              fontWeight: FontWeight.bold,
              color: primaryGreen,
              height: 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class MengenalPosisiUrutanModel {
  final String soal, background;
  final List<String> image, sound;
  final int jawaban, pilA, pilB, pilC;

  MengenalPosisiUrutanModel({
    required this.sound,
    required this.soal,
    required this.background,
    required this.image,
    required this.jawaban,
    required this.pilA,
    required this.pilB,
    required this.pilC,
  });
}
