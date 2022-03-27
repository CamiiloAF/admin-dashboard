import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  const WhiteCard({
    required this.child,
    this.title,
    this.width,
    Key? key,
  }) : super(key: key);

  final String? title;
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: _buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
          ],
          child,
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 5)
      ],
    );
  }
}
