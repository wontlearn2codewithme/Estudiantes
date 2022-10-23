using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_DISTRITO
    {
        public TB_DISTRITO()
        {
            TB_ESTUDIANTE = new HashSet<TB_ESTUDIANTE>();
        }

        public long IdDistrito { get; set; }
        public string nomb_dis { get; set; } = null!;
        public long IdProvincia { get; set; }

        public virtual TB_PROVINCIA IdProvinciaNavigation { get; set; } = null!;
        public virtual ICollection<TB_ESTUDIANTE> TB_ESTUDIANTE { get; set; }
    }
}
