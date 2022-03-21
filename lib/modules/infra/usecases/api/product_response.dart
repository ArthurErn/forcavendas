import 'package:forca_vendas/modules/external/repository_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/response_interface.dart';

class ProductResponse implements IResponse {
  @override
  Future ping(ip, parameter) async {
    var response = await controller.connect(
        'http://$ip/fvenget11_tabprecos_produtos?pidempresa=$parameter');
    return response;
  }
}
