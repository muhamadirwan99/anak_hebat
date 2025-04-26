import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerMengenal extends StatefulWidget {
  final double? height, width;
  final MengenalModel model;

  const ContainerMengenal({
    super.key,
    this.height,
    this.width,
    required this.model,
  });

  @override
  State<ContainerMengenal> createState() => _ContainerMengenalState();
}

class _ContainerMengenalState extends State<ContainerMengenal> {
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
            widget.model.title,
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
