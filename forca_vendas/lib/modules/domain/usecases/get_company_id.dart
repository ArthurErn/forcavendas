import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/login/login_fields.dart';
import 'package:sqflite/sqlite_api.dart';

class GetCollaboratorID {
  String senha = md5.convert(utf8.encode(passwordController.text)).toString();
  Future get() async {
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawQuery(
        '''SELECT usuario.id_colaborador FROM usuario WHERE login = '${loginController.text.toUpperCase()}' AND senha = '${senha.toUpperCase()}';''');
    var idCollaborator = data[0]['id_colaborador'];
    return idCollaborator;
  }
}
