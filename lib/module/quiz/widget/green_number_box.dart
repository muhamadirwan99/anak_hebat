import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreenNumberBox extends StatelessWidget {
  final String value;

  const GreenNumberBox({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF006430),
            Color(0xFF1FB767),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: green800,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                height: 0.95,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
