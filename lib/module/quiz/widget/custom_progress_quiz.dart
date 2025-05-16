import 'package:anak_hebat/core/color/color.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double persen;

  const CustomProgressBar({super.key, required this.persen})
      : assert(persen >= 0 && persen <= 1, 'Persen harus antara 0.0 dan 1.0');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: yellow200, // yellow200
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: persen,
        child: Container(
          decoration: const BoxDecoration(
            color: yellow600, // yellow600
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
