using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class produto_grupo
  {
    [Key]
    public int idgrupo { get; set; }
    public string? idcontrato { get; set; }
    public string? descricao { get; set; }
    public int status { get; set; }
    public byte[]? imagem_grupo { get; set; }
  }
}