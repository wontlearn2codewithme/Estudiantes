using Estudiantes.Models;
using EstudiantesService.Models;
using EstudiantesService.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Estudiantes.Controllers
{
    [Produces("application/json")]
    [ApiController]
    [Route("api/[controller]")]
    public class EstudianteController : ControllerBase
    {
        private readonly IEstudianteService _estudianteService;
        public EstudianteController(IEstudianteService estudianteService)
        {
            _estudianteService = estudianteService;
        }

        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> GetNumEstudiantesByProvincia()
        {
            IEnumerable<EstudiantePorProvinciaModel> result = await _estudianteService.GetNumEstudiantesByProvincia();
            if (!result.Any())
            {
                return NotFound();
            }
            return Ok(result);
        }

        [HttpGet, Route("estudiantes")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> GetNumEstudiantesPorDocente()
        {
            IEnumerable<EstudiantesPorDocenteModel> result = await _estudianteService.GetEstudiantesPorDocente();
            if (!result.Any())
            {
                return NotFound();
            }
            return Ok(result);
        }
        
        [HttpPost]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> GetProvinciaConMasEstudiantesByCurso([FromBody] GetProvinciaConMasEstudiantesByCursoRequest request)
        {
            IEnumerable<ProvinciaConMasEstudiantesModel> result = await _estudianteService.GetProvinciaConMasEstudiantesByCurso(request.IdCurso);
            if (!result.Any())
            {
                return NotFound();
            }
            return Ok(result);
        }
    }
}
