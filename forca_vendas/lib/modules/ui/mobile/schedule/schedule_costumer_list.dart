import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_costumer.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleCostumerList extends StatefulWidget {
  const ScheduleCostumerList({Key? key}) : super(key: key);

  @override
  _ScheduleCostumerListState createState() => _ScheduleCostumerListState();
}

class _ScheduleCostumerListState extends State<ScheduleCostumerList> {
  bool loading = true;
  bool search = false;
  var costumerList = [];
  var costumerListDisplay = [];

  @override
  void initState() {
    setState(() {
      loadingItems();
    });
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
      backgroundColor: const Color(0xffe0f5f9),
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
          const SizedBox(width: 12)
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Text('ESCOLHA O CLIENTE',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
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
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: costumerListDisplay.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ScheduleCostumer(
                            items: costumerListDisplay, index: index);
                      })
                  : loading == false
                      ? Center(
                          child: Text(
                            'Não foi possível encontrar nenhum cliente',
                            style: GoogleFonts.quicksand(
                                fontSize: 15, color: const Color(0xff01497c)),
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
            )
          ],
        ),
      ),
    );
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
            costumerListDisplay = costumerList.where((produto) {
              var costumerName = produto['nome_razao'].toString().toUpperCase();
              var costumerID = produto['id'].toString().toUpperCase();
              return costumerName.contains(texto) || costumerID.contains(texto);
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
      if (costumerListDisplay.isEmpty) {
        setState(() {
          loading = false;
        });
      }
    });
  }
}
