import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerMenghitungAngka extends StatefulWidget {
  final double? height, width;
  final MenghitungAngkaModel model;

  const ContainerMenghitungAngka({
    super.key,
    this.height,
    this.width,
    required this.model,
  });

  @override
  State<ContainerMenghitungAngka> createState() =>
      _ContainerMenghitungAngkaState();
}

class _ContainerMenghitungAngkaState extends State<ContainerMenghitungAngka> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.model.onTap,
      child: Container(
        height: widget.height ?? 120,
        width: widget.width ?? 120,
        decoration: BoxDecoration(
          color: neutralWhite,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              18,
            ),
          ),
          border: Border.all(
            width: 6,
            color: green100,
          ),
        ),
        child: Center(
          child: Text(
            widget.model.level,
            style: GoogleFonts.balsamiqSans(
              fontSize: 96,
              fontWeight: FontWeight.bold,
              height: 0.95,
              color: green800,
            ),
          ),
        ),
      ),
    );
  }
}
