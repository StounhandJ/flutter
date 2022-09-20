import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/ButtonCircularComponent.dart';
import 'package:flutter_application_3/components/TextComponent.dart';

class DetailedCardComponent extends StatelessWidget {
  const DetailedCardComponent(
    this.mainText,
    this.additionalText, {
    super.key,
    this.onPressed,
    this.width,
    this.height,
    this.color,
  });
// equal to "VoidCallback".

  final String mainText;
  final String additionalText;
  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonCircularComponent(
          Image.asset("assets/play.png"),
          width: 40,
          height: 45,
          circular: 15,
          backgroundColor: color,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: 150,
          child: Column(
            children: [
              SizedBox(
                width: 145,
                child: TextComponent(
                  mainText,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  textAlign: TextAlign.left,
                ),
              ),
              TextComponent(
                additionalText,
                color: Colors.grey,
                fontSize: 13,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 100,
        ),
        Image.asset("assets/ellipsis.png"),
      ],
    );
  }
}
