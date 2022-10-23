using EstudiantesRepository.Entities;
using EstudiantesRepository.Repositories.Estudiantes;
using EstudiantesService.Models;
using EstudiantesService.Helpers;

namespace EstudiantesService.Services
{
    public class EstudianteService : IEstudianteService
    {
        private readonly IEstudianteRepository _estudianteRepository;
        public EstudianteService(IEstudianteRepository estudianteRepository)
        {
            _estudianteRepository = estudianteRepository;
        }

        public async Task<IEnumerable<EstudiantePorProvinciaModel>> GetNumEstudiantesByProvincia()
        {
            IEnumerable<EstudiantesPorProvinciaResult> result = await _estudianteRepository.GetNumEstudiantesByProvincia();
            return result.GetEstudiantePorProvinciaModelFromEstudiantePorProvinciaResult();
        }
        
        public async Task<IEnumerable<ProvinciaConMasEstudiantesModel>> GetProvinciaConMasEstudiantesByCurso(int idCurso)
        {
            IEnumerable<ProvinciaConMasEstudiantesResult> result = await _estudianteRepository.GetProvinciaConMasEstudiantesByCurso(idCurso);
            return result.GetProvinciaConMasEstudiantesModelFromProvinciaConMasEstudiantesResult();
        }
        
        public async Task<IOrderedEnumerable<EstudiantesPorDocenteModel>> GetEstudiantesPorDocente()
        {
            IEnumerable<EstudiantesPorDocenteResult> result = await _estudianteRepository.GetEstudiantesPorDocente();
            return result.GroupBy(x => x.nomb_doc)
                .Select(group => new EstudiantesPorDocenteModel
                {
                    NombreProfesor = group.Key,
                    NumeroAlumnos = group.Count()
                }).OrderBy(x => x.NombreProfesor);
        }
    }
}
