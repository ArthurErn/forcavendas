import 'package:flutter/material.dart';
import 'package:forca_vendas/modules/domain/usecases/notify.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/costumer_financial_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/costumer_status_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/costumer_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/costumer_type_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/municipality_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/payment_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/price_item_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/price_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/product_store_database.dart';
import 'package:forca_vendas/modules/infra/usecases/database/store/region_store_database.dart';
import 'package:forca_vendas/modules/ui/mobile/login/register_fields.dart';

import 'general_query.dart';

class SyncData {
  Future sync(context) async {
    try {
      var id =
          await GeneralQuery().query('usuario', 'id', userIDController.text);
      id = id[0]['id_empresa'];
      CostumerFinancialStoreDatabase().store(ipController.text, null);
      CostumerStatusStoreDatabase().store(ipController.text, null);
      CostumerStoreDatabase().store(ipController.text, userIDController.text);
      CostumerTypeStoreDatabase().store(ipController.text, null);
      MunicipalityStoreDatabase().store(ipController.text, null);
      PaymentStoreDatabase().store(ipController.text, id);
      RegionStoreDatabase().store(ipController.text, null);
      PriceStoreDatabase().store(ipController.text, null);
      PriceItemStoreDatabase().store(ipController.text, id);
      ProductStoreDatabase().store(ipController.text, id);
    } catch (e) {
      Notify().pop(context, 'Erro ao sincronizar dados!', Icons.check,
          Colors.red, 'Sucesso');
    } finally {
      Notify().pop(context, 'Dados sincronizados!', Icons.sync, Colors.blue,
          'Aguarde!');
    }
  }
}
