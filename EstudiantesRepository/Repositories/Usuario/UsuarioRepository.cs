using EstudiantesRepository.Context;
using EstudiantesRepository.DBModels;
using EstudiantesRepository.Repositories.Base;
using Microsoft.Extensions.Caching.Memory;

namespace EstudiantesRepository.Repositories.Usuario
{
    public class UsuarioRepository : BaseRepository, IUsuarioRepository
    {
        public UsuarioRepository(DomainDbContext domainContext, IMemoryCache memoryCache) : base(domainContext, memoryCache)
        {
        }

        public Task<bool> UsuarioExiste(string user, string password)
        {
            var parameters = new List<SQLParam>
            {
                new SQLParam
                {
                    ParamName = "@usuario",
                    ParamType = System.Data.DbType.String,
                    ParamValue = user
                },
                new SQLParam
                {
                    ParamName = "@password",
                    ParamType = System.Data.DbType.String,
                    ParamValue = password
                }
            };
            return CheckExists(
                "GetUsuario",
                parameters.ToArray());
        }
    }
}
