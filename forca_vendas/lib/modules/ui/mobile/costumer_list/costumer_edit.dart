// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/get_customer_type_id.dart';
import 'package:forca_vendas/modules/domain/usecases/get_id_status.dart';
import 'package:forca_vendas/modules/domain/usecases/get_municipality_id.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/domain/usecases/save_costumer_edit.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'costumer_list_page.dart';

class CostumerEdit extends StatefulWidget {
  final String id;
  final String fantasia;
  final String nomeRazao;
  final String endereco;
  final String cep;
  final String bairro;
  final String fone1;
  final String fone2;
  final String fone3;
  final String cpfCnpj;
  final String complemento;
  final String status;
  final String enderecoNumero;
  final String rgInsc;
  final String email;
  final String inscMunicipal;
  final int idMunicipio;
  final int idStatus;
  final int idTipoUsuario;
  final int idTabelaPreco;
  const CostumerEdit(
      {Key? key,
      required this.nomeRazao,
      required this.endereco,
      required this.cep,
      required this.bairro,
      required this.fone1,
      required this.cpfCnpj,
      required this.complemento,
      required this.id,
      required this.status,
      required this.fantasia,
      required this.rgInsc,
      required this.enderecoNumero,
      required this.email,
      required this.inscMunicipal,
      required this.fone2,
      required this.fone3,
      required this.idMunicipio,
      required this.idStatus,
      required this.idTipoUsuario,
      required this.idTabelaPreco})
      : super(key: key);

  @override
  _CostumerEditState createState() => _CostumerEditState();
}

class _CostumerEditState extends State<CostumerEdit> {
  //* dados pessoais
  var nomeRazaoController = TextEditingController();
  var apelidoFantasiaController = TextEditingController();
  var cpfCnpjController = TextEditingController();
  var rgInscController = TextEditingController();

  //* endereçamento
  var enderecoController = TextEditingController();
  var bairroController = TextEditingController();
  var complementoController = TextEditingController();
  var enderecoNumeroController = TextEditingController();
  var cepController = TextEditingController();

  //* contato
  var emailController = TextEditingController();
  var foneController = TextEditingController();
  var fone2Controller = TextEditingController();
  var fone3Controller = TextEditingController();
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
    fillTextFields();
    listItemsDropdown();
    super.initState();
  }

  void fillTextFields() async {
    Database db = await DatabaseConnection().get();
    setState(() {
      idMunicipality = widget.idMunicipio;
      idCostumerType = widget.idTipoUsuario;
      idStatusSelected = widget.idStatus;
    });

    var municipio = await db.rawQuery(
        '''SELECT municipio.municipio_nome FROM municipio WHERE id_municipio = ${widget.idMunicipio};''');
    var tipo = await db.rawQuery(
        '''SELECT clientes_tipos.descricao FROM clientes_tipos WHERE id = ${widget.idTipoUsuario};''');
    var status = await db.rawQuery(
        '''SELECT clientes_status.descricao FROM clientes_status WHERE id = ${widget.idStatus};''');

    setState(() {
      //*personal info
      nomeRazaoController.text = widget.nomeRazao;
      apelidoFantasiaController.text = widget.fantasia;
      cpfCnpjController.text = widget.cpfCnpj;
      rgInscController.text = widget.rgInsc;

      //*location
      enderecoController.text = widget.endereco;
      bairroController.text = widget.bairro;
      complementoController.text = widget.complemento;
      enderecoNumeroController.text = widget.enderecoNumero;
      cepController.text = widget.cep;

      //*contact
      emailController.text = widget.email;
      foneController.text = widget.fone1;
      fone2Controller.text = widget.fone2;
      fone3Controller.text = widget.fone3;

      //*dropdowns
      municipalitySelected = municipio[0]['municipio_nome'];
      costumerTypeSelected = tipo[0]['descricao'];
      statusSelected = status[0]['descricao'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  try {
                    setState(() {
                      if (nomeRazaoController.text != "" &&
                          nomeRazaoController.text.isNotEmpty &&
                          apelidoFantasiaController.text != "" &&
                          apelidoFantasiaController.text.isNotEmpty &&
                          cpfCnpjController.text != "" &&
                          cpfCnpjController.text.isNotEmpty &&
                          rgInscController.text != "" &&
                          rgInscController.text.isNotEmpty &&
                          idStatusSelected != null &&
                          idCostumerType != null &&
                          idMunicipality != null) {
                        SaveCostumerEdit().save(
                            widget.id,
                            cpfCnpjController.text,
                            nomeRazaoController.text,
                            apelidoFantasiaController.text,
                            rgInscController.text,
                            widget.inscMunicipal,
                            foneController.text,
                            fone2Controller.text,
                            fone3Controller.text,
                            cepController.text,
                            enderecoController.text,
                            enderecoNumeroController.text,
                            complementoController.text,
                            bairroController.text,
                            emailController.text,
                            idStatusSelected,
                            idCostumerType,
                            idMunicipality);
                      } else {
                        setState(() {
                          Notify().pop(
                              context,
                              "Preencha os campos obrigatórios!",
                              Icons.error,
                              Colors.red,
                              'Erro!');
                        });
                      }
                    });
                  } catch (e) {
                    Notify().pop(context, 'Preencha os campos corretamente!',
                        Icons.close, Colors.red, 'Erro!');
                  } finally {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CostumerList()));
                    Notify().pop(context, 'Cliente editado com sucesso!',
                        Icons.check, Colors.green, 'Sucesso');
                  }
                });
              },
              child: const Icon(Icons.check, color: Color(0xff01497c))),
          const SizedBox(
            width: 14,
          )
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Text('EDITAR CLIENTE',
            style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: .2,
                color: const Color(0xff01497c))),
      ),
      backgroundColor: const Color(0xffe0f5f9),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                height: 277,
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
                        maxLength: 60,
                        controller: nomeRazaoController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Nome Razão',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01497c))),
                      ),
                      TextField(
                        maxLength: 60,
                        controller: apelidoFantasiaController,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c), width: .6)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff01497c),
                                    width: 1.2,
                                    style: BorderStyle.solid)),
                            labelText: 'Apelido Fantasia',
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
                              maxLength: 20,
                              controller: cpfCnpjController,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c), width: .6)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c),
                                          width: 1.2,
                                          style: BorderStyle.solid)),
                                  labelText: 'CPF/CNPJ',
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
                              maxLength: 20,
                              controller: rgInscController,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c), width: .6)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff01497c),
                                          width: 1.2,
                                          style: BorderStyle.solid)),
                                  labelText: 'RG Insc',
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
                height: 405,
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
                        maxLength: 60,
                        controller: enderecoController,
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
                        maxLength: 30,
                        controller: bairroController,
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
                        maxLength: 10,
                        controller: cepController,
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
                              maxLength: 60,
                              controller: complementoController,
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
                              maxLength: 10,
                              controller: enderecoNumeroController,
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
                      DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'SELECIONAR MUNICIPIO',
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
                        maxLength: 25,
                        controller: foneController,
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
                      fone2Controller.text != "NENHUM"
                          ? TextField(
                              maxLength: 25,
                              controller: fone2Controller,
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
                            )
                          : const Center(),
                      fone3Controller.text != "NENHUM"
                          ? TextField(
                              maxLength: 25,
                              controller: fone3Controller,
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
                            )
                          : const Center(),
                      TextField(
                        maxLength: 300,
                        controller: emailController,
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
                          'STATUS DO CLIENTE',
                          style:
                              TextStyle(color: Color(0xff01497c), fontSize: 15),
                        ),
                        value: statusSelected,
                        items: statusDropdown.map((selecionado) {
                          return DropdownMenuItem(
                            value: selecionado,
                            child: Text(
                              selecionado,
                              style: const TextStyle(
                                  color: Color(0xff01497c), fontSize: 15),
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
                          'TIPO DE CLIENTE',
                          style:
                              TextStyle(color: Color(0xff01497c), fontSize: 15),
                        ),
                        value: costumerTypeSelected,
                        items: costumerTypeDropdown.map((selecionado) {
                          return DropdownMenuItem(
                            value: selecionado,
                            child: Text(
                              selecionado,
                              style: const TextStyle(
                                  color: Color(0xff01497c), fontSize: 15),
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
    return idCostumerType;
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
