using System;
using System.Collections.Generic;

namespace EstudiantesRepository.Entities
{
    public partial class TB_PROVINCIA
    {
        public TB_PROVINCIA()
        {
            TB_DISTRITO = new HashSet<TB_DISTRITO>();
        }

        public long IdProvincia { get; set; }
        public string nomb_pro { get; set; } = null!;

        public virtual ICollection<TB_DISTRITO> TB_DISTRITO { get; set; }
    }
}
