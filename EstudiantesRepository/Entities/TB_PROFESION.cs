using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_PROFESION
    {
        public TB_PROFESION()
        {
            TB_DOCENTE = new HashSet<TB_DOCENTE>();
        }

        public long IdProfesion { get; set; }
        public string nomb_pro { get; set; } = null!;

        public virtual ICollection<TB_DOCENTE> TB_DOCENTE { get; set; }
    }
}
