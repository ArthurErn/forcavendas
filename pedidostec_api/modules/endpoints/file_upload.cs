using System.Buffers.Text;
using Microsoft.AspNetCore.Mvc;

namespace pedidostec_api.modules.endpoints
{
  public class file_upload
  {
    public static string Template => "/uploadimage";

    public static string[] Methods => new string[] { HttpMethod.Post.ToString() };

    public static Delegate Handle => Action;

    public class texto{
      public String? files { get; set; }
    }

    public static IResult Action([FromBody] texto files)
    {
      return Results.Ok();
    }
  }
}