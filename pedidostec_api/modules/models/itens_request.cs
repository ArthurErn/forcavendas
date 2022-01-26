namespace pedidostec_api.modules.models
{
  public class itens_request
  {
    public string? idcontrato { get; set; }
    public int idpedido { get; set; }
    public int item { get; set; }
    public int id_produto { get; set; }
    public string? complemento { get; set; }
    public double vlr_unitario { get; set; }
    public int qtde { get; set; }
    public double total { get; set; }
  }
}