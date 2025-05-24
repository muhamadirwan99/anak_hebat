import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerMencocokanAngka extends StatelessWidget {
  final MencocokanAngkaModel model;
  final bool isFromDetail;

  const ContainerMencocokanAngka({
    super.key,
    required this.model,
    this.isFromDetail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: model.colorBorder,
            width: 6,
          ),
          left: BorderSide(
            color: model.colorBorder,
            width: 6,
          ),
          right: BorderSide(
            color: model.colorBorder,
            width: 12,
          ),
          bottom: BorderSide(
            color: model.colorBorder,
            width: 12,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            18.0,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isFromDetail ? null : model.onTap,
          child: Center(
            child: Text(
              model.value,
              style: GoogleFonts.baloo2(
                fontSize: 128,
                fontWeight: FontWeight.bold,
                color: model.colorBorder,
                height: 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class MencocokanAngkaModel {
  final String value, textValue, image;
  final Color colorBorder;
  final VoidCallback onTap;

  MencocokanAngkaModel({
    required this.value,
    required this.textValue,
    required this.image,
    required this.colorBorder,
    required this.onTap,
  });
}
