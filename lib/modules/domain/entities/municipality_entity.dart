class MunicipalityEntity {
  MunicipalityEntity({
    required this.idMunicipio,
    required this.municipioNome,
    required this.municipioEstado,
    required this.paisNome,
  });
  late final int idMunicipio;
  late final String municipioNome;
  late final String municipioEstado;
  late final String paisNome;
  
  MunicipalityEntity.fromJson(Map<String, dynamic> json){
    idMunicipio = json['id_municipio'];
    municipioNome = json['municipio_nome'];
    municipioEstado = json['municipio_estado'];
    paisNome = json['pais_nome'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_municipio'] = idMunicipio;
    _data['municipio_nome'] = municipioNome;
    _data['municipio_estado'] = municipioEstado;
    _data['pais_nome'] = paisNome;
    return _data;
  }
}