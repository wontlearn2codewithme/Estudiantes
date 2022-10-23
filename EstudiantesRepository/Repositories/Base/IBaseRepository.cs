using EstudiantesRepository.DBModels;
using System.Data.Common;

namespace EstudiantesRepository.Repositories.Base
{
    public interface IBaseRepository
    {
        public Task<IEnumerable<T>> RawSqlQuery<T>(string query, Func<DbDataReader, T> map, SQLParam[]? dbParams = null);
        public Task<bool> CheckExists(string query, SQLParam[]? dbParams = null);
    }
}
