import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinancialList extends StatefulWidget {
  final List financialList;
  final int index;
  const FinancialList(
      {Key? key, required this.financialList, required this.index})
      : super(key: key);

  @override
  _FinancialListState createState() => _FinancialListState();
}

class _FinancialListState extends State<FinancialList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.index % 2 == 0 ? Colors.white : Colors.grey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.financialList[widget.index]['id'].toString(),
                  style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Valor: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                  Text(
                      widget.financialList[widget.index]['valor_doc']
                          .toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff01497c))),
                  const Spacer(),
                  Text('N. Parcelas: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                  Text(
                      widget.financialList[widget.index]['parc_num'].toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff01497c))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Data: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                  Text(
                      widget.financialList[widget.index]['data_vecto']
                          .toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff01497c))),
                  const Spacer(),
                  Text('Qtd. Parcelas: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                  Text(
                      widget.financialList[widget.index]['parc_qtd'].toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff01497c))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('ID Venda: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                  Text(
                      widget.financialList[widget.index]['id_venda'].toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff01497c))),
                  const Spacer(),
                  Text('ID Cliente: ',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600])),
                  Text(
                      widget.financialList[widget.index]['id_cliente']
                          .toString(),
                      style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff01497c))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
