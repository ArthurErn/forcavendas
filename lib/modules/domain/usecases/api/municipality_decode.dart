import 'package:forca_vendas/modules/domain/entities/municipality_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/municipality_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class MunicipalityDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await MunicipalityResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(MunicipalityEntity.fromJson(item)));
    return list;
  }
}
