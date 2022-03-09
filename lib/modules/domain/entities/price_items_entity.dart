class PriceItemsEntity {
  PriceItemsEntity({
    required this.idTabprecos,
    required this.idProduto,
    required this.preco,
  });
  late final int idTabprecos;
  late final int idProduto;
  late final dynamic preco;
  
  PriceItemsEntity.fromJson(Map<String, dynamic> json){
    idTabprecos = json['id_tabprecos'];
    idProduto = json['id_produto'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_tabprecos'] = idTabprecos;
    _data['id_produto'] = idProduto;
    _data['preco'] = preco;
    return _data;
  }
}