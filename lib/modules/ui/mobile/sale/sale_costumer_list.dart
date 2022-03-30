import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/get_table_price_id.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/sale_cart.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/sale_products.dart';
import 'package:google_fonts/google_fonts.dart';

String? costumer;
int? tabPrecosId;

class SaleCostumerList extends StatefulWidget {
  final List items;
  final int index;
  const SaleCostumerList({Key? key, required this.items, required this.index})
      : super(key: key);

  @override
  _SaleCostumerListState createState() => _SaleCostumerListState();
}

class _SaleCostumerListState extends State<SaleCostumerList> {
  @override
  void initState() {
    _getTablePrice();
    super.initState();
  }

  var _tablePriceID = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          produto.clear();
          quantidadeList.clear();
          complementoList.clear();
          costumer = widget.items[widget.index]['nome_razao'];
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SaleCart(
                        id: widget.items[widget.index]['id_tabela_preco'],
                        idCliente: widget.items[widget.index]['id'],
                        nomeCliente: widget.items[widget.index]['nome_razao'],
                      )));
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.items[widget.index]['id'].toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                    Text(' - ',
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                    Text(
                        widget.items[widget.index]['nome_razao'].length > 30
                            ? widget.items[widget.index]['nome_razao']
                                .toString()
                                .substring(0, 29)
                            : widget.items[widget.index]['nome_razao']
                                .toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                        widget.items[widget.index]['nome_razao'].length > 30
                            ? widget.items[widget.index]['nome_razao']
                                .toString()
                                .substring(0, 29)
                            : widget.items[widget.index]['nome_razao']
                                .toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600])),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey[600])
                  ],
                ),
                Row(
                  children: [
                    Text(
                        widget.items[widget.index]['cpf_cnpj'].length > 37
                            ? widget.items[widget.index]['cpf_cnpj']
                                .toString()
                                .substring(0, 36)
                            : widget.items[widget.index]['cpf_cnpj'].toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500])),
                    Text('   ',
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500])),
                    Container(
                      height: 17,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.items[widget.index]['id_status'] == 2
                              ? Colors.red[400]
                              : widget.items[widget.index]['id_status'] == 4
                                  ? Colors.red[400]
                                  : Colors.green),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                  color: widget.items[widget.index]
                                              ['id_status'] ==
                                          2
                                      ? Colors.red[900]
                                      : widget.items[widget.index]
                                                  ['id_status'] ==
                                              4
                                          ? Colors.red[900]
                                          : Colors.green[700],
                                  borderRadius: BorderRadius.circular(9))),
                          const SizedBox(width: 6),
                          Text(
                              widget.items[widget.index]['id_status'] == 2
                                  ? 'INATIVO'
                                  : widget.items[widget.index]['id_status'] == 4
                                      ? 'INATIVO'
                                      : 'ATIVO',
                              style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getTablePrice() async {
    var data = await GetTablePriceID().get();
    _tablePriceID = data[0]['id'];
    return _tablePriceID;
  }
}
