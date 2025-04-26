import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenghitungView extends StatefulWidget {
  final MateriController controller;

  const MenghitungView({
    super.key,
    required this.controller,
  });

  @override
  State<MenghitungView> createState() => _MenghitungViewState();
}

class _MenghitungViewState extends State<MenghitungView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                newRouter.go(RouterUtils.home);
              },
              child: SvgPicture.asset(
                MediaRes.button.back,
                width: 100,
                height: 100,
              ),
            ),
            Text(
              "Menghitung",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            InkWell(
              onTap: () {
                widget.controller.changePageState(EnumPageState.pilihLevel);
              },
              child: SvgPicture.asset(
                MediaRes.button.dashboard,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 520),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16,
                ),
              ),
            ),
            padding: const EdgeInsets.all(60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: StaggeredGrid.count(
                    crossAxisCount: getCrossAxisCount(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      for (var i = 0; i < widget.controller.modelMenghitungAngka.jawaban; i++)
                        Image.asset(
                          widget.controller.modelMenghitungAngka.gambar,
                          height: 150,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  "=",
                  style: GoogleFonts.balsamiqSans(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: gray900,
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                widget.controller.isAnswerCorrect
                    ? Text(
                        widget.controller.modelMenghitungAngka.jawaban.toString(),
                        style: GoogleFonts.balsamiqSans(
                          fontSize: 250,
                          fontWeight: FontWeight.w700,
                          color: gray900,
                          height: 1.0,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                      )
                    : Transform.translate(
                        offset: const Offset(0, -30),
                        child: Text(
                          widget.controller.modelMenghitungAngka.jawaban.toString(),
                          style: GoogleFonts.ralewayDots(
                            fontSize: 250,
                            color: gray900,
                            height: 1.0,
                          ),
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 544),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 351,
            children: [
              for (var i = 0; i < widget.controller.modelMenghitungAngka.pilihan.length; i++)
                containerJawaban(i),
            ],
          ),
        ),
      ],
    );
  }

  Widget containerJawaban(index) {
    return InkWell(
      onTap: () {
        if (widget.controller.modelMenghitungAngka.pilihan[index] ==
            widget.controller.modelMenghitungAngka.jawaban) {
          widget.controller.isAnswerCorrect = !widget.controller.isAnswerCorrect;
          // widget.controller.isAnswerCorrect = true;
          widget.controller.update();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Jawaban salah, coba lagi!',
                style: GoogleFonts.balsamiqSans(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              24,
            ),
          ),
        ),
        padding: const EdgeInsets.only(top: 24),
        child: Center(
          child: Text(
            widget.controller.modelMenghitungAngka.pilihan[index].toString(),
            style: GoogleFonts.balsamiqSans(
              fontSize: 150,
              fontWeight: FontWeight.bold,
              color: gray900,
              height: 0.9,
            ),
          ),
        ),
      ),
    );
  }

  int getCrossAxisCount() {
    if (widget.controller.modelMenghitungAngka.jawaban <= 3) {
      return 3;
    } else if (widget.controller.modelMenghitungAngka.jawaban <= 4) {
      return 2;
    } else if (widget.controller.modelMenghitungAngka.jawaban <= 6) {
      return 3;
    } else {
      return 4;
    }
  }
}
