import 'package:forca_vendas/modules/domain/entities/product_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/product_response.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/store_interface.dart';
import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductStoreDatabase implements IStore {
  @override
  String tableName = 'produto';

  @override
  Future store(
    ip,
    parameter,
  ) async {
    Database _db = await DatabaseConnection().get();
    var _response = await ProductResponse()
        .ping(ip.toString(), parameter.toString());
    for (int i = 0; i < _response.length; i++) {
      var json = ProductEntity(
              tabprecosId: _response[i]['id_tabprecos'],
              idEmpresa: parameter,
              idProduto: _response[i]['id_produto'],
              produtoDescricao: _response[i]['produto_descricao'],
              unidade: _response[i]['unidade'].toString(),
              refFabrica: _response[i]['ref_fabrica'].toString(),
              gtin: _response[i]['gtin'].toString(),
              grade: _response[i]['grade'].toString(),
              pvendaTabela: _response[i]['pvenda_tabela'],
              saldoGeral: _response[i]['saldo_geral'],
              idFabricante: _response[i]['id_fabricante'],
              fabricanteNome: _response[i]['fabricante_nome'],
              idGrupo: _response[i]['id_grupo'],
              grupoDescricao: '',
              idNcm: _response[i]['id_ncm'].toString(),
              idFornecedor: _response[i]['id_fornecedor'],
              fornecedorNome: _response[i]['fornecedor_nome'].toString(),
              aplicacao: _response[i]['aplicacao'].toString(),
              produtoStatus: 0,
              tabprecosStatus: 0)
          .toJson();
      await _db.insert(tableName, json,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
