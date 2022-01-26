import 'package:forca_vendas/modules/domain/entities/user_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/user_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class UserDecode implements IDecode {
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await UserResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(UserEntity.fromJson(item)));
    return list;
  }
}
