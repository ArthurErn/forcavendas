class CostumerStatusEntity {
  CostumerStatusEntity({
    required this.id,
    required this.descricao,
    required this.bloquePessoa,
  });
  late final int id;
  late final String descricao;
  late final int bloquePessoa;
  
  CostumerStatusEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    descricao = json['descricao'];
    bloquePessoa = json['bloque_pessoa'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['descricao'] = descricao;
    _data['bloque_pessoa'] = bloquePessoa;
    return _data;
  }
}