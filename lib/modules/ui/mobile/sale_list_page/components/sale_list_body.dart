import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/extensions/string_extension.dart';
import 'package:google_fonts/google_fonts.dart';
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

    // var res =
    //     await db.rawQuery('''SELECT * FROM vendas WHERE data_venda = '';''');
    // var res2 = await db
    //     .rawQuery('''SELECT * FROM clientes_visitas WHERE data = '';''');
  }

  List<dynamic> salesList = [];
  List<dynamic> customerList = [];
  List<dynamic> salesListDisplay = [];

  getQuery() async {
    await GeneralQuery().queryAll('vendas_lista').then((value) {
      setState(() {
        salesList = value;
        salesListDisplay = salesList;
      });
    });

    await GeneralQuery().queryAll('clientes').then((value) {
      setState(() {
        customerList = value;
      });
    });
  }

  printTables() async {
    Database _db = await DatabaseConnection().get();

    var tableNames = (await _db
            .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
        .map((row) => row['name'] as String)
        .toList(growable: false);
    print(tableNames);
    // (await _db.query('sqlite_master', columns: ['type', 'name']))
    //     .forEach((row) {
    //   print(row.values);
    // });
  }

  @override
  void initState() {
    printTables();
    //Add uma nova query para testar
    // GeneralQuery().queryAll('vendas_lista').then((value) {
    //   setState(() {
    //     salesList = value;
    //     salesListDisplay = salesList;
    //   });
    // });
    getQuery();
    print('============================');
    print("${salesList.length}$salesList");
    print("${salesListDisplay.length}$salesListDisplay");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //container do fundo
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(255, 2, 38, 73),
      child: ListView.builder(
        itemCount: salesListDisplay.length,
        itemBuilder: (BuildContext context, index) {
          //Testar outras opçoes no
          return GestureDetector(
            onTap: () {
              print(salesListDisplay.length);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 70, 115, 160),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 80,
              width: 40,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: Center(
                      child: Text(index.toString(),
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            //fontStyle: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${salesListDisplay[index]["nome_cliente"]}",
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              //fontStyle: TextStyle(color: Colors.white),
                            )),
                        Text("${salesListDisplay[index]["nome_fpagto"]}",
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              //fontStyle: TextStyle(color: Colors.white),
                            )),
                        Text("${salesListDisplay[index]["data_venda"]}",
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              //fontStyle: TextStyle(color: Colors.white),
                            )),
                        Text("${salesListDisplay[index]["hora_venda"]}",
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              //fontStyle: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: 85,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${salesListDisplay[index]["tot_desc_prc"]}%",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                //fontStyle: TextStyle(color: Colors.white),
                              )),
                          AutoSizeText(
                              salesListDisplay[index]["tot_bruto"]
                                  .toString()
                                  .toCurrency(),
                              maxLines: 1,
                              style: GoogleFonts.quicksand(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                //fontStyle: TextStyle(color: Colors.white),
                              )),
                          AutoSizeText(
                              salesListDisplay[index]["tot_liquido"]
                                  .toString()
                                  .toCurrency(),
                              maxLines: 1,
                              minFontSize: 8,
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                //fontStyle: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
