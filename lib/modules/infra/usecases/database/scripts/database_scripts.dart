class DatabaseScripts {
  String createTableUser = '''CREATE TABLE usuario(
    id integer, 
    id_usuario_grupo integer,
    id_colaborador integer, 
    colaborador_nome character varying(60), 
    id_empresa integer, 
    empresa_razao character varying(60), 
    login character varying(20), 
    senha character varying(200), 
    status integer, 
    trocar_senha integer,
    enviar_forca_vendas integer,
    PRIMARY KEY (id)
  );''';

  String createTableMunicipality = '''CREATE TABLE municipio(
    id_municipio integer,
    id_pessoa,
    municipio_nome character varying(60),
    municipio_estado character varying(2),
    pais_nome character varying(30),
    PRIMARY KEY (id_municipio)
  );''';

  String createTablePayment = '''CREATE TABLE formas_pagtos(
    id integer,
    descricao character varying(60),
    qtdade_parc integer,
    status integer,
    PRIMARY KEY (id)
  );''';

  String createTableCostumerType = '''CREATE TABLE clientes_tipos(
    id integer,
    descricao character varying(60),
    status integer,
    PRIMARY KEY (id)
  );''';

  String createTableCostumerStatus = '''CREATE TABLE clientes_status(
    id integer,
    descricao character varying(60),
    bloque_pessoa integer,
    PRIMARY KEY (id)
  );''';

  String createTableRegion = '''CREATE TABLE regioes_bairros(
    id integer,
    id_municipio integer,
    descricao character varying(60),
    valor_entrega numeric(15, 2),
    PRIMARY KEY (id)
  );''';

  String createTableCostumer = '''CREATE TABLE clientes(
    id integer,
    tp_pessoa integer,
    cpf_cnpj character varying(20) DEFAULT '',
    nome_razao character varying(60) DEFAULT '',
    apelido_fantasia character varying(60) DEFAULT '',
    rg_insc character varying(20) DEFAULT '',
    insc_municipal character varying(25) DEFAULT '',
    fone1 character varying(25) DEFAULT '',
    fone2 character varying(25) DEFAULT '',
    fone3 character varying(25) DEFAULT '',
    cep character varying(10) DEFAULT '',
    endereco character varying(60) DEFAULT '',
    endereco_numero character varying(10) DEFAULT '',
    complemento character varying(60) DEFAULT '',
    id_municipio integer,
    bairro character varying(30) DEFAULT '',
    id_status integer,
    id_cliente_tipo integer,
    email character varying(300),
    lim_cre_total numeric(15, 2),
    lim_cre_disponivel numeric(15, 2),
    pri_compra_data date,
    pri_compra_valor numeric(15, 2),
    ult_compra_data date,
    ult_compra_valor numeric(15, 2),
    titulos_pendentes_qtde numeric(15, 2),
    titulos_pendentes_total numeric(15, 2),
    saldo_a_vencer numeric(15, 2),
    saldo_vencido numeric(15, 2),
    id_vendedor character varying(300),
    obs character varying(300),
    id_tabela_preco integer,
    enviado integer DEFAULT 1,
    editado integer DEFAULT 0,
    PRIMARY KEY(id)
  );''';

  String createTableCostumerFinancial = '''CREATE TABLE clientes_financeiro(
    id integer,
    id_cliente integer,
    id_venda integer,
    data_vecto date,
    valor_doc numeric(15, 2),
    parc_num integer,
    parc_qtd integer,
    PRIMARY KEY(id)
    );''';

  String createTablePrice = '''CREATE TABLE produto_tab_precos(
    id integer,
    descricao character varying(50),
    tipo_indice integer,
    valor_indice numeric(15, 2),
    id_empresa integer,
    status integer,
    PRIMARY KEY(id)
    );''';

  String createTablePriceItems = '''CREATE TABLE produto_tab_precos_itens(
    id_tabprecos integer,
    id_produto integer,
    preco numeric(15, 4)
    );''';

  String createTableProduct = '''CREATE TABLE produto(
    tabprecos_id integer,
    id_empresa integer,
    id_produto integer,
    produto_descricao character varying(60),
    unidade character varying(5),
    ref_fabrica character varying(30),
    gtin character varying(20),
    grade character varying(10),
    pvenda_tabela numeric(15, 4),
    saldo_geral numeric(15, 3),
    id_fabricante integer,
    fabricante_nome character varying(60),
    id_grupo integer,
    grupo_descricao character varying(60),
    id_ncm character varying(10),
    id_fornecedor integer,
    fornecedor_nome character varying(60),
    aplicacao character varying(1000),
    produto_status integer,
    tabprecos_status integer,
    PRIMARY KEY(tabprecos_id, id_empresa, id_produto, grade)
    );''';

  String createTableVendas = '''CREATE TABLE vendas(
    id_venda integer,
    data_venda date,
    hora_venda character varying(10),
    id_empresa integer,
    id_cliente integer,
    id_vendedor integer,
    id_fpagto integer,
    id_usuario integer,
    id_tab_precos integer,
    tot_bruto numeric(15, 2),
    tot_acrescimos numeric(15, 2),
    tot_entrada numeric(15, 2),
    tot_frete numeric(15, 2),
    tot_desc_prc numeric(15, 4),
    tot_desc_vlr numeric(15, 2),
    tot_liquido numeric(15, 2),
    status integer,
    situacao integer,
    latitude character varying(20),
    longitude character varying(20),
    PRIMARY KEY(id_venda)
  );''';

  String createTableVendasItens = '''CREATE TABLE vendas_itens(
    item integer,
    id_venda integer,
    id_produto integer,
    complemento character varying(500),
    vlr_vendido numeric(15, 2),
    qtde numeric(15, 2),
    tot_bruto numeric(15, 2),
    vlr_desc_prc numeric(15, 4),
    vlr_desc_vlr numeric(15, 2),
    vlr_liquido numeric(15, 2),
    grade character varying(5),
    id_vendedor integer,
    enviado integer DEFAULT 0
  );''';

  String createTableAgenda = '''CREATE TABLE clientes_visitas(
    id integer,
    id_pessoa integer,
    nome_pessoa character varying(500),
    id_vendedor integer,
    data date,
    observacao character varying(500),
    visitou integer,
    enviado integer DEFAULT 0,
    PRIMARY KEY(id)
  );''';

  String createTableVendasLista = '''CREATE TABLE vendas_lista(
    id integer,
    data_venda date,
    hora_venda character varying(10),
    nome_cliente character varying(500),
    id_vendedor integer,
    nome_fpagto character varying(500),
    tot_bruto numeric(15, 2),
    tot_desc_prc numeric(15, 4),
    tot_liquido numeric(15, 2),
    PRIMARY KEY(id)
  );''';
}
