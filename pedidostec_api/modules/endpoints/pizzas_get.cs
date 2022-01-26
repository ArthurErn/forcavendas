using LotusERP_API;
using Microsoft.AspNetCore.Mvc;

namespace pedidostec_api.modules.models
{
  public class pizzas_get
  {
    public static string Template => "/get-pizzas";

    public static string[] Methods => new string[] { HttpMethod.Get.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromQuery] string idcontrato, ApplicationDbContext context)
    {
      var sql = from p in context.produto
                join pg in context.produto_grupo on new { p.idcontrato, p.idgrupo } equals new { pg.idcontrato, pg.idgrupo }
                where p.idcontrato == idcontrato && p.produto_pizza == 1
                select new produto
                {
                  idcontrato = p.idcontrato,
                  idgrupo = p.idgrupo,
                  idproduto = p.idproduto,
                  descricao = p.descricao,
                  unidade = p.unidade,
                  referencia = p.referencia,
                  gtin = p.gtin,
                  pvenda = p.pvenda,
                  composicao = p.composicao,
                  status = p.status,
                  grupo_descricao = pg.descricao,
                  foto_produto = p.foto_produto,
                  produto_pizza = p.produto_pizza,
                  produto_pizza_qtdesabora = p.produto_pizza_qtdesabora,
                };
      if (sql.ToArray().Length == 0)
        return Results.NotFound("Nenhuma pizza localizada");
      return Results.Ok(sql);
    }
  }
}