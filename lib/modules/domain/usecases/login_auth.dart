import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/ui/mobile/home/home_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:crypto/crypto.dart';

class LoginAuth {
  Future auth(String user, String password, context) async {
    password = md5.convert(utf8.encode(password)).toString().toUpperCase();
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawQuery(
        '''SELECT * FROM usuario WHERE login = '${user.toUpperCase()}' AND senha = '$password';''');
    if (data.isEmpty == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Notify().pop(context, 'Erro ao logar, verifique os campos!', Icons.error,
          Colors.red, 'Erro');
    }
  }
}
