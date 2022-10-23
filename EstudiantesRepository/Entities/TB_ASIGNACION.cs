using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_ASIGNACION
    {
        public long IdAsignacion { get; set; }
        public DateTime fech_asi { get; set; }
        public long IdCurso { get; set; }
        public long IdDocente { get; set; }

        public virtual TB_CURSO IdCursoNavigation { get; set; } = null!;
        public virtual TB_DOCENTE IdDocenteNavigation { get; set; } = null!;
    }
}
