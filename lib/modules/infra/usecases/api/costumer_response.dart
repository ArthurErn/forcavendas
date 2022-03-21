import 'package:forca_vendas/modules/domain/usecases/get_collaborator_id.dart';
import 'package:forca_vendas/modules/external/repository_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/response_interface.dart';

class CostumerResponse implements IResponse {
  @override
  Future ping(ip, parameter) async {
    var id = await GetCollaboratorID().get();
    var response = await controller.connect(
        'http://$ip/fvenget07_clientes?pidcolaborador=$id');
    return response;
  }
}
