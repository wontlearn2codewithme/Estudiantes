using EstudiantesRepository.Entities;

namespace EstudiantesRepository.Repositories.Estudiantes
{
    public interface IEstudianteRepository
    {
        public Task<IEnumerable<EstudiantesPorProvinciaResult>> GetNumEstudiantesByProvincia();
        public Task<IEnumerable<ProvinciaConMasEstudiantesResult>> GetProvinciaConMasEstudiantesByCurso(int idCurso);
        public Task<IEnumerable<EstudiantesPorDocenteResult>> GetEstudiantesPorDocente();
    }
}
