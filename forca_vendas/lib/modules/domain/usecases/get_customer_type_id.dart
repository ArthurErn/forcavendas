import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class GetCustomerTypeID {
  Future get(String descricao) async {
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawQuery(
        '''SELECT clientes_tipos.id FROM clientes_tipos WHERE descricao = '$descricao';''');
    return data;
  }
}
