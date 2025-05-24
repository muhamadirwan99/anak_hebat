import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MencocokanAngkaView extends StatefulWidget {
  final MateriController controller;

  const MencocokanAngkaView({
    super.key,
    required this.controller,
  });

  @override
  State<MencocokanAngkaView> createState() => _MencocokanAngkaViewState();
}

class _MencocokanAngkaViewState extends State<MencocokanAngkaView> {
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
              "Mencocokan Angka",
              style: GoogleFonts.balsamiqSans(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: gray900,
              ),
            ),
            InkWell(
              onTap: () {
                widget.controller.changePageState(EnumMateriState.levelMencocokanAngka);
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
            Container(
              width: 828,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ContainerMencocokanAngka(
                    model: widget.controller.modelMencocokanAngka,
                    isFromDetail: true,
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    "=",
                    style: GoogleFonts.balsamiqSans(
                      fontSize: 128,
                      fontWeight: FontWeight.bold,
                      height: 0.8,
                    ),
                  ),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 350,
                      child: StaggeredGrid.count(
                        crossAxisCount: getCrossAxisCount(),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          for (var i = 0;
                              i < int.parse(widget.controller.modelMencocokanAngka.value);
                              i++)
                            Image.asset(
                              widget.controller.modelMencocokanAngka.image,
                              height: getHeight(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        Container(
          width: 828,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  widget.controller.backMencocokanAngka();
                },
                child: Transform.rotate(
                  angle: 3.14159, // 180 degrees in radians
                  child: SvgPicture.asset(
                    MediaRes.button.next,
                    width: 125,
                    height: 125,
                  ),
                ),
              ),
              Text(
                widget.controller.modelMencocokanAngka.textValue,
                style: GoogleFonts.baloo2(
                  fontSize: 108,
                  fontWeight: FontWeight.bold,
                  color: widget.controller.modelMencocokanAngka.colorBorder,
                  height: 0.8,
                ),
              ),
              InkWell(
                onTap: () {
                  widget.controller.nextMencocokanAngka();
                },
                child: SvgPicture.asset(
                  MediaRes.button.next,
                  width: 125,
                  height: 125,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int getCrossAxisCount() {
    int value = int.parse(widget.controller.modelMencocokanAngka.value);
    if (value <= 2) {
      return 1;
    } else if (value <= 4) {
      return 2;
    } else {
      return 4;
    }
  }

  double getHeight() {
    int value = int.parse(widget.controller.modelMencocokanAngka.value);
    if (value <= 1) {
      return 212;
    } else if (value <= 2) {
      return 200;
    } else if (value <= 4) {
      return 153;
    } else {
      return 100;
    }
  }
}
