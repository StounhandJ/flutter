import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxTextComponent extends StatelessWidget {
  const BoxTextComponent(
    this.data, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.backgroundColor,
    this.padding,
  });
// equal to "VoidCallback".

  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: DefaultTextStyle(
        style: GoogleFonts.lato(
            fontSize: fontSize, fontWeight: fontWeight, color: color),
        child: Text(data),
      ),
    );
  }
}
