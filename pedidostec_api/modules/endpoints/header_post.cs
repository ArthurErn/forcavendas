using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using pedidostec_api.modules.models;

namespace pedidostec_api.modules.endpoints
{
  public class header_post
  {
    public static string Template => "/send-pedido";

    public static string[] Methods => new string[] { HttpMethod.Post.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromForm] pedido_request request, ApplicationDbContext context)
    {
      var item = new pedidos(idpedido: request.idpedido, idcontrato: request.idcontrato, telefone: request.telefone, 
      nome: request.nome, endereco: request.endereco, numero: request.numero, bairro: request.bairro, 
      tot_pedido: request.tot_pedido, tipo_pagto: request.tipo_pagto, valor_troco: request.valor_troco, 
      status: request.status, taxa_entrega: request.taxa_entrega);

      context.pedidos.Add(item);
      context.SaveChanges();
      return Results.Ok();
    }
  }
}