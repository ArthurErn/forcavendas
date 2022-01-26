import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/payment_method.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/sale_products.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SaleCart extends StatefulWidget {
  final int id;
  final int idCliente;
  const SaleCart({Key? key, required this.id, required this.idCliente})
      : super(key: key);

  @override
  _SaleCartState createState() => _SaleCartState();
}

class _SaleCartState extends State<SaleCart> {
  var percentage = NumberFormat("##.##", "en-US");
  TextEditingController valorDesconto = TextEditingController(text: '0');
  TextEditingController percentualDesconto = TextEditingController(text: '0');
  dynamic percentual = 0;
  dynamic valor = 0;
  dynamic totalDesconto = 0;

  final formatoValores = NumberFormat.currency(symbol: "");
  dynamic _total = 0;
  @override
  void initState() {
    setState(() {
      _total = calcularTotal();
      totalDesconto = _total;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SaleProducts(
                          id: widget.id, idCliente: widget.idCliente)));
            },
            child: Text('+',
                style: GoogleFonts.quicksand(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .2,
                  color: Colors.white,
                ))),
        backgroundColor: const Color(0xffe0f5f9),
        appBar: AppBar(
          actions: [
            produto.isNotEmpty
                      ?GestureDetector(
                onTap: () {
                  if (produto.isNotEmpty) {
                    discountSale();
                  }
                },
                child: const Icon(Icons.sell, color: Color(0xff01497c))):const Center(),
            const SizedBox(width: 15),
            produto.isNotEmpty
                      ?GestureDetector(
                onTap: () {
                  produto.isNotEmpty
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethod(
                                  products: produto,
                                  quantity: quantidadeList,
                                  complemento: complementoList,
                                  idCliente: widget.idCliente,
                                  idTabPreco: widget.id,
                                  totalPreco: _total,
                                  totalDesconto: totalDesconto,
                                  valorDesconto: valor,
                                  percentualDesconto: percentual)),
                        )
                      : null;
                },
                child: const Icon(Icons.check, color: Color(0xff01497c))):const Center(),
            const SizedBox(width: 16),
          ],
          leading: GestureDetector(
              onTap: () {
                produto.isNotEmpty
                    ? backButtonNotify()
                    : Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          title: Text('CARRINHO',
              style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .2,
                  color: const Color(0xff01497c))),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .95,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 12,
                              spreadRadius: 2)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart,
                            color: Color(0xff01497c)),
                        const SizedBox(width: 5),
                        Text('PRODUTOS DO CARRINHO',
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff01497c))),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .65,
                width: MediaQuery.of(context).size.width * .93,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: produto.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produto[index].produtoDescricao.length > 37
                                    ? produto[index]
                                            .produtoDescricao
                                            .substring(0, 36) +
                                        "..."
                                    : produto[index].produtoDescricao,
                                style: GoogleFonts.quicksand(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff2a6f97)),
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        produto[index].fabricanteNome,
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff6c757d)),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                          'Qtde: ' +
                                              quantidadeList[index].toString(),
                                          style: GoogleFonts.quicksand(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff6c757d))),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          produto.removeAt(index);
                                          quantidadeList.removeAt(index);
                                          percentual = 0;
                                          valor = 0;
                                          valorDesconto.text = '0';
                                          percentualDesconto.text = '0';
                                          setState(() {
                                            _total = calcularTotal();
                                            totalDesconto = _total;
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.close))
                                ],
                              ),
                              const Divider(
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * .075,
                width: MediaQuery.of(context).size.width * .94,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text('TOTAL: ',
                            style: GoogleFonts.quicksand(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff01497c))),
                        Text(formatoValores.format(totalDesconto).toString(),
                            style: GoogleFonts.quicksand(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff6c757d))),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  calcularTotal() {
    dynamic total = 0;
    for (int i = 0; i < produto.length; i++) {
      total = total + (produto[i].pvendaTabela * quantidadeList[i]);
    }
    return total;
  }

  backButtonNotify() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Desejar voltar?",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
          content: Text("Você irá perder todos os itens do seu carrinho",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w500)),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff01497c))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Voltar",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  produto.clear();
                  quantidadeList.clear();
                  complementoList.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }

  discountSale() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aplicar Desconto",
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w700)),
          content: SizedBox(
            height: 65,
            width: 250,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value != "") {
                                setState(() {
                                  valor = (_total * double.parse(value) / 100);
                                  totalDesconto = _total - valor;
                                  percentual = value;
                                  valorDesconto.text =
                                      formatoValores.format(valor).toString();
                                });
                              }
                            },
                            controller: percentualDesconto,
                          )),
                      const Spacer(),
                      SizedBox(
                          width: 100,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value != "") {
                                setState(() {
                                  percentual =
                                      (double.parse(value) * 100) / _total;
                                  var aux = _total * percentual / 100;
                                  totalDesconto = _total - aux;
                                  percentualDesconto.text =
                                      percentual.toString();
                                  percentualDesconto.text =
                                      percentage.format(percentual).toString();
                                });
                              }
                            },
                            controller: valorDesconto,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text('%',
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff6c757d)))),
                      const Spacer(),
                      SizedBox(
                          width: 100,
                          child: Text('Valor',
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff6c757d)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK",
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff01497c))),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
