import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BerhitungView extends StatefulWidget {
  final MateriController controller;

  const BerhitungView({
    super.key,
    required this.controller,
  });

  @override
  State<BerhitungView> createState() => BerhitungViewState();
}

class BerhitungViewState extends State<BerhitungView> {
  @override
  void initState() {
    super.initState();
    SoundUtils.playSound(MediaRes.audio.numerasi.berhitung.belajarBerhitung)
        .whenComplete(
            () => SoundUtils.playSound(widget.controller.modelBerhitung.sound));
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
              "Berhitung",
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
          height: 16.0,
        ),
        SizedBox(
          width: 1300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: StaggeredGrid.count(
                  crossAxisCount:
                      getCrossAxisCount(widget.controller.modelBerhitung.soalA),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    for (var i = 0;
                        i < widget.controller.modelBerhitung.soalA;
                        i++)
                      Image.asset(
                        widget.controller.modelBerhitung.imageA,
                        height:
                            getHeight(widget.controller.modelBerhitung.imageA),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50.0,
              ),
              Text(
                "+",
                style: GoogleFonts.balsamiqSans(
                  fontSize: 200,
                  fontWeight: FontWeight.bold,
                  height: 0.8,
                ),
              ),
              const SizedBox(
                width: 50.0,
              ),
              Expanded(
                child: StaggeredGrid.count(
                  crossAxisCount:
                      getCrossAxisCount(widget.controller.modelBerhitung.soalB),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    for (var i = 0;
                        i < widget.controller.modelBerhitung.soalB;
                        i++)
                      Image.asset(
                        widget.controller.modelBerhitung.imageB,
                        height:
                            getHeight(widget.controller.modelBerhitung.imageB),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        SizedBox(
          width: 800,
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 52,
            children: [
              for (var i = 0;
                  i < widget.controller.modelBerhitung.pil.length;
                  i++)
                containerJawaban(
                  widget.controller.modelBerhitung.pil[i],
                ),
            ],
          ),
        ),
      ],
    );
  }

  int? selectedPil;

  Widget containerJawaban(int pil) {
    bool isSelected = selectedPil == pil;
    return InkWell(
      onTap: () {
        SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
        setState(() {
          selectedPil = pil;
        });
        widget.controller.checkAnswerBerhitung(pil);
      },
      child: Container(
        height: 244,
        width: 244,
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
              fontSize: 208,
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

  int getCrossAxisCount(int value) {
    if (value <= 3) {
      return 2;
    } else {
      return 4;
    }
  }

  double getHeight(String value) {
    if (value.contains("buahNaga")) {
      return 312;
    }
    return 200;
  }
}

class BerhitungModel {
  final String level, imageA, imageB, sound;
  final int soalA, soalB, jawaban;
  final List<int> pil;

  BerhitungModel({
    required this.sound,
    required this.level,
    required this.imageA,
    required this.imageB,
    required this.soalA,
    required this.soalB,
    required this.jawaban,
    required this.pil,
  });
}
