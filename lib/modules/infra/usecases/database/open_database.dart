import 'package:forca_vendas/modules/infra/usecases/database/scripts/database_scripts.dart';
import 'package:sqflite/sqflite.dart';

class OpenDatabase extends DatabaseScripts {
  Future get(String path) async {
    var db =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      db.execute(createTableUser);
      db.execute(createTableMunicipality);
      db.execute(createTablePayment);
      db.execute(createTableCostumerType);
      db.execute(createTableCostumerStatus);
      db.execute(createTableRegion);
      db.execute(createTableCostumer);
      db.execute(createTableCostumerFinancial);
      db.execute(createTablePrice);
      db.execute(createTablePriceItems);
      db.execute(createTableProduct);
      db.execute(createTableVendas);
      db.execute(createTableVendasItens);
      db.execute(createTableAgenda);
      await db.execute(createTableVendasLista);
    });
    return db;
  }
}
