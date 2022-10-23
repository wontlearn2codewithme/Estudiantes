namespace EstudiantesRepository.Repositories.Usuario
{
    public interface IUsuarioRepository
    {
        public Task<bool> UsuarioExiste(string user, string password);
    }
}
