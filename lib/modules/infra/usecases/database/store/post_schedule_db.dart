import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/schedule/schedule_page.dart';
import 'package:sqflite/sqflite.dart';

class PostScheduleDatabase {
  Future post(context, idPessoa, data, obs, nomePessoa, id, texto) async {
    var collaboratorID = await GetCollaboratorID().get();
    var jsonData = {
      "id": id,
      "id_pessoa": idPessoa,
      "id_vendedor": collaboratorID,
      "nome_pessoa": nomePessoa,
      "data": data.toString(),
      "observacao": obs.toString(),
      "enviado": 0,
      "visitou": 0
    };
    Database _db = await DatabaseConnection().get();
    await _db.insert('clientes_visitas', jsonData,
        conflictAlgorithm: ConflictAlgorithm.replace);
    Navigator.pop(context);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SchedulePage()));
    Notify().pop(context, 'Agendamento $texto com sucesso!', Icons.check,
        Colors.green, 'Sucesso');
  }
}
