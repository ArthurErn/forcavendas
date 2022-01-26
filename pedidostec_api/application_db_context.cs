using Microsoft.EntityFrameworkCore;
using pedidostec_api.modules.models;

namespace LotusERP_API
{
  public class ApplicationDbContext : DbContext
  {
    private string connectionString;

    public DbSet<produto_grupo> produto_grupo { get; set; } = null!;
    public DbSet<produto_grupo_complementos> produto_grupo_complementos { get; set; } = null!;
    public DbSet<pedidos_itens> pedidos_itens { get; set; } = null!;
    public DbSet<pedidos> pedidos { get; set; } = null!;
    public DbSet<system_generators> system_generators { get; set; } = null!;
    public DbSet<empresas> empresas { get; set; } = null!;
    public DbSet<produto> produto { get; set; } = null!;
    public DbSet<bairros> bairros { get; set; } = null!;

    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base()
    {
      var builder = new ConfigurationBuilder();
      builder.AddJsonFile("appsettings.Development.json", optional: false);
      var configuration = builder.Build();
      connectionString = configuration["ConnectionString:Default"];
    }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
      optionsBuilder.EnableSensitiveDataLogging();
      optionsBuilder.UseNpgsql(connectionString);
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
      base.OnModelCreating(modelBuilder);
      modelBuilder.Entity<pedidos_itens>().HasKey(p => new { p.id_produto, p.item, p.idcontrato });
      modelBuilder.Entity<pedidos>().HasKey(p => new { p.idcontrato, p.idpedido });
    }

  }
}