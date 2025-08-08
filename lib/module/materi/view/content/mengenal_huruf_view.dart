import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalHurufView extends StatefulWidget {
  final MateriController controller;

  const MengenalHurufView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalHurufView> createState() => _MengenalHurufViewState();
}

class _MengenalHurufViewState extends State<MengenalHurufView> {
  @override
  void initState() {
    super.initState();
    SoundUtils.playSound(MediaRes.audio.introMateri.mengenalHuruf);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                await SoundUtils.stopSound();
                SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
                newRouter.go(RouterUtils.home);
              },
              child: SvgPicture.asset(
                MediaRes.button.back,
                width: 100,
                height: 100,
              ),
            ),
            const Spacer(),
            Text(
              "Mengenal Huruf",
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
          height: 70,
        ),
        SizedBox(
          width: 1529,
          child: StaggeredGrid.count(
            crossAxisCount: 9,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            children: widget.controller.listMengenalHuruf().map((model) {
              return ContainerMengenal(model: model);
            }).toList(),
          ),
        )
      ],
    );
  }
}
