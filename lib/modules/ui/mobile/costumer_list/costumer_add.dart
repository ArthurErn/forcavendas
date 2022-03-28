// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/get_customer_type_id.dart';
import 'package:forca_vendas/modules/domain/usecases/get_id_status.dart';
import 'package:forca_vendas/modules/domain/usecases/get_municipality_id.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/post_costumer_db.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';

class CostumerAdd extends StatefulWidget {
  final List<dynamic> customerList;
  const CostumerAdd({Key? key, required this.customerList}) : super(key: key);

  @override
  _CostumerAddState createState() => _CostumerAddState();
}

class _CostumerAddState extends State<CostumerAdd> {
  //* dados pessoais
  final nomeRazaoRController = TextEditingController();
  final apelidoFantasiaRController = TextEditingController();
  final cpfCnpjRController = TextEditingController();
  final rgInscRController = TextEditingController();

  //* endereçamento
  final enderecoRController = TextEditingController();
  final bairroRController = TextEditingController();
  final complementoRController = TextEditingController();
  final enderecoNumeroRController = TextEditingController();
  final cepRController = TextEditingController();

  //* contato
  final emailRController = TextEditingController();
  final foneRController = TextEditingController();
  final fone2RController = TextEditingController();
  final fone3RController = TextEditingController();

  List<String> statusDropdown = [];
  List<String> costumerTypeDropdown = [];
  List<String> municipalityDropdown = [];

  var statusSelected;
  var idStatusSelected;
  var costumerTypeSelected;
  var idCostumerType;
  var municipalitySelected;
  var idMunicipality;

  @override
  void initState() {
    setState(() {
      listItemsDropdown();
    });
    super.initState();
  }

  postCostumer() async {
    var cnpjAlreadyExists = false;
    for (int i = 0; i < widget.customerList.length; i++) {
      if (widget.customerList[i]['cpf_cnpj'] == cpfCnpjRController.text) {
        cnpjAlreadyExists = true;
      }
    }
    if (cnpjAlreadyExists == false) {
      if (nomeRazaoRController.text != "" &&
          nomeRazaoRController.text.isNotEmpty &&
          apelidoFantasiaRController.text != "" &&
          apelidoFantasiaRController.text.isNotEmpty &&
          cpfCnpjRController.text != "" &&
          cpfCnpjRController.text.isNotEmpty &&
          rgInscRController.text != "" &&
          rgInscRController.text.isNotEmpty &&
          idStatusSelected != null &&
          idStatusSelected != '' &&
          idCostumerType != null &&
          idCostumerType != '' &&
          idMunicipality != null &&
          idMunicipality != '') {
        await PostCostumer().post(
            cpfCnpjRController.text,
            nomeRazaoRController.text,
            apelidoFantasiaRController.text,
            rgInscRController.text,
            foneRController.text,
            fone2RController.text,
            fone3RController.text,
            cepRController.text,
            enderecoRController.text,
            enderecoNumeroRController.text,
            complementoRController.text,
            bairroRController.text,
            idStatusSelected,
            idCostumerType,
            idMunicipality,
            emailRController.text,
            context);
      } else {
        Notify().pop(context, "Estão faltando informações.", Icons.error,
            Colors.red, "Erro");
      }
    } else {
      Notify().pop(
          context, "CPF/CNPJ já existem.", Icons.error, Colors.red, "Erro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0f5f9),
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                postCostumer();
              },
              child: const Icon(Icons.check, color: Color(0xff01497c))),
          const SizedBox(
            width: 16,
          )
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Text('ADICIONAR CLIENTE',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                height: 215,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DADOS PESSOAIS',
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: Colors.grey[700])),
                      TextField(
                        controller: nomeRazaoRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Nome Razão *',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        controller: apelidoFantasiaRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Apelido Fantasia *',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: TextField(
                              controller: cpfCnpjRController,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c), width: .6)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c),
                                          width: 1.2,
                                          style: BorderStyle.solid)),
                                  labelText: 'CPF/CNPJ *',
                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff01497c))),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: TextField(
                              controller: rgInscRController,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c), width: .6)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c),
                                          width: 1.2,
                                          style: BorderStyle.solid)),
                                  labelText: 'RG Insc *',
                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff01497c))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 324,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ENDEREÇAMENTO',
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: Colors.grey[700])),
                      TextField(
                        controller: enderecoRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Endereço',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        controller: bairroRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Bairro',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        controller: cepRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'CEP',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: TextField(
                              controller: complementoRController,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c), width: .6)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c),
                                          width: 1.2,
                                          style: BorderStyle.solid)),
                                  labelText: 'Complemento',
                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff01497c))),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: TextField(
                              controller: enderecoNumeroRController,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c), width: .6)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c),
                                          width: 1.2,
                                          style: BorderStyle.solid)),
                                  labelText: 'Número',
                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff01497c))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'SELECIONAR MUNICIPIO *',
                          style:
                              TextStyle(color: Color(0xff01497c), fontSize: 15),
                        ),
                        value: municipalitySelected,
                        items: municipalityDropdown.map((selecionado) {
                          return DropdownMenuItem(
                            value: selecionado,
                            child: Text(
                              selecionado,
                              style: const TextStyle(color: Color(0xff01497c)),
                            ),
                          );
                        }).toList(),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 500))
                              .then((value) {});
                        },
                        onChanged: (valorNovo) {
                          setState(() {
                            municipalitySelected = valorNovo;
                            _getIDMunicipality();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CONTATO',
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: Colors.grey[700])),
                      TextField(
                        controller: foneRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Telefone',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        controller: fone2RController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Telefone 2',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        controller: fone3RController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Telefone 3',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        controller: emailRController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STATUS',
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .4,
                              color: Colors.grey[700])),
                      DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'STATUS DO CLIENTE *',
                          style:
                              TextStyle(color: Color(0xff01497c), fontSize: 15),
                        ),
                        value: statusSelected,
                        items: statusDropdown.map((selecionado) {
                          return DropdownMenuItem(
                            value: selecionado,
                            child: Text(
                              selecionado,
                              style: const TextStyle(color: Color(0xff01497c)),
                            ),
                          );
                        }).toList(),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 500))
                              .then((value) {});
                        },
                        onChanged: (valorNovo) {
                          setState(() {
                            statusSelected = valorNovo;
                            _getIDStatus();
                          });
                        },
                      ),
                      DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'TIPO DE CLIENTE *',
                          style:
                              TextStyle(color: Color(0xff01497c), fontSize: 15),
                        ),
                        value: costumerTypeSelected,
                        items: costumerTypeDropdown.map((selecionado) {
                          return DropdownMenuItem(
                            value: selecionado,
                            child: Text(
                              selecionado,
                              style: const TextStyle(color: Color(0xff01497c)),
                            ),
                          );
                        }).toList(),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 500))
                              .then((value) {});
                        },
                        onChanged: (valorNovo) {
                          setState(() {
                            costumerTypeSelected = valorNovo;
                            _getIDCostumerType();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getIDStatus() async {
    idStatusSelected = await GetIDStatus().get(statusSelected);
    idStatusSelected = idStatusSelected[0]['id'];
    return idStatusSelected;
  }

  _getIDCostumerType() async {
    idCostumerType = await GetCustomerTypeID().get(costumerTypeSelected);
    idCostumerType = idCostumerType[0]['id'];
    return idCostumerType;
  }

  _getIDMunicipality() async {
    idMunicipality = await GetMunicipalityID().get(municipalitySelected);
    idMunicipality = idMunicipality[0]['id_municipio'];
    return idMunicipality;
  }

  Future listItemsDropdown() async {
    Database _db = await DatabaseConnection().get();
    var data =
        await _db.rawQuery('''SELECT * FROM clientes_status WHERE id = id;''');
    setState(() {
      statusDropdown = data
          .map((Map<String, dynamic> row) => row['descricao'] as String)
          .toList();
    });
    data =
        await _db.rawQuery('''SELECT * FROM clientes_tipos WHERE id = id;''');
    setState(() {
      costumerTypeDropdown = data
          .map((Map<String, dynamic> row) => row['descricao'] as String)
          .toList();
    });
    data = await _db.rawQuery(
        '''SELECT * FROM municipio WHERE id_municipio = id_municipio;''');
    setState(() {
      municipalityDropdown = data
          .map((Map<String, dynamic> row) => row['municipio_nome'] as String)
          .toList();
    });
  }
}
