import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawerItem extends StatefulWidget {
  final String text;
  final IconData icon;
  const HomeDrawerItem({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  _HomeDrawerItemState createState() => _HomeDrawerItemState();
}

class _HomeDrawerItemState extends State<HomeDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        height: 45,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Icon(widget.icon, color: const Color(0xff01497c)),
            const SizedBox(
              width: 10,
            ),
            Text(widget.text,
                style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff01497c))),
          ],
        ),
      ),
    );
  }
}
