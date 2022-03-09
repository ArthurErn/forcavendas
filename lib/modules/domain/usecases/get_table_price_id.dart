import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class GetTablePriceID {
  Future get() async {
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawQuery(
        '''SELECT produto_tab_precos.id FROM produto_tab_precos WHERE descricao = descricao;''');
    return data;
  }
}
