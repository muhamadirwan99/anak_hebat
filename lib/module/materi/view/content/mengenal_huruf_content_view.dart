import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalHurufContentView extends StatefulWidget {
  final MateriController controller;

  const MengenalHurufContentView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalHurufContentView> createState() =>
      _MengenalHurufContentViewState();
}

class _MengenalHurufContentViewState extends State<MengenalHurufContentView> {
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
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                widget.controller
                    .changePageState(EnumMateriState.mengenalHuruf);
              },
              child: SvgPicture.asset(
                MediaRes.button.back,
                width: 100,
                height: 100,
              ),
            ),
            Text(
              "Mengenal Huruf",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            InkWell(
              onTap: () {
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                widget.controller
                    .changePageState(EnumMateriState.mengenalHuruf);
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
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                widget.controller.backMengenalHuruf();
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
              width: 828,
              height: 370,
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
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      widget.controller.modelMengenalHuruf.image ?? "",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.controller.modelMengenalHuruf.title}${widget.controller.modelMengenalHuruf.title.toLowerCase()}",
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
                        widget.controller.modelMengenalHuruf.subtitle,
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
                      await SoundUtils.playSound(
                          widget.controller.modelMengenalHuruf.audio);
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
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                widget.controller.nextMengenalHuruf();
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
