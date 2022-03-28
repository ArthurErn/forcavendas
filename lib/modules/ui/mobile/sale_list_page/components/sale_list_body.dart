import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/entities/sales_list_entity.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class SaleListBody extends StatefulWidget {
  const SaleListBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SaleListBody> createState() => _SaleListBodyState();
}

class _SaleListBodyState extends State<SaleListBody> {
  getSales() async {
    Database db = await DatabaseConnection().get();

    var res =
        await db.rawQuery('''SELECT * FROM vendas WHERE data_venda = '';''');
    var res2 = await db
        .rawQuery('''SELECT * FROM clientes_visitas WHERE data = '';''');
  }

  List<SalesListEntity> salesList = [];
  List<SalesListEntity> salesListDisplay = [];

  @override
  void initState() {
    GeneralQuery()
        .query('vendas_lista', 'id', 'id order by id desc')
        .then((value) {
      setState(() {
        salesList = value;
        salesListDisplay = salesList;
      });
    });
    print(salesList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: salesListDisplay.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  color: Colors.white,
                  height: 20,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(index.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
