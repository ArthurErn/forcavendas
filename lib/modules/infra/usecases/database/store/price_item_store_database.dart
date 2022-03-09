import 'package:forca_vendas/modules/domain/entities/price_items_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/product_tab_price_items.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/store_interface.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';

class PriceItemStoreDatabase implements IStore {
  @override
  String tableName = 'produto_tab_precos_itens';

  @override
  void store(ip, parameter) async {
    Database _db = await DatabaseConnection().get();
    var items = await ProductTabPriceItemsResponse()
        .ping(ip.toString(), parameter.toString());
    for (int i = 0; i < items.length; i++) {
      var json = PriceItemsEntity(
              idProduto: items[i]['id_produto'],
              idTabprecos: items[i]['id_tabprecos'],
              preco: items[i]['pvenda_tabela'])
          .toJson();
      await _db.insert(tableName, json,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
