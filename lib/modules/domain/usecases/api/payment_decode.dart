import 'package:forca_vendas/modules/domain/entities/payment_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/payment_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class PaymentDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await PaymentResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(PaymentEntity.fromJson(item)));
    return list;
  }
}
