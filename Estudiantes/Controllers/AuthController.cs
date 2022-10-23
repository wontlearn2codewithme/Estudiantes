using Estudiantes.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Estudiantes.Controllers
{
    [Produces("application/json")]
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public AuthController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpPost, Route("login")]
        [AllowAnonymous]
        public IActionResult Index(LoginRequest loginRequest)
        {
            if (loginRequest == null || string.IsNullOrWhiteSpace(loginRequest.UserName) || string.IsNullOrWhiteSpace(loginRequest.Password))
            {
                return BadRequest("Must provide username and password");
            }
            if (loginRequest.UserName == "test" && loginRequest.Password == "test")
            {
                var _symmetricSecurityKey = new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes(_configuration["JWT:SecretKey"])
                );
                var _signingCredentials = new SigningCredentials(
                        _symmetricSecurityKey, SecurityAlgorithms.HmacSha256
                    );
                var _Header = new JwtHeader(_signingCredentials);
                var _Payload = new JwtPayload(
                    issuer: _configuration["JWT:Issuer"],
                    audience: _configuration["JWT:Audience"],
                    claims: new Claim[]
                    {
                        new Claim("Usuario", "test"),
                        new Claim("Contraseña", "test")
                    },
                    notBefore: DateTime.UtcNow,
                     expires: DateTime.UtcNow.AddHours(1)
                );
                var _Token = new JwtSecurityToken(
                    _Header,
                    _Payload
                );
                string token = new JwtSecurityTokenHandler().WriteToken(_Token);
                return Ok(token);
                //var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:SecretKey"]));
                //var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);
                //var tokenOptions = new JwtSecurityToken(
                //    issuer: _configuration["JWT:ISsuer"],
                //    audience: _configuration["JWT:Audience"],
                //    claims: new List<Claim>(),
                //    expires: DateTime.Now.AddMinutes(5),
                //    signingCredentials: signinCredentials
                //);
                //var tokenString = new JwtSecurityTokenHandler().WriteToken(tokenOptions);
                //return Ok(new { Token = tokenString });
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}
