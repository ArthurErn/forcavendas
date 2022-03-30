import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/payment_list.dart';
import 'package:google_fonts/google_fonts.dart';

int? fPagto;

class PaymentMethod extends StatefulWidget {
  final int idCliente;
  final int idTabPreco;
  final List products;
  final List quantity;
  final dynamic totalPreco;
  final dynamic totalDesconto;
  final dynamic valorDesconto;
  final dynamic percentualDesconto;
  final List complemento;
  final String nomeCliente;
  const PaymentMethod(
      {Key? key,
      required this.products,
      required this.quantity,
      required this.complemento,
      required this.idCliente,
      required this.idTabPreco,
      required this.totalPreco,
      required this.totalDesconto,
      required this.valorDesconto,
      required this.percentualDesconto,
      required this.nomeCliente})
      : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  var paymentList = [];

  @override
  void initState() {
    GeneralQuery().query('formas_pagtos', 'id', 'id').then((value) {
      setState(() {
        paymentList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0f5f9),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('COMPRA',
                style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .2,
                    color: const Color(0xff01497c))),
            Text(' --> PAGAMENTO',
                style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .2,
                    color: Colors.grey[600])),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.payment, color: Color(0xff01497c)),
                      const SizedBox(width: 5),
                      Text('ESCOLHA O MÉTODO DE PAGAMENTO',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff01497c),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * .745,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Scrollbar(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: paymentList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PaymentList(
                            paymentList: paymentList,
                            index: index,
                            products: widget.products,
                            idCliente: widget.idCliente,
                            fPagto: fPagto,
                            totalPreco: widget.totalPreco,
                            quantity: widget.quantity,
                            idTabPreco: widget.idTabPreco,
                            totalDesconto: widget.totalDesconto,
                            valorDesconto: widget.valorDesconto,
                            percentualDesconto: widget.percentualDesconto,
                            complemento: widget.complemento,
                            nomeCliente: widget.nomeCliente);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
