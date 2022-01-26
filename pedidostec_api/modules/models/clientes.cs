using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class clientes
  {
    [Key]
    public int idcliente { get; set; }
    public string? email { get; set; }
    public string? fone1 { get; set; }
    public string? whatsapp { get; set; }
    public string? nome { get; set; }
    public DateTime data_cadastro { get; set; }
    public string? endereco { get; set; }
    public string? endereco_numero { get; set; }
    public string? bairro { get; set; }
    public string? municipio { get; set; }
    public string? municipio_uf { get; set; }
    public string? cep { get; set; }
  }
}