import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelMencocokanAngkaView extends StatefulWidget {
  final MateriController controller;

  const LevelMencocokanAngkaView({
    super.key,
    required this.controller,
  });

  @override
  State<LevelMencocokanAngkaView> createState() => LevelMencocokanAngkaViewState();
}

class LevelMencocokanAngkaViewState extends State<LevelMencocokanAngkaView> {
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
              "Mencocokan Angka",
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
          height: 85,
        ),
        Container(
          width: 1300,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: StaggeredGrid.count(
            crossAxisCount: 5,
            mainAxisSpacing: 50,
            crossAxisSpacing: 50,
            children: widget.controller.listMencocokanAngka().map((model) {
              return ContainerMencocokanAngka(model: model);
            }).toList(),
          ),
        )
      ],
    );
  }
}
