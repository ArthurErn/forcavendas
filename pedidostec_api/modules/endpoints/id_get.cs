using LotusERP_API;
using Microsoft.AspNetCore.Mvc;

namespace pedidostec_api.modules.endpoints
{
  public class id_get
  {
    public static string Template => "/get-id";

    public static string[] Methods => new string[] { HttpMethod.Get.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromQuery] string idcontrato, ApplicationDbContext context)
    {
      var sys = context.system_generators.Where(n => n.nome == "PEDIDOS" && n.idcontrato == idcontrato).First();
      sys.vlr_corrente = (sys.vlr_corrente + 1);
      context.SaveChanges();
      return Results.Ok(sys);
    }
  }
}

