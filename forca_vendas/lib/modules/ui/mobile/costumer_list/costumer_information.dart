import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostumerInformation extends StatefulWidget {
  final String id;
  final String tipoPessoa;
  final String apelidoFantasia;
  final String rgInsc;
  final String inscMunicipal;
  final String enderecoNumero;
  final String nomeRazao;
  final String endereco;
  final String cep;
  final String bairro;
  final String fone;
  final String fone2;
  final String fone3;
  final String cpfCnpj;
  final String complemento;
  final String status;
  final String email;
  final int idMunicipio;
  final int idStatus;
  final int idTipoUsuario;
  final int idTabelaPreco;
  const CostumerInformation(
      {Key? key,
      required this.nomeRazao,
      required this.endereco,
      required this.cep,
      required this.bairro,
      required this.fone,
      required this.cpfCnpj,
      required this.complemento,
      required this.id,
      required this.status,
      required this.tipoPessoa,
      required this.apelidoFantasia,
      required this.rgInsc,
      required this.inscMunicipal,
      required this.enderecoNumero,
      required this.email,
      required this.fone2,
      required this.fone3,
      required this.idMunicipio,
      required this.idStatus,
      required this.idTipoUsuario,
      required this.idTabelaPreco})
      : super(key: key);

  @override
  _CostumerInformationState createState() => _CostumerInformationState();
}

class _CostumerInformationState extends State<CostumerInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   GestureDetector(
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //       builder: (context) => CostumerEdit(
        //         //             idMunicipio: widget.idMunicipio,
        //         //             idStatus: widget.idStatus,
        //         //             idTipoUsuario: widget.idTipoUsuario,
        //         //             inscMunicipal: widget.inscMunicipal,
        //         //             email: widget.email,
        //         //             enderecoNumero: widget.enderecoNumero,
        //         //             rgInsc: widget.rgInsc,
        //         //             fantasia: widget.apelidoFantasia,
        //         //             nomeRazao: widget.nomeRazao,
        //         //             bairro: widget.bairro,
        //         //             fone1: widget.fone,
        //         //             fone2: widget.fone2,
        //         //             fone3: widget.fone3,
        //         //             cpfCnpj: widget.cpfCnpj,
        //         //             id: widget.id,
        //         //             status: widget.status,
        //         //             complemento: widget.complemento,
        //         //             cep: widget.cep,
        //         //             endereco: widget.endereco,
        //         //             idTabelaPreco: widget.idTabelaPreco,
        //         //           )),
        //         // );
        //       },
        //       child: const Icon(Icons.edit, color: Color(0xff01497c))),
        //   const SizedBox(
        //     width: 14,
        //   )
        // ],
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Color(0xff01497c))),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Text('CLIENTE',
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
              padding: const EdgeInsets.all(6),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.nomeRazao,
                        style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                    Row(
                      children: [
                        Text(widget.endereco,
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500])),
                        Text(", ",
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500])),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.bairro,
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500])),
                        widget.complemento != ""
                            ? Text(", ",
                                style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500]))
                            : const Text(""),
                        widget.complemento.length > 30
                            ? Text(
                                widget.complemento.toString().substring(0, 29),
                                style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500]))
                            : Text(widget.complemento.toString(),
                                style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500])),
                      ],
                    ),
                    Row(
                      children: [
                        Text("CEP ",
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500])),
                        Text(widget.cep,
                            style: GoogleFonts.quicksand(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 2)
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xff01497c),
                          size: 35,
                        ),
                        const SizedBox(width: 6),
                        Text(widget.id,
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600])),
                        Text(' - ',
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600])),
                        Text(
                            widget.nomeRazao.length > 30
                                ? widget.nomeRazao.substring(0, 29) + "..."
                                : widget.nomeRazao,
                            style: GoogleFonts.quicksand(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]))
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: Color(0xff01497c),
                          size: 33,
                        ),
                        const SizedBox(width: 6),
                        Text(widget.email,
                            style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600])),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.featured_play_list_sharp,
                          color: Color(0xff01497c),
                          size: 33,
                        ),
                        const SizedBox(width: 6),
                        Text(widget.cpfCnpj,
                            style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600])),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.ad_units,
                              color: Color(0xff01497c),
                              size: 35,
                            ),
                            const SizedBox(width: 6),
                            Text(widget.fone,
                                style: GoogleFonts.quicksand(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600])),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            const Icon(
                              Icons.ad_units,
                              color: Color(0xff01497c),
                              size: 35,
                            ),
                            const SizedBox(width: 6),
                            Text(widget.fone2,
                                style: GoogleFonts.quicksand(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600])),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 17,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.status == '4'
                      ? Colors.red[400]
                      : widget.status == '2'
                          ? Colors.red[400]
                          : Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                          color: widget.status == '4'
                              ? Colors.red[900]
                              : widget.status == '2'
                                  ? Colors.red[900]
                                  : Colors.green[900],
                          borderRadius: BorderRadius.circular(9))),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                      widget.status == '4'
                          ? 'INATIVO'
                          : widget.status == '2'
                              ? 'INATIVO'
                              : 'ATIVO',
                      style: GoogleFonts.quicksand(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .51,
              width: MediaQuery.of(context).size.width * .95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 2)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
