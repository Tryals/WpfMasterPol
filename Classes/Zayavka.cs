using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Zayavka
{
    public int IdZayavka { get; set; }

    public int? IdProduct { get; set; }

    public int? IdPartners { get; set; }

    public int? CountProducts { get; set; }

    public DateOnly? Data { get; set; }

    public int Percentage { get; set; }

    public virtual Partner? IdPartnersNavigation { get; set; }

    public virtual Product? IdProductNavigation { get; set; }
}
