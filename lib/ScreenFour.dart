import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/TextComponent.dart';

import 'components/ButtonCircularComponent.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 3, 157, 162),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Column(children: const [
                TextComponent("medinow",
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                TextComponent("Meditate With Us!",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Column(
                children: [
                  ButtonCircularComponent(const Text("Sign in with Apple"),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      circular: 25),
                  const SizedBox(height: 12),
                  ButtonCircularComponent(
                      const Text("Continue with Email or Phone"),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      backgroundColor: const Color.fromARGB(255, 205, 253, 254),
                      foregroundColor: Colors.black,
                      circular: 25),
                  const SizedBox(height: 8),
                  const TextComponent("Continue With Google",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ],
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image(image: AssetImage('assets/med.png')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
