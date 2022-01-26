using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class pedidos
  {
    public pedidos(int idpedido, string? idcontrato, string? telefone, string? nome, string? endereco, string? numero, string? bairro, double tot_pedido, int tipo_pagto, double valor_troco, int status, double taxa_entrega)
    {
      this.idpedido = idpedido;
      this.idcontrato = idcontrato;
      this.telefone = telefone;
      this.nome = nome;
      this.endereco = endereco;
      this.numero = numero;
      this.bairro = bairro;
      this.tot_pedido = tot_pedido;
      this.tipo_pagto = tipo_pagto;
      this.valor_troco = valor_troco;
      this.status = status;
      this.taxa_entrega = taxa_entrega;
    }

    public int idpedido { get; set; }
    public string? idcontrato { get; set; }
    public string? telefone { get; set; }
    public string? nome { get; set; }
    public string? endereco { get; set; }
    public string? numero { get; set; }
    public string? bairro { get; set; }
    public double tot_pedido { get; set; }
    public int tipo_pagto { get; set; }
    public double valor_troco { get; set; }
    public int status { get; set; }
    public double taxa_entrega { get; set; }
  }
}