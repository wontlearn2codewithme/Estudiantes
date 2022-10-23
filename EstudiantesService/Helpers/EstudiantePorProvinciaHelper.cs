using EstudiantesRepository.Entities;
using EstudiantesService.Models;

namespace EstudiantesService.Helpers
{
    public static class EstudiantePorProvinciaHelper
    {
        public static EstudiantePorProvinciaModel GetEstudiantePorProvinciaModelFromEstudiantePorProvinciaResult(this EstudiantesPorProvinciaResult estudiantesPorProvinciaResult)
        {
            return new EstudiantePorProvinciaModel
            {
                NombreDistrito = estudiantesPorProvinciaResult.nomb_dis,
                NombreProvincia = estudiantesPorProvinciaResult.nomb_pro,
                NumEstudiantes = estudiantesPorProvinciaResult.numEstudiantes
            };
        }

        public static IEnumerable<EstudiantePorProvinciaModel> GetEstudiantePorProvinciaModelFromEstudiantePorProvinciaResult(this IEnumerable<EstudiantesPorProvinciaResult> estudiantesPorProvinciaResult)
        {
            List<EstudiantePorProvinciaModel> result = new List<EstudiantePorProvinciaModel>();
            foreach (var item in estudiantesPorProvinciaResult)
            {
                result.Add(new EstudiantePorProvinciaModel
                {
                    NombreDistrito = item.nomb_dis,
                    NombreProvincia = item.nomb_pro,
                    NumEstudiantes = item.numEstudiantes
                });
            }
            return result;
        }
    }
}
