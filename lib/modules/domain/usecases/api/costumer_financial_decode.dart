import 'package:forca_vendas/modules/domain/entities/costumer_financial_entity.dart';
import 'package:forca_vendas/modules/infra/usecases/api/costumer_financial_response.dart';
import 'package:forca_vendas/modules/domain/usecases/api/decode_interface.dart';

class CostumerFinancialDecode implements IDecode{
  @override
  List list = [];

  @override
  Future decode(ip, parameter) async{
    var response = await CostumerFinancialResponse().ping(ip.toString(), parameter.toString());
    response.forEach((item) => list.add(CostumerFinancialEntity.fromJson(item)));
    return list;
  }
}
