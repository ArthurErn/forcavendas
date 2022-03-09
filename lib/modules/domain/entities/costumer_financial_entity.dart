class CostumerFinancialEntity {
  CostumerFinancialEntity({
    required this.id,
    required this.idCliente,
    required this.idVenda,
    required this.dataVecto,
    required this.valorDoc,
    required this.parcNum,
    required this.parcQtd,
  });
  late final int id;
  late final int idCliente;
  late final int idVenda;
  late final String dataVecto;
  late final double valorDoc;
  late final int parcNum;
  late final int parcQtd;
  
  CostumerFinancialEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idCliente = json['id_cliente'];
    idVenda = json['id_venda'];
    dataVecto = json['data_vecto'];
    valorDoc = json['valor_doc'];
    parcNum = json['parc_num'];
    parcQtd = json['parc_qtd'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_cliente'] = idCliente;
    _data['id_venda'] = idVenda;
    _data['data_vecto'] = dataVecto;
    _data['valor_doc'] = valorDoc;
    _data['parc_num'] = parcNum;
    _data['parc_qtd'] = parcQtd;
    return _data;
  }
}