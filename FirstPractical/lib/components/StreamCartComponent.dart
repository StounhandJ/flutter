import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/TextComponent.dart';

import 'BoxTextComponent.dart';

class StreamCartComponent extends StatelessWidget {
  const StreamCartComponent(
      {super.key, required this.height, required this.width});
// equal to "VoidCallback".

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.75,
          width: width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 64, 50, 133),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/avatar.png'),
                    const SizedBox(width: 8),
                    Column(
                      children: const [
                        TextComponent(
                          "Codin",
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 5),
                        BoxTextComponent(
                          "Host",
                          backgroundColor: Color(0xFF262044),
                          padding: EdgeInsets.all(5),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    const Flexible(
                        child: TextComponent(
                            "The Secrets of Atlantis podcast is designed for all fantasy enthusiasts, everything from debunking underwat... see more")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/rating.png'),
                        const TextComponent("●"),
                        const BoxTextComponent(
                          "Fantasy",
                          backgroundColor: Color(0xFF271D5A),
                          padding: EdgeInsets.all(7),
                        ),
                      ],
                    ),
                    Image.asset('assets/bell.png'),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: height * 0.25,
          width: width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 29, 15, 90),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/avatars.png',
                  height: 30,
                ),
                Image.asset(
                  'assets/live.png',
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
