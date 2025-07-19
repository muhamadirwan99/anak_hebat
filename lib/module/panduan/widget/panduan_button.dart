import 'package:google_fonts/google_fonts.dart';
import 'package:anak_hebat/core.dart';
import 'package:flutter/material.dart';

class PanduanButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PanduanButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: yellow50,
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.balsamiqSans(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: gray900,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: gray900,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
