import 'package:forca_vendas/modules/domain/entities/costumer_entity.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';
import 'package:forca_vendas/modules/infra/usecases/api/costumer_response.dart';

class CostumerDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await CostumerResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(CostumerEntity.fromJson(item)));
    return list;
  }
}
