import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/entities/sales_list_entity.dart';
import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_page.dart';
import 'package:sqflite/sqflite.dart';

class PostLocalSaleDataBase {
  Future post(context, data_venda, hora_venda, nome_cliente, id_vendedor,
      nome_fpagto, tot_bruto, tot_desc_prc, tot_liquido) async {
    // var collaboratorID = await GetCollaboratorID().get();
    var jsonData = {
      "data_venda": data_venda,
      "hora_venda": hora_venda,
      "nome_cliente": nome_cliente,
      "id_vendedor": id_vendedor,
      "nome_fpagto": nome_fpagto,
      "tot_bruto": tot_bruto,
      "tot_desc_prc": tot_desc_prc,
      "tot_liquido": tot_liquido,
    };
    Database _db = await DatabaseConnection().get();
    await _db.insert('vendas_lista', jsonData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
