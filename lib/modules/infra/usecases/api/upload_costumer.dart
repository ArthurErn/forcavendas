import 'dart:convert';

import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/external/http_post.dart';
import 'package:forca_vendas/modules/ui/mobile/login/register_fields.dart';
import 'package:sqflite/sqflite.dart';

class UploadCostumer {
  Future post(context) async {
    var costumerData = await GeneralQuery().query('clientes', 'enviado', 0);
    Database db = await DatabaseConnection().get();
    for (int i = 0; i < costumerData.length; i++) {
      var jsonData = {
        "tp_pessoa": costumerData[i]['tp_pessoa'] ?? "",
        "cpf_cnpj": costumerData[i]['cpf_cnpj'] ?? "",
        "rg_insc": costumerData[i]['rg_insc'] ?? "",
        "nome_razao": costumerData[i]['nome_razao'] ?? "",
        "apelido_fantasia": costumerData[i]['apelido_fantasia'] ?? "",
        "insc_municipal": costumerData[i]['insc_municipal'] ?? "",
        "fone1": costumerData[i]['fone1'] ?? "",
        "fone2": costumerData[i]['fone2'] ?? "",
        "fone3": costumerData[i]['fone3'] ?? "",
        "cep": costumerData[i]['cep'] ?? "",
        "endereco": costumerData[i]['endereco'] ?? "",
        "endereco_numero": costumerData[i]['endereco_numero'] ?? "",
        "complemento": costumerData[i]['complemento'] ?? "",
        "bairro": costumerData[i]['bairro'] ?? "",
        "id_municipio": costumerData[i]['id_municipio'] ?? 0,
        "email": costumerData[i]['email'] ?? "",
        "id_status": costumerData[i]['id_status'] ?? 0,
        "obs": costumerData[i]['obs'] ?? "",
        "id_cliente_tipo": costumerData[i]['id_cliente_tipo'] ?? 0,
        "id_vendedor": int.tryParse(costumerData[i]['id_vendedor']) ?? 0,
      };
      var response = await HttpPost().connect(
          'http://${ipController.text}/fvenpost09_clientes', jsonEncode(jsonData), context);
      if (response.toString().isNotEmpty) {
        var res = response
            .toString()
            .replaceAll("{success: true, message: ", "")
            .replaceAll("}", "");
        await db.rawUpdate(
            '''UPDATE clientes SET id = $res, enviado = 1 WHERE id = ${costumerData[i]['id']};''');
      }
    }
  }
}
