import 'package:forca_vendas/modules/external/repository_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/response_interface.dart';

class PaymentResponse implements IResponse{
  @override
  Future ping(ip, parameter) async {
    var response = await controller.connect(
        'http://$ip/fvenget03_fpagtos?pidempresa=$parameter');
    return response;
  }
}
