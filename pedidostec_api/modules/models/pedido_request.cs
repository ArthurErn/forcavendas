using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
    public class pedido_request
    {
      public string? idcontrato { get; set; }
      [Key]
      public int idpedido { get; set; }
      public string? telefone { get; set; }
      public string? nome { get; set; }
      public string? endereco { get; set; }
      public string? numero { get; set; }
      public string? bairro { get; set; }
      public double tot_pedido { get; set; }
      public double tot_pedido_liquido { get; set; }
      public double valor_tro { get; set; }
      public int tipo_pagto { get; set; }
      public double taxa_entrega { get; set; }
      public double valor_troco { get; set; }
      public int status { get; set; }
    }
}