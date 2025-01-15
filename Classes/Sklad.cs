using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Sklad
{
    public int IdSklad { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
