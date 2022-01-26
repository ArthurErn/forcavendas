using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class pedidos_itens
  {
    public pedidos_itens(int idpedido, string? idcontrato, int item, int id_produto, string? complemento, double vlr_unitario, double qtde, double total)
    {
      this.idpedido = idpedido;
      this.idcontrato = idcontrato;
      this.item = item;
      this.id_produto = id_produto;
      this.complemento = complemento;
      this.vlr_unitario = vlr_unitario;
      this.qtde = qtde;
      this.total = total;
    }
    public int idpedido { get; set; }
    public string? idcontrato { get; set; }
    public int item { get; set; }
    public int id_produto { get; set; }
    public string? complemento { get; set; }
    public double vlr_unitario { get; set; }
    public double qtde { get; set; }
    public double total { get; set; }
  }
}