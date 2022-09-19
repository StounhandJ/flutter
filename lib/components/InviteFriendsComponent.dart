import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteFriendsComponent extends StatelessWidget {
  const InviteFriendsComponent(
      {super.key, required this.height, required this.width});
// equal to "VoidCallback".

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xFFF8D910),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/smiles.png',
            height: 120,
            width: 120,
          ),
          Center(
            child: DefaultTextStyle(
              style: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
              child: const Text('Invite your\nfriends to join'),
            ),
          ),
          Image.asset('assets/share.png'),
        ],
      ),
    );
  }
}
