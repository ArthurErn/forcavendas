using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using LotusERP_API;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using pedidostec_api.modules.endpoints;
using pedidostec_api.modules.models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<ApplicationDbContext>(options => options.UseNpgsql(builder.Configuration["ConnectionString:Default"]));
var app = builder.Build();

app.UseDefaultFiles();
app.UseStaticFiles();
app.MapGet("/", () => "Hello World!");
app.MapMethods(grupos_get.Template, grupos_get.Methods, grupos_get.Handle);
app.MapMethods(bairros_get.Template, bairros_get.Methods, bairros_get.Handle);
app.MapMethods(pizzas_get.Template, pizzas_get.Methods, pizzas_get.Handle);
app.MapMethods(url_empresas_get.Template, url_empresas_get.Methods, url_empresas_get.Handle);
app.MapMethods(id_get.Template, id_get.Methods, id_get.Handle);
app.MapMethods(complementos_grupo_get.Template, complementos_grupo_get.Methods, complementos_grupo_get.Handle);
app.MapMethods(itens_post.Template, itens_post.Methods, itens_post.Handle);
app.MapMethods(header_post.Template, header_post.Methods, header_post.Handle);
app.MapMethods(file_upload.Template, file_upload.Methods, file_upload.Handle);
//app.MapPost("/upload", file_uploads);

app.Run();
