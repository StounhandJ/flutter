import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  const TextComponent(
    this.data, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
  });
// equal to "VoidCallback".

  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.lato(
          fontSize: fontSize,
          fontWeight: fontWeight,
          textStyle: const TextStyle(),
          color: color ?? Colors.black),
      child: Text(
        data,
        textAlign: textAlign,
      ),
    );
    // return DefaultTextStyle(
    //   style: const TextStyle(),
    //   child: Text(
    //     data,
    //     textAlign: textAlign,
    //   ),
    // );
  }
}
