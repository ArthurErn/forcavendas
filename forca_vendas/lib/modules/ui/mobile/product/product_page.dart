import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/ui/mobile/product/product_list_item.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  final int id;
  const ProductPage({Key? key, required this.id}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var productList = [];
  var productListDisplay = [];
  bool loading = true;
  bool search = false;
  @override
  void initState() {
    loadingItems();
    GeneralQuery().query('produto', 'id_produto', 'id_produto').then((value) {
      setState(() {
        productList = value;
        productListDisplay = productList;
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
                        productListDisplay = productList;
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
        title: Text('PRODUTOS',
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
              child: productListDisplay.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: productListDisplay.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductListItem(
                            items: productListDisplay,
                            index: index,
                            id: widget.id);
                      })
                  : loading == false
                      ? Center(
                          child: Text(
                            'Não foi possível encontrar nenhum produto',
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
            ),
          ],
        ),
      ),
    );
  }

  loadingItems() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
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
            productListDisplay = productList.where((produto) {
              var produtoDescricao = produto['produto_descricao'];
              var produtoID = produto['id_produto'].toString();
              return produtoDescricao.contains(texto) ||
                  produtoID.contains(texto);
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
