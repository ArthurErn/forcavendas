import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'costumer_information.dart';

class CostumerListItem extends StatefulWidget {
  final List items;
  final int index;
  const CostumerListItem({Key? key, required this.items, required this.index})
      : super(key: key);

  @override
  _CostumerListItemState createState() => _CostumerListItemState();
}

class _CostumerListItemState extends State<CostumerListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CostumerInformation(
                      idTabelaPreco: int.parse(widget.items[widget.index]
                                  ['id_tabela_preco']
                              .toString()),
                      idTipoUsuario: int.parse(widget.items[widget.index]
                                  ['id_cliente_tipo']
                              .toString()),
                      idStatus: int.parse(
                          widget.items[widget.index]['id_status'].toString()),
                      idMunicipio: int.parse(widget.items[widget.index]
                              ['id_municipio']
                          .toString()),
                      fone3: widget.items[widget.index]['fone3'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['fone3'] ??
                              "N.I",
                      fone2: widget.items[widget.index]['fone2'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['fone2'] ??
                              "N.I",
                      email: widget.items[widget.index]['email'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['email'] ??
                              "N.I",
                      status:
                          widget.items[widget.index]['id_status'].toString(),
                      id: widget.items[widget.index]['id'].toString(),
                      endereco: widget.items[widget.index]['endereco'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['endereco'] ??
                              "N.I",
                      cep: widget.items[widget.index]['cep'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['cep'] ??
                              "N.I",
                      cpfCnpj: widget.items[widget.index]['cpf_cnpj'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['cpf_cnpj'] ??
                              "N.I",
                      nomeRazao: widget.items[widget.index]['nome_razao'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['nome_razao'] ??
                              "N.I",
                      fone: widget.items[widget.index]['fone1'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['fone1'] ??
                              "N.I",
                      bairro: widget.items[widget.index]['bairro'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['bairro'] ??
                              "N.I",
                      complemento:
                          widget.items[widget.index]['complemento'] == ""
                              ? "N.I"
                              : widget.items[widget.index]['complemento'] ??
                                  "N.I",
                      apelidoFantasia:
                          widget.items[widget.index]['apelid_fantasia'] == ""
                              ? "N.I"
                              : widget.items[widget.index]
                                      ['apelido_fantasia'] ??
                                  "N.I",
                      enderecoNumero:
                          widget.items[widget.index]['endereco_numero'] == ""
                              ? "N.I"
                              : widget.items[widget.index]['endereco_numero'] ??
                                  "N.I",
                      inscMunicipal:
                          widget.items[widget.index]['insc_municipal'] == ""
                              ? "N.I"
                              : widget.items[widget.index]['insc_municipal'] ??
                                  "N.I",
                      rgInsc: widget.items[widget.index]['rg_insc'] == ""
                          ? "N.I"
                          : widget.items[widget.index]['rg_insc'] ??
                              "N.I",
                      tipoPessoa:
                          widget.items[widget.index]['tp_pessoa'].toString(),
                    )),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 75,
          width: MediaQuery.of(context).size.width * .9,
          child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.items[widget.index]['id'].toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                    Text(' - ',
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                    Text(
                        widget.items[widget.index]['nome_razao'].length > 30
                            ? widget.items[widget.index]['nome_razao']
                                .toString()
                                .substring(0, 29)
                            : widget.items[widget.index]['nome_razao']
                                .toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700])),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                        widget.items[widget.index]['nome_razao'].length > 30
                            ? widget.items[widget.index]['nome_razao']
                                .toString()
                                .substring(0, 29)
                            : widget.items[widget.index]['nome_razao']
                                .toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600])),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey[600])
                  ],
                ),
                Row(
                  children: [
                    Text(
                        widget.items[widget.index]['cpf_cnpj'].length > 37
                            ? widget.items[widget.index]['cpf_cnpj']
                                .toString()
                                .substring(0, 36)
                            : widget.items[widget.index]['cpf_cnpj'].toString(),
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500])),
                    Text('   ',
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500])),
                    Container(
                      height: 17,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.items[widget.index]['id_status'] == 2
                              ? Colors.red[400]
                              : widget.items[widget.index]['id_status'] == 4
                                  ? Colors.red[400]
                                  : Colors.green),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                  color: widget.items[widget.index]
                                              ['id_status'] ==
                                          2
                                      ? Colors.red[900]
                                      : widget.items[widget.index]
                                                  ['id_status'] ==
                                              4
                                          ? Colors.red[900]
                                          : Colors.green[700],
                                  borderRadius: BorderRadius.circular(9))),
                          const SizedBox(width: 6),
                          Text(
                              widget.items[widget.index]['id_status'] == 2
                                  ? 'INATIVO'
                                  : widget.items[widget.index]['id_status'] == 4
                                      ? 'INATIVO'
                                      : 'ATIVO',
                              style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
