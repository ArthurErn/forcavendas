import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:google_fonts/google_fonts.dart';
import 'financial_list.dart';

class FinancialPage extends StatefulWidget {
  const FinancialPage({Key? key}) : super(key: key);

  @override
  _FinancialPageState createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> {
  var financialList = [];
  var financialListDisplay = [];
  bool loading = true;
  bool search = false;
  ScrollController listController = ScrollController();

  @override
  void initState() {
    loadingItems();

    GeneralQuery().query('clientes_financeiro', 'id', 'id order by id desc').then((value) {
      setState(() {
        financialList = value;
        financialListDisplay = financialList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_downward_rounded),
        onPressed: () {
          setState(() {
            listController.jumpTo(listController.position.maxScrollExtent);
          });
        },
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  search = !search;
                  if (search == false) {
                    setState(() {
                      financialListDisplay = financialList;
                    });
                  }
                });
              },
              child: Icon(search == true ? Icons.close : Icons.search,
                  color: const Color(0xff01497c))),
          const SizedBox(width: 12)
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Text('FINANCEIRO',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
      backgroundColor: const Color(0xffe0f5f9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              search == true ? searchBar() : const Center(),
              Center(
                child: Container(
                  height: search == true
                      ? MediaQuery.of(context).size.height - 144
                      : MediaQuery.of(context).size.height - 89,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12)),
                  child: financialListDisplay.isNotEmpty
                      ? ListView.builder(
                          controller: listController,
                          reverse: false,
                          physics: const BouncingScrollPhysics(),
                          itemCount: financialListDisplay.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FinancialList(
                              financialList: financialListDisplay,
                              index: index,
                            );
                          })
                      : loading == false
                          ? Center(
                              child: Text(
                                'Não foi possível encontrar nenhum produto',
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: const Color(0xff01497c)),
                              ),
                            )
                          : const Center(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  color: Color(0xff01497c),
                                ),
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loadingItems() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        onChanged: (texto) {
          texto = texto.toUpperCase();
          setState(() {
            financialListDisplay = financialList.where((produto) {
              var financialID = produto['id'].toString();
              var financialIDCostumer = produto['id_cliente'].toString();
              var financialIDSale = produto['id_venda'].toString();
              return financialID.contains(texto) ||
                  financialIDCostumer.contains(texto) ||
                  financialIDSale.contains(texto);
            }).toList();
          });
        },
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: "Pesquisar",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
