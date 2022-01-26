using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using pedidostec_api.modules.models;

namespace pedidostec_api.modules.endpoints
{
  public class grupos_get
  {
    public static string Template => "/get-grupos";

    public static string[] Methods => new string[] { HttpMethod.Get.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromQuery] string idcontrato, ApplicationDbContext context)
    {
      var response = from ps in context.produto_grupo
                     where ps.idcontrato == idcontrato
                     select new produto_grupo
                     {
                       idgrupo = ps.idgrupo,
                       idcontrato = ps.idcontrato,
                       descricao = ps.descricao,
                       status = ps.status,
                       imagem_grupo = ps.imagem_grupo
                     };
      if (response.ToArray().Length == 0)
        return Results.NotFound("Nenhum grupo localizado");
      return Results.Ok(response);
    }
  }
}