import 'package:anak_hebat/core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DialogHasilJawaban extends StatefulWidget {
  final bool isCorrect, isLast;
  final VoidCallback onPressed;

  const DialogHasilJawaban({
    super.key,
    required this.isCorrect,
    required this.isLast,
    required this.onPressed,
  });

  @override
  State<DialogHasilJawaban> createState() => _DialogHasilJawabanState();
}

class _DialogHasilJawabanState extends State<DialogHasilJawaban> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32.0),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          _getImage(),
          const SizedBox(
            height: 32.0,
          ),
          _getButton(),
        ],
      ),
    );
  }

  Widget _getImage() {
    final isCorrect = widget.isCorrect;
    return Column(
      children: [
        SvgPicture.asset(
          isCorrect ? MediaRes.images.star : MediaRes.images.silang,
          width: 350,
        ),
        const SizedBox(height: 16.0),
        Text(
          isCorrect ? "Jawaban Kamu Benar!" : "Jawaban Kamu Salah!",
          style: GoogleFonts.baloo2(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: isCorrect ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _getButton() {
    String text = widget.isLast ? "Selesai" : "Selanjutnya";
    text = widget.isCorrect ? text : "Coba Lagi";

    if (!widget.isCorrect) {
      return DangerButton(
        text: text,
        onPressed: widget.onPressed,
      );
    }

    return CustomHomeButton(
      text: text,
      onPressed: widget.onPressed,
    );
  }
}
