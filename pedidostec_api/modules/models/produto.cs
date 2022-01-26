using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class produto
  {
    [Key]
    public int idproduto { get; set; }
    public string? idcontrato { get; set; }
    public string? descricao { get; set; }
    public string? grupo_descricao { get; set; }
    public string? unidade { get; set; }
    public string? referencia { get; set; }
    public string? gtin { get; set; }
    public int idgrupo { get; set; }
    public double pvenda { get; set; }
    public string? composicao { get; set; }
    public int status { get; set; }
    public byte[]? foto_produto { get; set; }
    public int produto_pizza { get; set; }
    public int produto_pizza_qtdesabora { get; set; }
  }
}