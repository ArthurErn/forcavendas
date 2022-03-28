import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/post_local_sale_db.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/post_sale_db.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/payment_method.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentList extends StatefulWidget {
  final List paymentList;
  final int index;
  final dynamic products;
  final dynamic quantity;
  final int idCliente;
  final dynamic fPagto;
  final int idTabPreco;
  final dynamic totalPreco;
  final dynamic totalDesconto;
  final dynamic valorDesconto;
  final dynamic percentualDesconto;
  final List complemento;
  const PaymentList(
      {Key? key,
      required this.paymentList,
      required this.index,
      required this.products,
      required this.quantity,
      required this.idCliente,
      required this.fPagto,
      required this.idTabPreco,
      required this.totalPreco,
      required this.totalDesconto,
      required this.valorDesconto,
      required this.percentualDesconto,
      required this.complemento})
      : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            fPagto = widget.paymentList[widget.index]['id'];
            PostLocalSaleDataBase().post(
              context,
              6,
              "12-12-2021",
              "15:20:45",
              "Cliente Teste",
              1051,
              fPagto.toString(),
              widget.totalPreco,
              widget.percentualDesconto,
              widget.totalPreco,
            );

            PostSaleDatabase().post(
                widget.products,
                context,
                widget.quantity,
                widget.idCliente,
                fPagto,
                widget.idTabPreco,
                widget.totalPreco,
                widget.totalDesconto,
                widget.valorDesconto,
                widget.percentualDesconto,
                widget.complemento);
          });
        },
        child: SizedBox(
          child: Column(
            children: [
              Text(widget.paymentList[widget.index]['descricao'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff016093),
                  )),
              const Divider(
                height: 12,
                thickness: .4,
                color: Color(0xff8c9399),
              )
            ],
          ),
        ),
      ),
    );
  }
}
