using EstudiantesRepository.Context;
using EstudiantesRepository.Repositories.Estudiantes;
using EstudiantesRepository.Repositories.Usuario;
using EstudiantesService.Services;
using Microsoft.EntityFrameworkCore;

namespace Estudiantes
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection ConfigureServices(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<IEstudianteService, EstudianteService>();
            return services;
        }
        
        public static IServiceCollection ConfigureRepositories(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddScoped<IEstudianteRepository, EstudianteRepository>();
            services.AddScoped<IUsuarioRepository, UsuarioRepository>();
            return services;
        }
        
        public static IServiceCollection ConfigureDB(this IServiceCollection services, IConfiguration configuration)
        {
            string connection = configuration.GetConnectionString("DefaultConnection");
            services.AddDbContext<DomainDbContext>(options => options.UseLazyLoadingProxies().UseSqlServer(connection));
            return services;
        }
    }
}
