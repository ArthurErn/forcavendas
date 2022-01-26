import 'dart:convert';
import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/external/http_post.dart';
import 'package:forca_vendas/modules/ui/mobile/login/register_fields.dart';
import 'package:sqflite/sqflite.dart';

class UploadSchedule {
  Future post(context) async {
    var costumerData =
        await GeneralQuery().query('clientes_visitas', 'enviado', 0);
    Database db = await DatabaseConnection().get();
    for (int i = 0; i < costumerData.length; i++) {
      var jsonData = jsonEncode({
        "id": 0,
        "id_pessoa": costumerData[i]['id_pessoa'],
        "id_vendedor": costumerData[i]['id_vendedor'],
        "data": costumerData[i]['data'],
        "observacao": costumerData[i]['observacao'],
        "visitou": 0
      });
      var response = await HttpPost().connect(
          'http://${ipController.text}/lotuserp/fvenpost13_clientes_visitas',
          jsonData,
          context);
      //print(jsonData);
        await db.rawUpdate(
            '''UPDATE clientes_visitas SET id = ${response['id']}, enviado = 1 WHERE id = ${costumerData[i]['id']};''');
    }
  }
}
