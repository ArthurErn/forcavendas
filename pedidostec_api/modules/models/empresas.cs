using System.ComponentModel.DataAnnotations;

namespace pedidostec_api.modules.models
{
  public class empresas
  {
    [Key]
    public string? idcontrato { get; set; }
    public string? fantasia { get; set; }
    public string? url_pedidos { get; set; }
    public DateTime? data_cadastro { get; set; }
    public string? fone { get; set; }
    public string? whatsapp { get; set; }
    public string? endereco { get; set; }
    public string? endereco_numero { get; set; }
    public string? bairro { get; set; }
    public string? municipio { get; set; }
    public string? municipio_uf { get; set; }
    public string? email { get; set; }
    public string? site { get; set; }
    public DateTime? cont_validade { get; set; }
    public int cont_status { get; set; }
    public string? hora_abrir { get; set; }
    public string? hora_fechar { get; set; }
    public int dia_dom { get; set; }
    public int dia_seg { get; set; }
    public int dia_ter { get; set; }
    public int dia_qua { get; set; }
    public int dia_qui { get; set; }
    public int dia_sex { get; set; }
    public int dia_sab { get; set; }
    public byte[]? logo_empresa { get; set; }
    public string? cor_primaria { get; set; }
    public string? cor_secundaria { get; set; }
  }
}