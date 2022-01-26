using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using pedidostec_api.modules.models;

namespace pedidostec_api.modules.endpoints
{
  public class itens_post
  {
    public static string Template => "/send-itens";

    public static string[] Methods => new string[] { HttpMethod.Post.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromForm] itens_request request, ApplicationDbContext context)
    {
      var item = new pedidos_itens(idcontrato: request.idcontrato, idpedido: request.idpedido,
      item: request.item, id_produto: request.id_produto, complemento: request.complemento,
      vlr_unitario: request.vlr_unitario, qtde: request.qtde, total: request.total);

      context.pedidos_itens.Add(item);
      context.SaveChanges();
      return Results.Ok();
    }
  }
}