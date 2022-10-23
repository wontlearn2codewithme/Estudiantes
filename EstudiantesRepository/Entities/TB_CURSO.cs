using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_CURSO
    {
        public TB_CURSO()
        {
            TB_ASIGNACION = new HashSet<TB_ASIGNACION>();
            TB_MATRICULA = new HashSet<TB_MATRICULA>();
        }

        public long IdCurso { get; set; }
        public string nomb_cur { get; set; } = null!;
        public decimal cost_cur { get; set; }
        public int dura_cur { get; set; }

        public virtual ICollection<TB_ASIGNACION> TB_ASIGNACION { get; set; }
        public virtual ICollection<TB_MATRICULA> TB_MATRICULA { get; set; }
    }
}
