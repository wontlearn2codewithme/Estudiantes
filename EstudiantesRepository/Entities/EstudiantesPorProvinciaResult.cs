using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EstudiantesRepository.Entities
{
    /**
     * Modelo que representa el resultado del SP [EstudiantesPorProvincia]
     */
    public class EstudiantesPorProvinciaResult
    {
        public int numEstudiantes { get; set; }
        public string nomb_pro { get; set; }
        public string nomb_dis { get; set; }
    }
}
