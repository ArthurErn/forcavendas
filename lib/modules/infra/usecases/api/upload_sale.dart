import 'package:forca_vendas/modules/domain/usecases/general_query.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:forca_vendas/modules/external/http_post.dart';
import 'package:forca_vendas/modules/ui/mobile/login/register_fields.dart';
import 'package:sqflite/sqflite.dart';

class UploadSale {
  Future post(context) async {
    String concatJson = "";
    var headerData = await GeneralQuery().query('vendas', 'situacao', 0);
    String jsonBodyData = "";
    Database _db = await DatabaseConnection().get();
    for (int i = 0; i < headerData.length; i++) {
      var bodyData = await GeneralQuery()
          .query('vendas_itens', 'id_venda', headerData[i]['id_venda']);
      var dataVenda = headerData[i]['data_venda'].toString();
      var jsonData =
          '{"data_venda": "${dataVenda.toString()}", "hora_venda": "${headerData[i]['hora_venda'].toString()}", "id_empresa": ${headerData[i]['id_empresa']}, "id_cliente": ${headerData[i]['id_cliente']}, "id_vendedor": ${headerData[i]['id_vendedor']}, "id_fpagto": ${headerData[i]['id_fpagto']}, "id_usuario": ${headerData[i]['id_usuario']},  "id_tab_precos": ${headerData[i]['id_tab_precos']},"tot_bruto": ${headerData[i]['tot_bruto']}, "tot_acrescimos": ${headerData[i]['tot_acrescimos']}, "tot_entrada": ${headerData[i]['tot_entrada']}, "tot_frete": ${headerData[i]['tot_frete']}, "tot_desc_prc": ${headerData[i]['tot_desc_prc']}, "tot_desc_vlr": ${headerData[i]['tot_desc_vlr']}, "tot_liquido": ${headerData[i]['tot_liquido']}, "latitude": "${headerData[i]['latitude']}", "longitude": "${headerData[i]['longitude']}", "itens": [';
      concatJson = jsonData;
      for (int i = 0; i < bodyData.length; i++) {
        jsonBodyData =
            '{"item": ${bodyData[i]['item']},"id_produto": ${bodyData[i]['id_produto']},"complemento": "${bodyData[i]['complemento']}","vlr_vendido": ${bodyData[i]['vlr_vendido']},"qtde": ${bodyData[i]['qtde']},"tot_bruto": ${bodyData[i]['tot_bruto']},"vlr_desc_prc": ${bodyData[i]['vlr_desc_prc']},"vlr_desc_vlr": ${bodyData[i]['vlr_desc_vlr']},"vlr_liquido": ${bodyData[i]['vlr_liquido']},"grade": "${bodyData[i]['grade']}","id_vendedor": ${bodyData[i]['id_vendedor']}},';
        concatJson = concatJson + jsonBodyData;
        
        _db.rawUpdate(
            '''UPDATE vendas_itens SET enviado = 1 WHERE id_venda = ${headerData[0]['id_venda']};''');
      }

      var jsonFooter = ']}';
      concatJson = concatJson + jsonFooter;
      concatJson = concatJson.toString().replaceAll("},]}", "}]}");
      print(concatJson);
      var response = await HttpPost().connect(
          'http://${ipController.text}/fvenpost12_vendas', concatJson, context);
      _db.rawUpdate(
          '''UPDATE vendas SET situacao = 1, id_venda = ${response.toString().replaceAll("{success: true, message: ", "").replaceAll("}", "")} WHERE id_venda = ${headerData[i]['id_venda']};''');
      _db.rawUpdate(
          '''UPDATE vendas_itens SET enviado = 1, id_venda = ${response.toString().replaceAll("{success: true, message: ", "").replaceAll("}", "")} WHERE id_venda = ${headerData[i]['id_venda']};''');
    }
  }
}
