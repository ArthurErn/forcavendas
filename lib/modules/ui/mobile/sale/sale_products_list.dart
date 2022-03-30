import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/entities/product_entity.dart';
//import 'package:forca_vendas/modules/domain/usecases/get_table_price_id.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/sale_cart.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/sale_products.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SaleProductsList extends StatefulWidget {
  final List items;
  final int index;
  final int id;
  final int idCliente;
  final String nomeCliente;
  const SaleProductsList(
      {Key? key,
      required this.items,
      required this.index,
      required this.id,
      required this.idCliente,
      required this.nomeCliente})
      : super(key: key);

  @override
  _SaleProductsListState createState() => _SaleProductsListState();
}

class _SaleProductsListState extends State<SaleProductsList> {
  TextEditingController quantidade = TextEditingController(text: '1');
  final formatoValores = NumberFormat.currency(locale: "pt_BR", symbol: "");
  String complemento = "";

  @override
  Widget build(BuildContext context) {
    return widget.id == widget.items[widget.index]['tabprecos_id']
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  ProductEntity produtoEntity = ProductEntity(
                      tabprecosId:
                          widget.items[widget.index]['tabprecos_id'] ?? "",
                      idEmpresa: widget.items[widget.index]['id_empresa'] ?? "",
                      idProduto: widget.items[widget.index]['id_produto'] ?? "",
                      produtoDescricao:
                          widget.items[widget.index]['produto_descricao'] ?? "",
                      unidade: widget.items[widget.index]['unidade'] ?? "",
                      refFabrica:
                          widget.items[widget.index]['ref_fabrica'] ?? "",
                      gtin: widget.items[widget.index]['gtin'] ?? "",
                      grade: widget.items[widget.index]['grade'] ?? "",
                      pvendaTabela:
                          widget.items[widget.index]['pvenda_tabela'] ?? "",
                      saldoGeral:
                          widget.items[widget.index]['saldo_geral'] ?? "",
                      idFabricante:
                          widget.items[widget.index]['id_fabricante'] ?? "",
                      fabricanteNome: widget.items[widget.index]
                          ['fabricante_nome'],
                      idGrupo: widget.items[widget.index]['id_grupo'] ?? "",
                      grupoDescricao:
                          widget.items[widget.index]['grupo_descricao'] ?? "",
                      idNcm: widget.items[widget.index]['id_ncm'] ?? "",
                      idFornecedor:
                          widget.items[widget.index]['id_fornecedor'] ?? "",
                      fornecedorNome:
                          widget.items[widget.index]['fornecedor_nome'] ?? "",
                      aplicacao: widget.items[widget.index]['aplicacao'] ?? "",
                      produtoStatus:
                          widget.items[widget.index]['produto_status'] ?? "",
                      tabprecosStatus:
                          widget.items[widget.index]['tabprecos_status'] ?? "");
                  quantity(produtoEntity, widget.idCliente, widget.id,
                      widget.nomeCliente);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 85,
                width: MediaQuery.of(context).size.width * .9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          widget.items[widget.index]['fornecedor_nome']
                                  .toString()
                                  .isNotEmpty
                              ? Text(
                                  widget.items[widget.index]
                                              ['fornecedor_nome'] ==
                                          null
                                      ? "NÃO INFORMADO"
                                      : widget
                                                  .items[widget.index]
                                                      ['fornecedor_nome']
                                                  .length >
                                              30
                                          ? widget.items[widget.index]
                                                  ['fornecedor_nome']
                                              .toString()
                                              .substring(0, 29)
                                          : widget.items[widget.index]
                                                  ['fornecedor_nome']
                                              .toString(),
                                  style: GoogleFonts.quicksand(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.start,
                                )
                              : Text(
                                  "Fabricante: NÃO INFORMADO",
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
          )
        : const Center();
  }

  void quantity(entity, idCliente, tableId, nomeCliente) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  'Escolha a quantidade',
                  style: GoogleFonts.quicksand(
                      fontSize: 18,
                      color: const Color(0xff01497c),
                      fontWeight: FontWeight.w700),
                ),
                content: SizedBox(
                  width: 230,
                  height: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (int.parse(quantidade.text) > 1) {
                                  setState(() {
                                    quantidade.text =
                                        (int.parse(quantidade.text) - 1)
                                            .toString();
                                  });
                                }
                              },
                              child: const Icon(Icons.remove)),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 150,
                            height: 35,
                            child: TextField(
                              readOnly: true,
                              style: GoogleFonts.quicksand(
                                  fontSize: 16,
                                  color: const Color(0xff01497c),
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                              controller: quantidade,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                              onTap: () {
                                if (int.parse(quantidade.text) < 99) {
                                  setState(() {
                                    quantidade.text =
                                        (int.parse(quantidade.text) + 1)
                                            .toString();
                                  });
                                }
                              },
                              child: const Icon(Icons.add)),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 55,
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: .5, color: Color(0xff01497c)),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: .5, color: Color(0xff01497c)),
                                  borderRadius: BorderRadius.circular(12)),
                              labelText: "Complemento",
                              labelStyle: GoogleFonts.quicksand(
                                  fontSize: 14,
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w700)),
                          onChanged: (value) {
                            setState(() {
                              complemento = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          quantidadeList.add(int.parse(quantidade.text));
                          complementoList.add(complemento);
                          produto.add(entity);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SaleCart(
                                      id: tableId,
                                      idCliente: idCliente,
                                      nomeCliente: nomeCliente,
                                    )),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 160,
                          decoration: BoxDecoration(
                              color: const Color(0xff01497c),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 12,
                                    spreadRadius: 2)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              "Adicionar",
                              style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const Center();
        });
  }
}
