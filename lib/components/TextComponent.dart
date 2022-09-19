import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  const TextComponent(
    this.data, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
  });
// equal to "VoidCallback".

  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.lato(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
      child: Text(data),
    );
  }
}
