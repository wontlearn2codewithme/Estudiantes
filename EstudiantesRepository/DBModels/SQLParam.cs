using System.Data;

namespace EstudiantesRepository.DBModels
{
    public class SQLParam
    {
        public string ParamName { get; set; }
        public object ParamValue { get; set; }
        public DbType ParamType { get; set; }
    }
}
