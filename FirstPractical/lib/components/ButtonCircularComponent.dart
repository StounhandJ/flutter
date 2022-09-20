import 'package:flutter/material.dart';

class ButtonCircularComponent extends StatelessWidget {
  const ButtonCircularComponent(
    this.data, {
    super.key,
    this.backgroundColor,
    this.onPressed,
    this.width,
    this.height,
    this.foregroundColor,
    this.circular,
    this.sideWidth,
    this.sideColor,
  });
// equal to "VoidCallback".

  final Widget data;
  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final double? circular;
  final double? sideWidth;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? sideColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(Size(width ?? 30, height ?? 30)),
          backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color?>(foregroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              circular ?? 20.0,
            ),
            side: BorderSide(
              color: sideColor ?? Colors.white,
              width: sideWidth ?? 0,
            ),
          ))),
      onPressed: onPressed,
      child: data,
    );
  }
}
