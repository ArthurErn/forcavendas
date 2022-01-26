import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/infra/usecases/api/price_response.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/store_interface.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';

class PriceStoreDatabase implements IStore{
  @override
  String tableName = 'produto_tab_precos';

  @override
  void store(ip, parameter) async {
    Database _db = await DatabaseConnection().get();
    parameter = await GetCollaboratorID().get();
    var _response = await PriceResponse().ping(ip.toString(), parameter.toString());
    for(int i = 0; i < _response.length; i++) {
      await _db.insert(tableName, _response[i], conflictAlgorithm: ConflictAlgorithm.replace);
    } 
  }
}