using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_MATRICULA
    {
        public long IdMatricula { get; set; }
        public DateTime fech_mat { get; set; }
        public long IdEstudiante { get; set; }
        public long IdCurso { get; set; }

        public virtual TB_CURSO IdCursoNavigation { get; set; } = null!;
        public virtual TB_ESTUDIANTE IdEstudianteNavigation { get; set; } = null!;
    }
}
