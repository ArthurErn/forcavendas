import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/ui/mobile/product/product_information.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProductListItem extends StatefulWidget {
  final List items;
  final int index;
  final int id;
  const ProductListItem(
      {Key? key, required this.items, required this.index, required this.id})
      : super(key: key);

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final formatoValores = NumberFormat.currency(locale: "pt_BR", symbol: "");
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductInformation(
                              idProduto: widget.items[widget.index]['id_produto'] == ""
                                  ? "NÃO INFORMADO"
                                  : widget.items[widget.index]['id_produto'] ??
                                      "NÃO INFORMADO",
                              grade: widget.items[widget.index]['grade'] == ""
                                  ? "NÃO INFORMADO"
                                  : widget.items[widget.index]['grade'] ??
                                      "NÃO INFORMADO",
                              saldoGeral: widget.items[widget.index]['saldo_geral'] == ""
                                  ? "NÃO INFORMADO"
                                  : widget.items[widget.index]['saldo_geral'] ??
                                      "NÃO INFORMADO",
                              pVendaTabela: widget.items[widget.index]['pvenda_tabela'] == ""
                                  ? "NÃO INFORMADO"
                                  : widget.items[widget.index]['pvenda_tabela'] ??
                                      "NÃO INFORMADO",
                              produtoDescricao: widget.items[widget.index]['produto_descricao'] == ""
                                  ? "NÃO INFORMADO"
                                  : widget.items[widget.index]['produto_descricao'] ?? "NÃO INFORMADO",
                              fabricanteNome: widget.items[widget.index]['fabricante_nome'] == "" ? "NÃO INFORMADO" : widget.items[widget.index]['fabricante_nome'] ?? "NÃO INFORMADO",
                              gtin: widget.items[widget.index]['gtin'] == "" ? "NÃO INFORMADO" : widget.items[widget.index]['gtin'] ?? "NÃO INFORMADO",
                              ncm: widget.items[widget.index]['ncm'] == "" ? "NÃO INFORMADO" : widget.items[widget.index]['ncm'] ?? "NÃO INFORMADO",
                              refFabricante: widget.items[widget.index]['ref_fabricante'] == "" ? "NÃO INFORMADO" : widget.items[widget.index]['ref_fabricante'] ?? "NÃO INFORMADO")));
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 75,
                width: MediaQuery.of(context).size.width * .9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.items[widget.index]['produto_descricao'].length >
                                37
                            ? widget.items[widget.index]['produto_descricao']
                                    .toString()
                                    .substring(0, 36) +
                                "..."
                            : widget.items[widget.index]['produto_descricao']
                                .toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: const Color(0xff01497c),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          Text(
                            'Fabricante: ',
                            style: GoogleFonts.quicksand(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                          widget.items[widget.index]['fabricante_nome']
                                  .toString()
                                  .isNotEmpty
                              ? Text(
                                  widget.items[widget.index]
                                              ['fabricante_nome'] ==
                                          null
                                      ? "NÃO INFORMADO"
                                      : widget
                                                  .items[widget.index]
                                                      ['fabricante_nome']
                                                  .length >
                                              30
                                          ? widget.items[widget.index]
                                                  ['fabricante_nome']
                                              .toString()
                                              .substring(0, 29)
                                          : widget.items[widget.index]
                                                  ['fabricante_nome']
                                              .toString(),
                                  style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.start,
                                )
                              : Text(
                                  "NÃO INFORMADO",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400),
                                ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Row(
                          children: [
                            Text(
                              "Saldo: ",
                              style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              widget.items[widget.index]['saldo_geral']
                                  .toString(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            const Spacer(),
                            Text(
                              formatoValores
                                  .format(widget.items[widget.index]
                                      ['pvenda_tabela'])
                                  .toString(),
                              style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  color: const Color(0xff01497c),
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
