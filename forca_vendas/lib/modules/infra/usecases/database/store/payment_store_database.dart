import 'package:forca_vendas/modules/infra/usecases/database/store/store_interface.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/infra/usecases/api/payment_response.dart';
import 'package:sqflite/sqlite_api.dart';

class PaymentStoreDatabase implements IStore{
  @override
  String tableName = 'formas_pagtos';

  @override
  void store(ip, parameter) async {
    Database _db = await DatabaseConnection().get();
    var _response = await PaymentResponse().ping(ip.toString(), parameter.toString());
    for(int i = 0; i < _response.length; i++) {
      await _db.insert(tableName, _response[i], conflictAlgorithm: ConflictAlgorithm.replace);
    } 
  }
}
