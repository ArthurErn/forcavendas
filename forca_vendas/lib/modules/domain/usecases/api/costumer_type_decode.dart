import 'package:forca_vendas/modules/domain/entities/costumer_type_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/costumer_type_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class CostumerTypeDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await CostumerTypeResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(CostumerTypeEntity.fromJson(item)));
    return list;
  }
}
