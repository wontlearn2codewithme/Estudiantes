using EstudiantesRepository.Context;
using EstudiantesRepository.DBModels;
using EstudiantesRepository.Entities;
using EstudiantesRepository.Repositories.Base;

namespace EstudiantesRepository.Repositories.Estudiantes
{
    /**
     * Implementación de la entidad TB_ESTUDIANTE para lanzar queries a la BBDD
     * En las implementaciones lanzamos las queries más específicas de esta entidad
     * */
    public class EstudianteRepository : BaseRepository, IEstudianteRepository
    {
        public EstudianteRepository(DomainDbContext domainContext) : base(domainContext)
        {
        }

        public Task<IEnumerable<EstudiantesPorProvinciaResult>> GetNumEstudiantesByProvincia()
        {
            return RawSqlQuery(
                "EstudiantesPorProvincia",
                x => new EstudiantesPorProvinciaResult
                {
                    nomb_dis = (string)x[2],
                    nomb_pro = (string)x[1],
                    numEstudiantes = Convert.ToInt32(x[0])
                });
        }

        public Task<IEnumerable<ProvinciaConMasEstudiantesResult>> GetProvinciaConMasEstudiantesByCurso(int idCurso)
        {
            var parameters = new List<SQLParam>();
            parameters.Add(new SQLParam
            {
                ParamName = "@IdCurso",
                ParamType = System.Data.DbType.Int64,
                ParamValue = idCurso
            });
            return RawSqlQuery(
                "ProvinciaConMasEstudiantes",
                x => new ProvinciaConMasEstudiantesResult
                {
                    numEstudiantes = Convert.ToInt32(x[0]),
                    nomb_pro = (string)x[1],
                },
                parameters.ToArray());
        }
        
        public Task<IEnumerable<EstudiantesPorDocenteResult>> GetEstudiantesPorDocente()
        {
            return RawSqlQuery(
                "EstudiantesPorDocente",
                x => new EstudiantesPorDocenteResult
                {
                    nomb_doc = (string)x[0],
                    nomb_est = (string)x[1],
                });
        }
    }
}
