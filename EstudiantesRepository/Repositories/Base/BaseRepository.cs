using EstudiantesRepository.Context;
using EstudiantesRepository.DBModels;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Data.Common;

namespace EstudiantesRepository.Repositories.Base
{

    /**
     * Clase abstracta que se encarga de inicializar nuestro contexto de base de datos. 
     * El argumento de tipo esperado será la entidad de la tabla a la que queramos lanzar una query.
     * Este patrón nos permite separar la lógica de negocio entre los diferentes repositorios
     * mientras se reutiliza el código más genérico en esta clase
     * */
    public abstract class BaseRepository : IBaseRepository
    {
        public readonly DomainDbContext _domainContext;

        public BaseRepository(DomainDbContext domainContext)
        {
            _domainContext = domainContext;
        }

        public async Task<IEnumerable<T>> RawSqlQuery<T>(string query, Func<DbDataReader, T> map, SQLParam[]? dbParams = null)
        {
            using var command = _domainContext.Database.GetDbConnection().CreateCommand();
            command.CommandText = query;
            command.CommandType = CommandType.StoredProcedure;
            if(dbParams != null && dbParams.Any())
            {
                foreach (var param in dbParams)
                {
                    var parameter = command.CreateParameter();
                    parameter.ParameterName = param.ParamName;
                    parameter.Value = param.ParamValue;
                    parameter.DbType = param.ParamType;
                    command.Parameters.Add(parameter);
                }
            }
            _domainContext.Database.OpenConnection();

            using var result = command.ExecuteReader();
            var entities = new List<T>();

            while (result.Read())
            {
                entities.Add(map(result));
            }

            await result.DisposeAsync();
            await command.DisposeAsync();
            return entities;
        }
    }
}
