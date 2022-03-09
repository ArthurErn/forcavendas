class UserEntity {
  UserEntity({
    required this.id,
    required this.idUsuarioGrupo,
    required this.idColaborador,
    required this.colaboradorNome,
    required this.idEmpresa,
    required this.empresaRazao,
    required this.login,
    required this.senha,
    required this.status,
    required this.trocarSenha,
  });
  late final int id;
  late final int idUsuarioGrupo;
  late final int idColaborador;
  late final String colaboradorNome;
  late final int idEmpresa;
  late final String empresaRazao;
  late final String login;
  late final String senha;
  late final int status;
  late final int trocarSenha;
  
  UserEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    idUsuarioGrupo = json['id_usuario_grupo'];
    idColaborador = json['id_colaborador'];
    colaboradorNome = json['colaborador_nome'];
    idEmpresa = json['id_empresa'];
    empresaRazao = json['empresa_razao'];
    login = json['login'];
    senha = json['senha'];
    status = json['status'];
    trocarSenha = json['trocar_senha'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_usuario_grupo'] = idUsuarioGrupo;
    _data['id_colaborador'] = idColaborador;
    _data['colaborador_nome'] = colaboradorNome;
    _data['id_empresa'] = idEmpresa;
    _data['empresa_razao'] = empresaRazao;
    _data['login'] = login;
    _data['senha'] = senha;
    _data['status'] = status;
    _data['trocar_senha'] = trocarSenha;
    return _data;
  }
}