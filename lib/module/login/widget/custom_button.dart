import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (isPrimary) {
              return const Color(0xffEF5B27);
            } else if (states.contains(MaterialState.hovered)) {
              return const Color(0xCCEF5B27); // oranye semi-transparan
            }
            return Colors.transparent;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (isPrimary) {
              return Colors.white;
            } else if (states.contains(MaterialState.hovered)) {
              return Colors.white;
            }
            return const Color(0xffEF5B27);
          }),
          side: MaterialStateProperty.all(
            const BorderSide(color: Color(0xffEF5B27)),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.baloo2(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
