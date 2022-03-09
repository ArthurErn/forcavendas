import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductInformation extends StatefulWidget {
  final int idProduto;
  final String produtoDescricao;
  final String fabricanteNome;
  final String gtin;
  final String ncm;
  final String refFabricante;
  final dynamic pVendaTabela;
  final dynamic saldoGeral;
  final String grade;
  const ProductInformation(
      {Key? key,
      required this.idProduto,
      required this.produtoDescricao,
      required this.fabricanteNome,
      required this.gtin,
      required this.ncm,
      required this.refFabricante,
      required this.pVendaTabela,
      required this.saldoGeral,
      required this.grade})
      : super(key: key);

  @override
  _ProductInformationState createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  var idProduto = NumberFormat("000000", "en-US");
  var checkInternet = false;
  final formatoValores = NumberFormat.currency(locale: "pt_BR", symbol: "");
  var basicAuth = 'Basic ' + base64Encode(utf8.encode('admin:admin'));

  @override
  void initState() {
    checarInternet();
    super.initState();
  }

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
        title: Text('INFORMAÇÕES',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
      backgroundColor: const Color(0xffe0f5f9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Produto',
                            style: GoogleFonts.quicksand(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        Text(
                          widget.produtoDescricao,
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        // checkInternet == true
                        //     ? Container(
                        //         decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             border: Border.all(),
                        //             borderRadius: BorderRadius.circular(16)),
                        //         child: Image.network(
                        //           'http://${ipController.text}/lotuserp/findimagem?tipo=1&escala=300&img=PRO_${idProduto.format(widget.idProduto)}_001.PNG',
                        //           headers: <String, String>{
                        //             'authorization': basicAuth
                        //           },
                        //         ),
                        //       )
                        //     : const Center()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Informações de Fabrica',
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff01497c))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text('Fabricante: '),
                        Text(
                          widget.fabricanteNome,
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('NCM: '),
                        Text(
                          widget.ncm,
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('Referência Fabricante: '),
                        Text(
                          widget.refFabricante,
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('GTIN: '),
                        Text(
                          widget.gtin,
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Informações do Produto',
                                style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff01497c))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text('ID do Produto: '),
                        Text(
                          widget.idProduto.toString(),
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('Preço de Venda: '),
                        Text(
                          formatoValores.format(widget.pVendaTabela).toString(),
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('Saldo Geral: '),
                        Text(
                          widget.saldoGeral.toString(),
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('Referência Fabricante: '),
                        Text(
                          widget.refFabricante,
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 15),
                        const Text('Grade: '),
                        Text(
                          widget.grade,
                          style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff014f86)),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checarInternet() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setState(() {
        checkInternet = true;
      });
    }
  }
}
