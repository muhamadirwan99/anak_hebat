import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MengenalHurufView extends StatefulWidget {
  const MengenalHurufView({super.key});

  @override
  State<MengenalHurufView> createState() => _MengenalHurufViewState();
}

class _MengenalHurufViewState extends State<MengenalHurufView> {
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
              onTap: () {},
              child: Image.asset(
                MediaRes.button.mengenalAngka,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            InkWell(
              onTap: () {},
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
