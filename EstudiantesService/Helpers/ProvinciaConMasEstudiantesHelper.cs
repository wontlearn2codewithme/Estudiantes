using EstudiantesRepository.Entities;
using EstudiantesService.Models;

namespace EstudiantesService.Helpers
{
    public static class ProvinciaConMasEstudiantesHelper
    {
        public static ProvinciaConMasEstudiantesModel GetProvinciaConMasEstudiantesModelFromProvinciaConMasEstudiantesResult(this ProvinciaConMasEstudiantesResult provinciaConMasEstudiantesResult)
        {
            return new ProvinciaConMasEstudiantesModel
            {
                NombreProvincia = provinciaConMasEstudiantesResult.nomb_pro,
                NumEstudiantes = provinciaConMasEstudiantesResult.numEstudiantes
            };
        }

        public static IEnumerable<ProvinciaConMasEstudiantesModel> GetProvinciaConMasEstudiantesModelFromProvinciaConMasEstudiantesResult(this IEnumerable<ProvinciaConMasEstudiantesResult> provinciaConMasEstudiantesResult)
        {
            List<ProvinciaConMasEstudiantesModel> result = new List<ProvinciaConMasEstudiantesModel>();
            foreach (var item in provinciaConMasEstudiantesResult)
            {
                result.Add(new ProvinciaConMasEstudiantesModel
                {
                    NombreProvincia = item.nomb_pro,
                    NumEstudiantes = item.numEstudiantes
                });
            }
            return result;
        }
    }
}
