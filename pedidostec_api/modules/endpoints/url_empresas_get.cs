using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using pedidostec_api.modules.models;

namespace pedidostec_api.modules.endpoints
{
  public class url_empresas_get
  {
    public static string Template => "/get-url";

    public static string[] Methods => new string[] { HttpMethod.Get.ToString() };

    public static Delegate Handle => Action;

    public static IResult Action([FromQuery] string url, ApplicationDbContext context)
    {
      var sql = from e in context.empresas
                where e.url_pedidos == url
                select new empresas
                {
                  idcontrato = e.idcontrato,
                  fantasia = e.fantasia,
                  url_pedidos = e.url_pedidos,
                  data_cadastro = e.data_cadastro,
                  fone = e.fone,
                  whatsapp = e.whatsapp,
                  endereco = e.endereco,
                  endereco_numero = e.endereco_numero,
                  bairro = e.bairro,
                  municipio = e.municipio,
                  municipio_uf = e.municipio_uf,
                  email = e.email,
                  site = e.site,
                  cont_validade = e.cont_validade,
                  cont_status = e.cont_status,
                  hora_abrir = e.hora_abrir,
                  hora_fechar = e.hora_fechar,
                  dia_dom = e.dia_dom,
                  dia_seg = e.dia_seg,
                  dia_ter = e.dia_ter,
                  dia_qua = e.dia_qua,
                  dia_qui = e.dia_qui,
                  dia_sex = e.dia_sex,
                  dia_sab = e.dia_sab,
                  logo_empresa = e.logo_empresa,
                  cor_primaria = e.cor_primaria,
                  cor_secundaria = e.cor_secundaria
                };
      if (sql.ToArray().Length == 0)
        return Results.NotFound("Nenhuma empresa localizada");
      return Results.Ok(sql);
    }
  }
}