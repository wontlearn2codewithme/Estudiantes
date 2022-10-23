using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_DOCENTE
    {
        public TB_DOCENTE()
        {
            TB_ASIGNACION = new HashSet<TB_ASIGNACION>();
        }

        public long IdDocente { get; set; }
        public string apel_doc { get; set; } = null!;
        public string nomb_doc { get; set; } = null!;
        public string dire_doc { get; set; } = null!;
        public string ntel_doc { get; set; } = null!;
        public string grad_doc { get; set; } = null!;
        public long IdProfesion { get; set; }

        public virtual TB_PROFESION IdProfesionNavigation { get; set; } = null!;
        public virtual ICollection<TB_ASIGNACION> TB_ASIGNACION { get; set; }
    }
}
