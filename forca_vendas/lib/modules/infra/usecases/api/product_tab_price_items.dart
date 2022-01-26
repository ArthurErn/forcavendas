import 'package:forca_vendas/modules/external/repository_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/response_interface.dart';

class ProductTabPriceItemsResponse implements IResponse {
  @override
  Future ping(ip, parameter) async {
    var response = await controller.connect(
        'http://$ip/lotuserp/fvenget10_clientes_tabprecos_itens?pidempresa=$parameter');
    return response;
  }
}
