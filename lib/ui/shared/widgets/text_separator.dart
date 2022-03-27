import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  const TextSeparator({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.white.withOpacity(.3),
          fontSize: 12,
        ),
      ),
    );
  }
}
