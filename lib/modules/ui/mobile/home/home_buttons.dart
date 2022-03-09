import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeButtons extends StatefulWidget {
  final String text;
  const HomeButtons({Key? key, required this.text}) : super(key: key);

  @override
  _HomeButtonsState createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff01497c),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 2)
            ]),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.43,
        child: Center(
          child: Text(
            widget.text,
            style: GoogleFonts.quicksand(
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
