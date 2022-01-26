using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using pedidostec_api.modules.models;

namespace pedidostec_api.modules.endpoints
{
  public class bairros_get
  {
    public static string Template => "/get-bairros";

    public static string[] Methods => new string[] { HttpMethod.Get.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromQuery] string idcontrato, ApplicationDbContext context)
    {
      var response = from b in context.bairros
                     where b.idcontrato == idcontrato
                     select new bairros
                     {
                       idbairro = b.idbairro,
                       idcontrato = b.idcontrato,
                       descricao = b.descricao,
                       taxa_entrega = b.taxa_entrega,
                       status = b.status
                     };
      if (response.ToArray().Length == 0)
        return Results.NotFound("Nenhum bairro localizado");
      return Results.Ok(response);
    }
  }
}