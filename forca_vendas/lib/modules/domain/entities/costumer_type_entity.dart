class CostumerTypeEntity {
  CostumerTypeEntity({
    required this.id,
    required this.descricao,
    required this.status,
  });
  late final int id;
  late final String descricao;
  late final int status;
  
  CostumerTypeEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    descricao = json['descricao'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['descricao'] = descricao;
    _data['status'] = status;
    return _data;
  }
}