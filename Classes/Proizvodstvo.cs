using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Proizvodstvo
{
    public int IdProiz { get; set; }

    public string? Name { get; set; }

    public int? IdCadr { get; set; }

    public virtual Cadr? IdCadrNavigation { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
