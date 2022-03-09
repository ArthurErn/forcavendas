class PaymentEntity {
  PaymentEntity({
    required this.id,
    required this.descricao,
    required this.qtdadeParc,
    required this.status,
  });
  late final int id;
  late final String descricao;
  late final int qtdadeParc;
  late final int status;
  
  PaymentEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    descricao = json['descricao'];
    qtdadeParc = json['qtdade_parc'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['descricao'] = descricao;
    _data['qtdade_parc'] = qtdadeParc;
    _data['status'] = status;
    return _data;
  }
}