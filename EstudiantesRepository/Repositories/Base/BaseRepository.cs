using EstudiantesRepository.Context;
using EstudiantesRepository.DBModels;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
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
        private readonly DomainDbContext _domainContext;
        private readonly IMemoryCache _memoryCache;
        public BaseRepository(DomainDbContext domainContext, IMemoryCache memoryCache)
        {
            _domainContext = domainContext;
            _memoryCache = memoryCache;
        }

        public async Task<IEnumerable<T>> RawSqlQuery<T>(string query, Func<DbDataReader, T> map, SQLParam[]? dbParams = null)
        {
            string cacheKey = query;
            if (dbParams != null)
            {
                var suffix = dbParams.Select(x => $"{x.ParamName}{x.ParamValue}");
                cacheKey += string.Join('|', suffix);
            }
            List<T> cached = _memoryCache.Get<List<T>>(cacheKey);
            if (cached != null)
            {
                return cached;
            }
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
            _memoryCache.Set(cacheKey, entities, TimeSpan.FromMinutes(1));
            return entities;
        }
        
        public async Task<bool> CheckExists(string query, SQLParam[]? dbParams = null)
        {
            string cacheKey = query;
            if (dbParams != null)
            {
                var suffix = dbParams.Select(x => $"{x.ParamName}{x.ParamValue}");
                cacheKey += string.Join('|', suffix);
            }
            bool? cached = _memoryCache.Get<bool?>(cacheKey);
            if (cached.HasValue)
            {
                return cached.Value;
            }
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
            bool exists = result.HasRows;

            await result.DisposeAsync();
            await command.DisposeAsync();
            _memoryCache.Set(cacheKey, exists, TimeSpan.FromMinutes(1));
            return exists;
        }
    }
}
