import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStatistic extends StatefulWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final Color backgroundColor;
  const HomeStatistic(
      {Key? key,
      required this.text,
      required this.color,
      required this.fontWeight,
      required this.fontSize,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  _HomeStatisticState createState() => _HomeStatisticState();
}

class _HomeStatisticState extends State<HomeStatistic> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
          fontSize: widget.fontSize,
          color: widget.color,
          fontWeight: widget.fontWeight,
          backgroundColor: widget.backgroundColor,
        ),
      ),
    );
  }
}
