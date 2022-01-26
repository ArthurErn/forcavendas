using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class bairros
  {
    [Key]
    public int idbairro { get; set; }
    public string? idcontrato { get; set; }
    public string? descricao { get; set; }
    public double taxa_entrega { get; set; }
    public int status { get; set; }
  }
}