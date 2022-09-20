import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/ButtonCircularComponent.dart';
import 'package:flutter_application_3/components/TextComponent.dart';

import 'components/DetailedCardComponent.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/river.png'),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                height: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TextComponent("Peter Mach",
                        color: Colors.grey, textAlign: TextAlign.start),
                    TextComponent("Mind Deep Relax",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left),
                    Flexible(
                        child: TextComponent(
                      "Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.",
                      textAlign: TextAlign.left,
                      fontSize: 17,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ButtonCircularComponent(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/play.png'),
                    const SizedBox(
                      width: 15,
                    ),
                    const TextComponent(
                      "Play Next Session",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                backgroundColor: const Color(0xFF039EA2),
                height: 45,
                circular: 20,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    DetailedCardComponent(
                      "Sweet Memories",
                      "December 29 Pre-Launch",
                      color: Color(0xFF2F80ED),
                    ),
                    Divider(color: Colors.grey),
                    DetailedCardComponent(
                      "A Day Dream",
                      "December 29 Pre-Launch",
                      color: Color(0xFF039EA2),
                    ),
                    Divider(color: Colors.grey),
                    DetailedCardComponent(
                      "Mind Explore",
                      "December 29 Pre-Launch",
                      color: Color(0xFFF09235),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
