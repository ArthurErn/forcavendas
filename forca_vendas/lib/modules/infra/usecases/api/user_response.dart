import 'package:forca_vendas/modules/external/repository_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/response_interface.dart';

class UserResponse implements IResponse {
  @override
  Future ping(ip, parameter) async {
    var response = await controller.connect(
        'http://$ip/lotuserp/fvenget01_usuarioLogar?pidusuario=$parameter');
    return response;
  }
}
