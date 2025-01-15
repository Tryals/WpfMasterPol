using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class PartnerType
{
    public int IdPartnerType { get; set; }

    public string? NamePartner { get; set; }

    public virtual ICollection<Partner> Partners { get; set; } = new List<Partner>();
}
