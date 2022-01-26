using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class system_generators
  {
    [Key]
    public string? idcontrato { get; set; }
    public string? nome { get; set; }
    public int vlr_corrente { get; set; }
  }
}