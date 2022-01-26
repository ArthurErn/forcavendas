import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<bool> selected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          title: Text('VENDAS NO PERÍODO',
              style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .2,
                  color: const Color(0xff01497c))),
        ),
        backgroundColor: const Color(0xffe0f5f9),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * .45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('Minhas vendas',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[500])),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('R\$ 45.000,00',
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff01497c))),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected[0] = true;
                                    selected[1] = false;
                                    selected[2] = false;
                                  });
                                },
                                child: Container(
                                  height: 35,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: selected[0] == true
                                          ? const Color(0xff01497c)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1.75,
                                          color: const Color(0xff01497c))),
                                  child: Center(
                                    child: Text('7 Dias',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: selected[0] == true
                                                ? Colors.white
                                                : Colors.grey[500])),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected[0] = false;
                                    selected[1] = true;
                                    selected[2] = false;
                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: selected[1] == true
                                            ? const Color(0xff01497c)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1.75,
                                            color: const Color(0xff01497c))),
                                    child: Center(
                                      child: Text('15 Dias',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: selected[1] == true
                                                  ? Colors.white
                                                  : Colors.grey[500])),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selected[0] = false;
                                    selected[1] = false;
                                    selected[2] = true;
                                  });
                                },
                                child: Container(
                                    height: 35,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: selected[2] == true
                                            ? const Color(0xff01497c)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            width: 1.75,
                                            color: const Color(0xff01497c))),
                                    child: Center(
                                      child: Text('30 Dias',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: selected[2] == true
                                                  ? Colors.white
                                                  : Colors.grey[500])),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12.5),
              Container(
                height: MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Pedido por status',
                            style: GoogleFonts.quicksand(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[500])),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Últimos 15 dias',
                            style: GoogleFonts.quicksand(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[400])),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
