import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleList extends StatefulWidget {
  final List items;
  final int index;
  const ScheduleList({Key? key, required this.items, required this.index})
      : super(key: key);

  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              spreadRadius: 2)
        ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, size: 35),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.items[widget.index]['nome_pessoa'].length > 27
                        ? widget.items[widget.index]['nome_pessoa']
                            .toString()
                            .substring(0, 26)
                        : widget.items[widget.index]['nome_pessoa'].toString(),
                    style: GoogleFonts.quicksand(
                        color: const Color(0xff01497c),
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        widget.items[widget.index]['observacao'].length > 26
                            ? widget.items[widget.index]['observacao']
                                .toString()
                                .substring(0, 25)
                            : widget.items[widget.index]['observacao']
                                .toString(),
                        style: GoogleFonts.quicksand(
                            color: Colors.black, fontSize: 17)),
                    const SizedBox(width: 5),
                    Text(widget.items[widget.index]['data'].toString(),
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff01497c),
                            fontSize: 17,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
