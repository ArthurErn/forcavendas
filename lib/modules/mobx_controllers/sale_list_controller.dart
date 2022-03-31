import 'package:mobx/mobx.dart';
part 'sale_list_controller.g.dart';

class SaleListController = _SaleListControllerBase with _$SaleListController;
SaleListController saleListController = SaleListController();

abstract class _SaleListControllerBase with Store {
//Atributos e açoes do controlador

  @observable
  bool search = false;
  
}
