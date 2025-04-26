import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
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
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                widget.controller.changePageState(EnumPageState.mengenalAngka);
              },
              child: Image.asset(
                MediaRes.button.mengenalAngka,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            InkWell(
              onTap: () {
                widget.controller.changePageState(EnumPageState.menghitung);
              },
              child: Image.asset(
                MediaRes.button.mencocokanAngka,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
