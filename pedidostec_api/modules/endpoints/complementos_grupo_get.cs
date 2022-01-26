using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using pedidostec_api.modules.models;

namespace pedidostec_api.modules.endpoints
{
  public class complementos_grupo_get
  {
    public static string Template => "/get-complementos";

    public static string[] Methods => new string[] { HttpMethod.Get.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromQuery] string idcontrato, [FromQuery] int idgrupo, ApplicationDbContext context)
    {
      var response = from p in context.produto_grupo_complementos
                     where p.idcontrato == idcontrato && p.idgrupo == idgrupo
                     select new produto_grupo_complementos
                     {
                       idcontrato = p.idcontrato,
                       idgrupo = p.idgrupo,
                       item = p.item,
                       nome_complemento = p.nome_complemento,
                       valor = p.valor,
                       status = p.status,
                     };
      if (response.ToArray().Length == 0)
        return Results.NotFound("Nenhum complemento localizado");
      return Results.Ok(response);
    }
  }
}
