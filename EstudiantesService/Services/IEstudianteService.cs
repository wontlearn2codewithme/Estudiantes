using EstudiantesRepository.Entities;
using EstudiantesService.Models;

namespace EstudiantesService.Services
{
    public interface IEstudianteService
    {
        public Task<IEnumerable<EstudiantePorProvinciaModel>> GetNumEstudiantesByProvincia();
        public Task<IEnumerable<ProvinciaConMasEstudiantesModel>> GetProvinciaConMasEstudiantesByCurso(int idCurso);
        public Task<IOrderedEnumerable<EstudiantesPorDocenteModel>> GetEstudiantesPorDocente();
    }
}
