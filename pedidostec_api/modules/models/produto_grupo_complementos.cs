using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class produto_grupo_complementos
  {
    [Key]
    public int idgrupo { get; set; }
    public string? idcontrato { get; set; }
    public int item { get; set; }
    public double valor { get; set; }
    public string? nome_complemento { get; set; }
    public int status { get; set; }
  }
}