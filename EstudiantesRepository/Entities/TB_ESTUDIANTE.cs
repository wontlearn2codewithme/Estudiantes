using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_ESTUDIANTE
    {
        public TB_ESTUDIANTE()
        {
            TB_MATRICULA = new HashSet<TB_MATRICULA>();
        }

        public long IdEstudiante { get; set; }
        public string apel_est { get; set; } = null!;
        public string nomb_est { get; set; } = null!;
        public DateTime fnac_est { get; set; }
        public string sexo_est { get; set; } = null!;
        public string dire_est { get; set; } = null!;
        public string tcol_est { get; set; } = null!;
        public string gins_est { get; set; } = null!;
        public long IdDistrito { get; set; }

        public virtual TB_DISTRITO IdDistritoNavigation { get; set; } = null!;
        public virtual ICollection<TB_MATRICULA> TB_MATRICULA { get; set; }
    }
}
