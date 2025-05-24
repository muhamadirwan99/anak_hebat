import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalBentukView extends StatefulWidget {
  final MateriController controller;

  const MengenalBentukView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalBentukView> createState() => MengenalBentukViewState();
}

class MengenalBentukViewState extends State<MengenalBentukView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
            const Spacer(),
            Text(
              widget.controller.modelMengenalBentuk.title,
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
          height: 132,
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
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 50,
            children: widget.controller.modelMengenalBentuk.listBentuk
                .map(
                  (bentuk) => Image.asset(
                    bentuk,
                    height: 300,
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          height: 50.0,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.controller.modelMengenalBentuk.soal == 1
                  ? const SizedBox()
                  : InkWell(
                      onTap: () {
                        widget.controller.backMengenalBentuk();
                      },
                      child: SvgPicture.asset(
                        MediaRes.button.backBentuk,
                      ),
                    ),
              _switchButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _switchButton() {
    final model = widget.controller.modelMengenalBentuk;
    final list = widget.controller.listMengenalBentuk();
    int currentIndex = list.indexWhere((element) => element.soal == model.soal);
    final isLast = currentIndex == list.length - 1;

    if (isLast) {
      return const SizedBox();
    }

    return InkWell(
      onTap: () {
        widget.controller.nextMengenalBentuk();
      },
      child: SvgPicture.asset(
        model.soal == 1 ? MediaRes.button.pola : MediaRes.button.nextBentuk,
      ),
    );
  }
}

class MengenalBentukModel {
  final List<String> listBentuk;
  final int soal;
  final String title;

  MengenalBentukModel({
    required this.listBentuk,
    required this.soal,
    required this.title,
  });
}
