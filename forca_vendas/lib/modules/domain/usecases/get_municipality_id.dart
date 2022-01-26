import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class GetMunicipalityID {
  Future get(String descricao) async {
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawQuery(
        '''SELECT municipio.id_municipio FROM municipio WHERE municipio_nome = '$descricao';''');
    return data;
  }
}
