import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/infra/usecases/api/region_response.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/store_interface.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';

class RegionStoreDatabase implements IStore{
  @override
  String tableName = 'regioes_bairros';

  @override
  Future store(ip, parameter) async {
    Database _db = await DatabaseConnection().get();
    parameter = await GetCollaboratorID().get();
    var _response = await RegionResponse().ping(ip.toString(), parameter.toString());
    for(int i = 0; i < _response.length; i++) {
      await _db.insert(tableName, _response[i], conflictAlgorithm: ConflictAlgorithm.replace);
    } 
  }
}
