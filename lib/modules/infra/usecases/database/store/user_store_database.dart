import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/infra/usecases/api/user_response.dart';
import 'package:sqflite/sqlite_api.dart';

class UserStoreDatabase {
  String tableName = 'usuario';

  Future store(ip, parameter, context) async {
    Database _db = await DatabaseConnection().get();
    try {
      var _response =
          await UserResponse().ping(ip.toString(), parameter.toString());
      if (_response.toString().isNotEmpty) {
        _db.insert(tableName, _response[0],
            conflictAlgorithm: ConflictAlgorithm.replace);

        Notify().pop(context, 'Conectado com sucesso no servidor', Icons.check,
            Colors.green, 'Sucesso!');
      } else {
        Notify().pop(context, 'Erro ao conectar no servidor', Icons.close,
            Colors.red, 'Erro!');
      }
    } catch (e) {
      Notify().pop(context, 'Erro ao conectar no servidor', Icons.close,
            Colors.red, 'Erro!');
    }
  }
}
