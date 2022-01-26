class ProductEntity {
  ProductEntity(
      {required this.tabprecosId,
      required this.idEmpresa,
      required this.idProduto,
      required this.produtoDescricao,
      required this.unidade,
      required this.refFabrica,
      required this.gtin,
      required this.grade,
      required this.pvendaTabela,
      required this.saldoGeral,
      required this.idFabricante,
      required this.fabricanteNome,
      required this.idGrupo,
      required this.grupoDescricao,
      required this.idNcm,
      required this.idFornecedor,
      required this.fornecedorNome,
      required this.aplicacao,
      required this.produtoStatus,
      required this.tabprecosStatus});

  late final int tabprecosId;
  late final int idEmpresa;
  late final int idProduto;
  late final String produtoDescricao;
  late final String unidade;
  late final String refFabrica;
  late final String gtin;
  late final String grade;
  late final dynamic pvendaTabela;
  late final dynamic saldoGeral;
  late final int idFabricante;
  late final String fabricanteNome;
  late final int idGrupo;
  late final String grupoDescricao;
  late final String idNcm;
  late final int idFornecedor;
  late final String fornecedorNome;
  late final String aplicacao;
  late final int produtoStatus;
  late final int tabprecosStatus;

  ProductEntity.fromJson(Map<String, dynamic> json) {
    tabprecosId = json['tabprecos_id'];
    idEmpresa = json['id_empresa'];
    idProduto = json['id_produto'];
    produtoDescricao = json['produto_descricao'];
    unidade = json['unidade'];
    refFabrica = json['ref_fabrica'];
    gtin = json['gtin'];
    grade = json['grade'];
    pvendaTabela = json['pvenda_tabela'];
    saldoGeral = json['saldo_geral'];
    idFabricante = json['id_fabricante'];
    fabricanteNome = json['fabricante_nome'];
    idGrupo = json['id_grupo'];
    grupoDescricao = json['grupo_descricao'];
    idNcm = json['id_ncm'];
    idFornecedor = json['id_fornecedor'];
    fornecedorNome = json['fornecedor_nome'];
    aplicacao = json['aplicacao'];
    produtoStatus = json['produto_status'];
    tabprecosStatus = json['tabprecos_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tabprecos_id'] = tabprecosId;
    _data['id_empresa'] = idEmpresa;
    _data['id_produto'] = idProduto;
    _data['produto_descricao'] = produtoDescricao;
    _data['unidade'] = unidade;
    _data['ref_fabrica'] = refFabrica;
    _data['gtin'] = gtin;
    _data['grade'] = grade;
    _data['pvenda_tabela'] = pvendaTabela;
    _data['saldo_geral'] = saldoGeral;
    _data['id_fabricante'] = idFabricante;
    _data['fabricante_nome'] = fabricanteNome;
    _data['id_grupo'] = idGrupo;
    _data['grupo_descricao'] = grupoDescricao;
    _data['id_ncm'] = idNcm;
    _data['id_fornecedor'] = idFornecedor;
    _data['fornecedor_nome'] = fornecedorNome;
    _data['aplicacao'] = aplicacao;
    _data['produto_status'] = produtoStatus;
    _data['tabprecos_status'] = tabprecosStatus;
    return _data;
  }
}
