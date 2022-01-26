class RegionEntity {
  RegionEntity({
    required this.id,
    required this.idMunicipio,
    required this.descricao,
    required this.valorEntrega,
  });
  late final int id;
  late final int idMunicipio;
  late final String descricao;
  late final int valorEntrega;
  
  RegionEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idMunicipio = json['id_municipio'];
    descricao = json['descricao'];
    valorEntrega = json['valor_entrega'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_municipio'] = idMunicipio;
    _data['descricao'] = descricao;
    _data['valor_entrega'] = valorEntrega;
    return _data;
  }
}