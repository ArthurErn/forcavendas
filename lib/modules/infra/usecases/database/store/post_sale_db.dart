import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/domain/usecases/get_user_location.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/home/home_page.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class PostSaleDatabase {
  Future post(
      lista,
      context,
      quantity,
      idCliente,
      idFpagto,
      idTabPreco,
      totalPreco,
      totalDesconto,
      valorDesconto,
      percentualDesconto,
      complemento) async {
    var idVendedor = await GetCollaboratorID().get();
    var horaVenda = DateFormat("HH:mm:ss").format(DateTime.now());
    var dataVenda = DateFormat("dd-MM-yyyy").format(DateTime.now());
    var idUsuario =
        await GeneralQuery().query('usuario', 'id_colaborador', idVendedor);
    var lat = await GetUserLocation().getCurrentLat();
    var long = await GetUserLocation().getCurrentLong();
    var idEmpresa = idUsuario[0]['id_empresa'];
    idUsuario = idUsuario[0]['id'];
    var jsonDataHeader = {
      "data_venda": dataVenda,
      "hora_venda": horaVenda,
      "id_empresa": idEmpresa,
      "id_cliente": idCliente,
      "id_vendedor": idVendedor,
      "id_fpagto": idFpagto,
      "id_usuario": idUsuario,
      "id_tab_precos": idTabPreco,
      "tot_bruto": totalPreco,
      "tot_acrescimos": 0,
      "tot_entrada": 0,
      "tot_frete": 0,
      "tot_desc_prc": percentualDesconto,
      "tot_desc_vlr": valorDesconto,
      "tot_liquido": totalDesconto,
      "status": 0,
      "situacao": 0,
      "latitude": lat.toString(),
      "longitude": long.toString(),
    };
    print(jsonDataHeader);

    Database _db = await DatabaseConnection().get();
    var id = await _db.insert('vendas', jsonDataHeader,
        conflictAlgorithm: ConflictAlgorithm.replace);
    for (int i = 0; i < lista.length; i++) {
      var jsonDataBody = {
        "item": i + 1,
        "id_venda": int.parse(id.toString()),
        "id_produto": lista[i].idProduto,
        "complemento": complemento[i],
        "vlr_vendido": lista[i].pvendaTabela,
        "qtde": quantity[i],
        "tot_bruto": lista[i].pvendaTabela * quantity[i],
        "vlr_desc_prc": 0,
        "vlr_desc_vlr": 0,
        "vlr_liquido": lista[i].pvendaTabela * quantity[i],
        "grade": lista[i].grade,
        "id_vendedor": idVendedor
      };
      await _db.insert('vendas_itens', jsonDataBody,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    Notify().pop(context, 'Venda feita com sucesso!', Icons.check, Colors.green,
        'Sucesso');
  }
}
