import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';

class SalesListStoreDatabase {
  String tableName = 'vendas_lista';

  Future store(Map<String, dynamic> items) async {
    Database _db = await DatabaseConnection().get();
    await _db.insert(tableName, items,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
