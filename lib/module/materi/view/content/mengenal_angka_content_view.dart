import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalAngkaContentView extends StatefulWidget {
  final MateriController controller;

  const MengenalAngkaContentView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalAngkaContentView> createState() => _MengenalAngkaContentViewState();
}

class _MengenalAngkaContentViewState extends State<MengenalAngkaContentView> {
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
              "Mengenal Angka",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            InkWell(
              onTap: () {
                widget.controller.changePageState(EnumMateriState.mengenalAngka);
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
          height: 140,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.controller.backMengenalAngka();
              },
              child: SvgPicture.asset(
                MediaRes.button.kembali,
                width: 125,
                height: 125,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Container(
              width: 440,
              height: 376,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.controller.modelMengenalAngka.title,
                        style: GoogleFonts.balsamiqSans(
                          fontSize: 200,
                          fontWeight: FontWeight.bold,
                          height: 0.9,
                          color: gray900,
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        widget.controller.modelMengenalAngka.subtitle,
                        style: GoogleFonts.balsamiqSans(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: gray900,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      await SoundUtils.playSound(widget.controller.modelMengenalAngka.audio);
                    },
                    child: SvgPicture.asset(
                      MediaRes.button.speakerOn,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            InkWell(
              onTap: () {
                widget.controller.nextMengenalAngka();
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
          ],
        ),
      ],
    );
  }
}
