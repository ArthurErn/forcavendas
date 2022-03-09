import 'package:forca_vendas/modules/infra/usecases/database/open_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  late Database _db;
  Future<Database> get() async {
    var path = join(await getDatabasesPath(), 'forca_vendas.db');
    _db = await OpenDatabase().get(path);
    return _db;
  }
}
