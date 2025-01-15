using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class PostavType
{
    public int IdPostavType { get; set; }

    public virtual ICollection<Postavshik> Postavshiks { get; set; } = new List<Postavshik>();
}
