using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class MaterialType
{
    public int IdTypeMat { get; set; }

    public string? Name { get; set; }

    public string? PercentBreak { get; set; }

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
