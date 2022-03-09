import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/costumer_list/costumer_list_page.dart';
import 'package:sqflite/sqflite.dart';

class PostCostumer {
  Future post(
      cpfCnpj,
      nomeRazao,
      apelidoFantasia,
      rgInsc,
      fone1,
      fone2,
      fone3,
      cep,
      endereco,
      enderecoNumero,
      complemento,
      bairro,
      idStatus,
      idClienteTipo,
      idMunicipality,
      email,
      context) async {
    var idVendedor = await GetCollaboratorID().get();
    var jsonData = {
      "tp_pessoa": 1,
      "cpf_cnpj": cpfCnpj,
      "nome_razao": nomeRazao,
      "apelido_fantasia": apelidoFantasia,
      "rg_insc": rgInsc,
      "insc_municipal": "",
      "fone1": fone1,
      "fone2": fone2,
      "fone3": fone3,
      "cep": cep,
      "endereco": endereco,
      "endereco_numero": enderecoNumero,
      "complemento": complemento,
      "bairro": bairro,
      "id_municipio": idMunicipality,
      "id_status": idStatus,
      "id_cliente_tipo": idClienteTipo,
      "email": email,
      "id_vendedor": idVendedor,
      "obs": "TESTE OBS",
      "id_tabela_preco": 0,
      "enviado": 0
    };
    Database _db = await DatabaseConnection().get();
    await _db.insert('clientes', jsonData,
        conflictAlgorithm: ConflictAlgorithm.replace);
    Navigator.pop(context);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const CostumerList()));
    Notify().pop(context, 'Cliente criado com sucesso!', Icons.check,
        Colors.green, 'Sucesso');
  }
}
