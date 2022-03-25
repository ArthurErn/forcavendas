import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class SaleListBody extends StatefulWidget {
  const SaleListBody({ Key? key }) : super(key: key);

  @override
  State<SaleListBody> createState() => _SaleListBodyState();
}

class _SaleListBodyState extends State<SaleListBody> {

  getSales() async {
    Database db = await DatabaseConnection().get();

    var res = await db
        .rawQuery('''SELECT * FROM vendas WHERE data_venda = '';''');
    var res2 = await db
        .rawQuery('''SELECT * FROM clientes_visitas WHERE data = '';''');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      

      
    );
  }
}