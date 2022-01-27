import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/get_table_price_id.dart';
import 'package:forca_vendas/modules/domain/usecases/get_user_location.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/costumer_list/costumer_list_page.dart';
import 'package:forca_vendas/modules/ui/mobile/home/home_buttons.dart';
import 'package:forca_vendas/modules/ui/mobile/home/home_statistics.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_fields.dart';
import 'package:forca_vendas/modules/ui/mobile/sale/sale_page.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? headerTitle;
  String? user;
  final formatoValores = NumberFormat.currency(symbol: "");
  String agendaDia = '0';
  String pedidosDia = '0';
  String totalVendido = '0';
  String? now;
  String? now2;
  var _tablePriceID = 0;
  bool search = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    now2 = DateFormat("yyyy-MM-dd").format(DateTime.now());
    now = DateFormat("yyyy-MM-dd").format(DateTime.now());
    setState(() {
      _getTablePrice();
      getStatistics();
      getDrawerHeader();
      GetUserLocation().getCurrentLat();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(
        headerTitle: headerTitle ?? "",
        user: user ?? "",
        idProduct: _tablePriceID,
      ),
      appBar: AppBar(
        toolbarHeight: 65,
        leading: GestureDetector(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Color(0xff01497c),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('FORÇA DE VENDAS',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
      backgroundColor: const Color(0xffe0f5f9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 2)
                  ]),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeStatistic(
                            text: agendaDia,
                            color: const Color(0xff01497c),
                            fontWeight: FontWeight.w700,
                            fontSize: 27),
                        const HomeStatistic(
                            text: 'Agendamentos do dia',
                            color: Color(0xff01497c),
                            fontWeight: FontWeight.w400,
                            fontSize: 12)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeStatistic(
                            text: pedidosDia,
                            color: const Color(0xff01497c),
                            fontWeight: FontWeight.w700,
                            fontSize: 27),
                        const HomeStatistic(
                            text: 'Pedidos do dia',
                            color: Color(0xff01497c),
                            fontWeight: FontWeight.w400,
                            fontSize: 12)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomeStatistic(
                            text: totalVendido,
                            color: const Color(0xff01497c),
                            fontWeight: FontWeight.w700,
                            fontSize: 27),
                        const HomeStatistic(
                          text: 'Valor vendido do dia',
                          color: Color(0xff01497c),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CostumerList()),
                                );
                              },
                              child: const HomeButtons(text: 'Clientes')),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SchedulePage()),
                                );
                              },
                              child: const HomeButtons(text: 'Agenda')),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SalePage()),
                                );
                              },
                              child: const HomeButtons(text: 'Vendas')),
                        ],
                      ),
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height * .46,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Center(
                child: Text(
                  'Lotus ERP - Força de Vendas \n\nVersão 1.0.0\n\nMódulos: \n\nCadastro e consulta de clientes,\nRegistro de vendas e visitas,\nUpload e sincronização de dados.',
                  style: GoogleFonts.quicksand(fontSize: 15, letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getDrawerHeader() async {
    Database db = await DatabaseConnection().get();

    var res = await db.rawQuery(
        '''SELECT * FROM usuario WHERE login = '${loginController.text.toUpperCase()}';''');
    headerTitle = res[0]['empresa_razao'].toString();
    user = res[0]['login'].toString();
  }

  Future<int> _getTablePrice() async {
    var data = await GetTablePriceID().get();
    _tablePriceID = data[0]['id'];
    return _tablePriceID;
  }

  getStatistics() async {
    Database db = await DatabaseConnection().get();

    var res = await db
        .rawQuery('''SELECT * FROM vendas WHERE data_venda = '$now';''');
    var res2 = await db
        .rawQuery('''SELECT * FROM clientes_visitas WHERE data = '$now2';''');
    dynamic total = 0;
    for (int i = 0; i < res.length; i++) {
      total = total + res[i]['tot_liquido'];
    }
    setState(() {
      totalVendido = formatoValores.format(total).toString();
      agendaDia = res2.length.toString();
      pedidosDia = res.length.toString();
    });
  }
}
