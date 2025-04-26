import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerData extends StatefulWidget {
  final double? height, width;
  final ContainerDataModel model;

  const ContainerData({
    super.key,
    this.height,
    this.width,
    required this.model,
  });

  @override
  State<ContainerData> createState() => _ContainerDataState();
}

class _ContainerDataState extends State<ContainerData> {
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

class ContainerDataModel {
  final String title, subtitle, audio;
  final VoidCallback onTap;

  ContainerDataModel({
    required this.title,
    required this.subtitle,
    required this.audio,
    required this.onTap,
  });
}
