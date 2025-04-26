import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalAngkaView extends StatefulWidget {
  final MateriController controller;

  const MengenalAngkaView({
    super.key,
    required this.controller,
  });

  @override
  State<MengenalAngkaView> createState() => _MengenalAngkaViewState();
}

class _MengenalAngkaViewState extends State<MengenalAngkaView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              "Mengenal Angka",
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
          height: 150,
        ),
        SizedBox(
          width: 872,
          child: StaggeredGrid.count(
            crossAxisCount: 5,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            children: widget.controller.listMengenalAngka().map((model) {
              return ContainerMengenal(model: model);
            }).toList(),
          ),
        )
      ],
    );
  }
}
