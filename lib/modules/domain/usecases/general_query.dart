import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

//função Genérica para uso posterior
class GeneralQuery {
  
  //Query nova ára testar
  Future queryAll(table) async {
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawQuery('''SELECT * FROM $table;''');
    return data;
  }

  Future query(table, where, parameter) async {
    Database _db = await DatabaseConnection().get();
    var data = await _db
        .rawQuery('''SELECT * FROM $table WHERE $where = $parameter;''');
    return data;
  }
}
