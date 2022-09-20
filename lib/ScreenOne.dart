import 'package:flutter/material.dart';

import 'components/ButtonCircularComponent.dart';
import 'components/InviteFriendsComponent.dart';
import 'components/StreamCartComponent.dart';
import 'components/TextComponent.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 1, 196, 255),
      child: SafeArea(
        child: Stack(
          children: [
            Image.asset('assets/kit.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.fill),
            Center(
              child: Transform.scale(
                scale: 3,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.438),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 250, 246, 245),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 1.9),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 250, 246, 245),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(9),
                      child: RawMaterialButton(
                        onPressed: () {},
                        shape: const CircleBorder(),
                        fillColor: const Color.fromARGB(255, 254, 122, 21),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: ClipPath(
                            clipper: DrawTriangle(),
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const TextComponent('Secrets of Atlantis',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                        const ButtonCircularComponent(
                          TextComponent('Follow',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 254, 122, 21)),
                          width: 130,
                          height: 40,
                          backgroundColor: Color.fromARGB(255, 250, 246, 245),
                          circular: 10,
                          sideColor: Color.fromARGB(255, 254, 122, 21),
                          sideWidth: 1,
                        ),
                        const SizedBox(height: 10),
                        StreamCartComponent(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 160,
                        ),
                        const SizedBox(height: 20),
                        InviteFriendsComponent(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 80,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(10, 0);

    path.lineTo(10, size.height);
    path.lineTo(size.height, size.width / 2);

    return path;
  }

  @override
  bool shouldReclip(DrawTriangle oldClipper) => false;
}
