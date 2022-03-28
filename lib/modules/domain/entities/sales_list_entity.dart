class SalesListEntity {
  SalesListEntity({
    required this.id,
    required this.dataVenda,
    required this.horaVenda,
    required this.nomeCliente,
    required this.idVendedor,
    required this.nomeFpagto,
    required this.totBruto,
    required this.totDescPrc,
    required this.totLiquido,
  });
  late final int id;
  late final String dataVenda;
  late final String horaVenda;
  late final String nomeCliente;
  late final int idVendedor;
  late final String nomeFpagto;
  late final dynamic totBruto;
  late final dynamic totDescPrc;
  late final dynamic totLiquido;

  SalesListEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dataVenda = json['data_venda'];
    horaVenda = json['hora_venda'];
    nomeCliente = json['nome_cliente'];
    idVendedor = json['id_vendedor'];
    nomeFpagto = json['nome_fpagto'];
    totBruto = json['tot_bruto'];
    totDescPrc = json['tot_desc_prc'];
    totLiquido = json['tot_liquido'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['data_venda'] = dataVenda;
    _data['hora_venda'] = horaVenda;
    _data['nome_cliente'] = nomeCliente;
    _data['id_vendedor'] = idVendedor;
    _data['nome_fpagto'] = nomeFpagto;
    _data['tot_bruto'] = totBruto;
    _data['tot_desc_prc'] = totDescPrc;
    _data['tot_liquido'] = totLiquido;
    return _data;
  }
}
