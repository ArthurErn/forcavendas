import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/ui/mobile/costumer_list/costumer_list_item.dart';
import 'package:google_fonts/google_fonts.dart';

import 'costumer_add.dart';

class CostumerList extends StatefulWidget {
  const CostumerList({Key? key}) : super(key: key);

  @override
  _CostumerListState createState() => _CostumerListState();
}

class _CostumerListState extends State<CostumerList> {
  bool loading = true;
  bool search = false;
  var costumerList = [];
  var costumerListDisplay = [];
  @override
  void initState() {
    loadingItems();
    GeneralQuery().query('clientes', 'id', 'id').then((value) {
      setState(() {
        costumerList = value;
        costumerListDisplay = costumerList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    search = !search;
                    if (search == false) {
                      setState(() {
                        costumerListDisplay = costumerList;
                      });
                    }
                  });
                },
                child: Icon(search == true ? Icons.close : Icons.search,
                    color: const Color(0xff01497c))),
            const SizedBox(width: 15),
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CostumerAdd()));
                  });
                },
                child: const Icon(Icons.person_add, color: Color(0xff01497c))),
            const SizedBox(width: 16)
          ],
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
          toolbarHeight: 65,
          backgroundColor: Colors.white,
          title: Text('CLIENTES',
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
              search == true ? searchBar() : const Center(),
              Container(
                height: search == true
                    ? MediaQuery.of(context).size.height - 144
                    : MediaQuery.of(context).size.height - 89,
                color: Colors.transparent,
                child: costumerListDisplay.isNotEmpty
                    ? Scrollbar(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: costumerListDisplay.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CostumerListItem(
                                items: costumerListDisplay, index: index);
                          }),
                    )
                    : loading == false
                        ? Center(
                            child: Text(
                                'Não foi possível encontrar nenhum cliente',
                                style: GoogleFonts.quicksand(
                                    fontSize: 15,
                                    color: const Color(0xff01497c))))
                        : const Center(
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(
                                  color: Color(0xff01497c)),
                            ),
                          ),
              ),
            ],
          ),
        ));
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
          loadingItems();
          texto = texto.toUpperCase();
          setState(() {
            costumerListDisplay = costumerList.where((cliente) {
              var costumerName = 
                  cliente['nome_razao'].toString().toUpperCase();
              var costumerFantasy =
                  cliente['apelido_fantasia'].toString().toUpperCase();
              var costumerID = cliente['id'].toString().toUpperCase();
              var customerCpfCnpj = cliente['cpf_cnpj'].toString();
              return costumerName.contains(texto) || costumerID.contains(texto) ||
                  costumerFantasy.contains(texto) || customerCpfCnpj.contains(texto);
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

  loadingItems() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (costumerList.isEmpty) {
        setState(() {
          loading = false;
        });
      }
    });
  }
}
