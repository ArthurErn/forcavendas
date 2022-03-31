import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forca_vendas/modules/mobx_controllers/sale_list_controller.dart';

class SaleListAppBar extends StatefulWidget {
  const SaleListAppBar({Key? key}) : super(key: key);

  @override
  State<SaleListAppBar> createState() => _SaleListAppBarState();
}

class _SaleListAppBarState extends State<SaleListAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Novas Vendas'),
      backgroundColor: const Color(0xff01497c),
      actions: [
        GestureDetector(
          onTap: () {
            saleListController.search = !saleListController.search;
          },
          child: Observer(builder: (_) {
            //Observa mudança de estado do widget - Pertence ao MOBX
            return Icon(
              saleListController.search == true ? Icons.close : Icons.search,
              color: Colors.white,
              size: 25,
            );
          }),
        ),
      ],
    );
  }
}
