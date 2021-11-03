import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithShadow extends StatelessWidget {
  const TitleWithShadow({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: Text(
        title,
        style: GoogleFonts.bebasNeue(
          letterSpacing: 2,
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          shadows: [
            const Shadow(
              blurRadius: 20,
              offset: Offset(5, 5),
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
