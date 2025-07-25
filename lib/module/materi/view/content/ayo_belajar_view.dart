import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AyoBelajarView extends StatefulWidget {
  final MateriController controller;

  const AyoBelajarView({
    super.key,
    required this.controller,
  });

  @override
  State<AyoBelajarView> createState() => _AyoBelajarViewState();
}

class _AyoBelajarViewState extends State<AyoBelajarView> {
  @override
  void initState() {
    super.initState();
    SoundUtils.playSound(MediaRes.audio.numerasi.ayoBelajarAngka);
  }

  @override
  Widget build(BuildContext context) {
    List<PilihMateriModel> listMateri = [
      PilihMateriModel(
        image: MediaRes.button.mengenalAngka,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller.changeBackground(MediaRes.background.kelas);
          widget.controller.changePageState(EnumMateriState.mengenalAngka);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.mencocokanAngka,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller
              .changeBackground(MediaRes.background.mencocokanAngka);
          widget.controller
              .changePageState(EnumMateriState.levelMencocokanAngka);
          // widget.controller.changePageState(EnumMateriState.pilihLevel);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.mengenalBentuk,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller
              .changeBackground(MediaRes.background.mencocokanAngka);
          widget.controller.changePageState(EnumMateriState.mengenalBentuk);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.mengenalPerbandingan,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller
              .changeBackground(MediaRes.background.mencocokanAngka);
          widget.controller
              .changePageState(EnumMateriState.mengenalPerbandingan);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.mengenalPosisiUrutan,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller.changeBackground(MediaRes.background.perbandingan2);
          widget.controller
              .changePageState(EnumMateriState.mengenalPosisiUrutan);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.mengenalPosisi,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller
              .changeBackground(MediaRes.background.mengenalPosisi);
          widget.controller.changePageState(EnumMateriState.mengenalPosisi);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.berhitung,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller.changeBackground(MediaRes.background.berhitung);
          widget.controller.changePageState(EnumMateriState.berhitung);
        },
      ),
      PilihMateriModel(
        image: MediaRes.button.mengenalAngkaBenda,
        onTap: () {
          SoundUtils.playSoundWithoutWaiting(MediaRes.audio.click);
          widget.controller.changeBackground(MediaRes.background.kelas);
          widget.controller.changePageState(EnumMateriState.pilihLevel);
        },
      ),
    ];
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
              "Ayo Belajar!",
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
          height: 14,
        ),
        SizedBox(
          width: 1340,
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            children: listMateri.map((model) {
              return _pilihMateriWidget(model);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _pilihMateriWidget(PilihMateriModel model) {
    return SizedBox(
      width: 300,
      height: 400,
      child: InkWell(
        onTap: model.onTap,
        child: Image.asset(
          model.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PilihMateriModel {
  final String image;
  final VoidCallback? onTap;

  PilihMateriModel({
    required this.image,
    required this.onTap,
  });
}
