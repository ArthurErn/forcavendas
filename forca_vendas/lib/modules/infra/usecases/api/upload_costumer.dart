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
      var jsonData = jsonEncode({
        "id": 0,
        "tp_pessoa": costumerData[i]['tp_pessoa'] ?? "",
        "cpf_cnpj": costumerData[i]['cpf_cnpj'] ?? "",
        "nome_razao": costumerData[i]['nome_razao'] ?? "",
        "apelido_fantasia": costumerData[i]['apelido_fantasia'] ?? "",
        "rg_insc": costumerData[i]['rg_insc'] ?? "",
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
        "id_status": costumerData[i]['id_status'] ?? 0,
        "id_cliente_tipo": costumerData[i]['id_cliente_tipo'] ?? 0,
        "email": costumerData[i]['email'] ?? "",
        "id_vendedor": costumerData[i]['id_vendedor'] ?? 0,
        "obs": costumerData[i]['obs'] ?? ""
      });
      //print(jsonData);
      var response = await HttpPost().connect(
          'http://${ipController.text}/lotuserp/fvenpost09_clientes',
          jsonData,
          context);
      if (response.toString().isNotEmpty) {
        await db.rawUpdate(
            '''UPDATE clientes SET id = $response, enviado = 1 WHERE id = ${costumerData[i]['id']};''');
      }
    }
  }
}
