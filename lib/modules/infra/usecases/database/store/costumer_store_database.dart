import 'package:forca_vendas/modules/infra/usecases/api/costumer_response.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/store_interface.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';

class CostumerStoreDatabase implements IStore{
  @override
  String tableName = 'clientes';

  @override
  void store(ip, parameter) async {
    Database _db = await DatabaseConnection().get();
    var _response = await CostumerResponse().ping(ip.toString(), parameter.toString());
    for(int i = 0; i < _response.length; i++) {
      await _db.insert(tableName, _response[i], conflictAlgorithm: ConflictAlgorithm.replace);
    } 
  }
}