import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DangerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const DangerButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isPrimary ? red700 : Colors.transparent,
          ),
          foregroundColor: MaterialStateProperty.all(
            isPrimary ? Colors.white : red700,
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: red900,
              width: 2,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.baloo2(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
