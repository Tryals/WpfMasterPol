using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Postavshik
{
    public int IdPostav { get; set; }

    public string? Title { get; set; }

    public string? Inn { get; set; }

    public string? HistoryPostav { get; set; }

    public int? IdTypePostav { get; set; }

    public virtual PostavType? IdTypePostavNavigation { get; set; }

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
