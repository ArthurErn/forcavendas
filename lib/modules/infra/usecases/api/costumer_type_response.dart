import 'package:forca_vendas/modules/external/repository_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/response_interface.dart';

class CostumerTypeResponse implements IResponse{
  @override
  Future ping(ip, parameter) async {
    var response = await controller.connect(
        'http://$ip/fvenget04_clientes_tipos');
    return response;
  }
}
