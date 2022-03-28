import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/ui/mobile/sale_list_page/components/sale_list_app_bar.dart';
import 'package:forca_vendas/modules/ui/mobile/sale_list_page/components/sale_list_body.dart';

class SaleListPage extends StatefulWidget {
  const SaleListPage({Key? key}) : super(key: key);

  @override
  State<SaleListPage> createState() => _SaleListPageState();
}

class _SaleListPageState extends State<SaleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SaleListAppBar(),
      ),
      body: SaleListBody(),
    );
  }
}
