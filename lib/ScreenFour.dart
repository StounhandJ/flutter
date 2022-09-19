import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 3, 157, 162),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Column(children: [
                DefaultTextStyle(
                  style: GoogleFonts.lato(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  child: const Text('medinow'),
                ),
                DefaultTextStyle(
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  child: const Text('Meditate With Us!'),
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 50)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(25.0)))),
                    onPressed: () {},
                    child: const Text("Sign in with Apple"),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 205, 253, 254)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(25.0)))),
                    onPressed: () {},
                    child: const Text("Continue with Email or Phone"),
                  ),
                  const SizedBox(height: 8),
                  DefaultTextStyle(
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    child: const Text('Continue With Google'),
                  )
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
