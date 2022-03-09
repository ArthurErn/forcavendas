class CostumerEntity {
  CostumerEntity({
    required this.id,
    required this.tpPessoa,
    required this.cpfCnpj,
    required this.nomeRazao,
    required this.apelidoFantasia,
    required this.rgInsc,
    required this.inscMunicipal,
    required this.fone1,
    required this.fone2,
    required this.fone3,
    required this.cep,
    required this.endereco,
    required this.enderecoNumero,
    required this.complemento,
    required this.idMunicipio,
    required this.bairro,
    required this.idStatus,
    required this.idClienteTipo,
    required this.email,
    required this.limCreTotal,
    required this.limCreDisponivel,
    required this.priCompraData,
    required this.priCompraValor,
    required this.ultCompraData,
    required this.ultCompraValor,
    required this.titulosPendentesQtde,
    required this.titulosPendentesTotal,
    required this.saldoAVencer,
    required this.saldoVencido,
  });
  late final int id;
  late final int tpPessoa;
  late final String cpfCnpj;
  late final String nomeRazao;
  late final String apelidoFantasia;
  late final String rgInsc;
  late final String inscMunicipal;
  late final String fone1;
  late final String fone2;
  late final String fone3;
  late final String cep;
  late final String endereco;
  late final String enderecoNumero;
  late final String complemento;
  late final int idMunicipio;
  late final String bairro;
  late final int idStatus;
  late final int idClienteTipo;
  late final String email;
  late final int limCreTotal;
  late final int limCreDisponivel;
  late final String priCompraData;
  late final double priCompraValor;
  late final String ultCompraData;
  late final double ultCompraValor;
  late final int titulosPendentesQtde;
  late final double titulosPendentesTotal;
  late final int saldoAVencer;
  late final double saldoVencido;
  
  CostumerEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    tpPessoa = json['tp_pessoa'];
    cpfCnpj = json['cpf_cnpj'];
    nomeRazao = json['nome_razao'];
    apelidoFantasia = json['apelido_fantasia'];
    rgInsc = json['rg_insc'];
    inscMunicipal = json['inscMunicipal'];
    fone1 = json['fone1'];
    fone2 = json['fone2'];
    fone3 = json['fone3'];
    cep = json['cep'];
    endereco = json['endereco'];
    enderecoNumero = json['endereco_numero'];
    complemento = json['complemento'];
    idMunicipio = json['id_municipio'];
    bairro = json['bairro'];
    idStatus = json['id_status'];
    idClienteTipo = json['id_cliente_tipo'];
    email = json['email'];
    limCreTotal = json['lim_cre_total'];
    limCreDisponivel = json['lim_cre_disponivel'];
    priCompraData = json['pri_compra_data'];
    priCompraValor = json['pri_compra_valor'];
    ultCompraData = json['ult_compra_data'];
    ultCompraValor = json['ult_compra_valor'];
    titulosPendentesQtde = json['titulos_pendentes_qtde'];
    titulosPendentesTotal = json['titulos_pendentes_total'];
    saldoAVencer = json['saldo_a_vencer'];
    saldoVencido = json['saldo_vencido'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tp_pessoa'] = tpPessoa;
    _data['cpf_cnpj'] = cpfCnpj;
    _data['nome_razao'] = nomeRazao;
    _data['apelido_fantasia'] = apelidoFantasia;
    _data['rg_insc'] = rgInsc;
    _data['insc_municipal'] = inscMunicipal;
    _data['fone1'] = fone1;
    _data['fone2'] = fone2;
    _data['fone3'] = fone3;
    _data['cep'] = cep;
    _data['endereco'] = endereco;
    _data['endereco_numero'] = enderecoNumero;
    _data['complemento'] = complemento;
    _data['id_municipio'] = idMunicipio;
    _data['bairro'] = bairro;
    _data['id_status'] = idStatus;
    _data['id_cliente_tipo'] = idClienteTipo;
    _data['email'] = email;
    _data['lim_cre_total'] = limCreTotal;
    _data['lim_cre_disponivel'] = limCreDisponivel;
    _data['pri_compra_data'] = priCompraData;
    _data['pri_compra_valor'] = priCompraValor;
    _data['ult_compra_data'] = ultCompraData;
    _data['ult_compra_valor'] = ultCompraValor;
    _data['titulos_pendentes_qtde'] = titulosPendentesQtde;
    _data['titulos_pendentes_total'] = titulosPendentesTotal;
    _data['saldo_a_vencer'] = saldoAVencer;
    _data['saldo_vencido'] = saldoVencido;
    return _data;
  }
}