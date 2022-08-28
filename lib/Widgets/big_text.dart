import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  BigText({Key? key, this.color = const Color(0xFF332d2b), required this.text, this.size=20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.cairo(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
