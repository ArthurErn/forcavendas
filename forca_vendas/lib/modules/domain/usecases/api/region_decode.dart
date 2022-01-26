import 'package:forca_vendas/modules/domain/entities/region_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/region_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class RegionDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await RegionResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(RegionEntity.fromJson(item)));
    return list;
  }
}
