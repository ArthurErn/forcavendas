import 'package:forca_vendas/modules/domain/entities/costumer_status_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/costumer_status_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class CostumerStatusDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await CostumerStatusResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(CostumerStatusEntity.fromJson(item)));
    return list;
  }
}
