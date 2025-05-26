import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PilihLevelView extends StatefulWidget {
  final MateriController controller;

  const PilihLevelView({
    super.key,
    required this.controller,
  });

  @override
  State<PilihLevelView> createState() => _PilihLevelViewState();
}

class _PilihLevelViewState extends State<PilihLevelView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
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
              "Pilih Level",
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
          width: 590,
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 60,
            crossAxisSpacing: 60,
            children: widget.controller.listMenghitungAngka().map((model) {
              return ContainerMenghitungAngka(model: model);
            }).toList(),
          ),
        )
      ],
    );
  }
}
