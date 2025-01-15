using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Cadr
{
    public int IdCadr { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Proizvodstvo> Proizvodstvos { get; set; } = new List<Proizvodstvo>();
}
