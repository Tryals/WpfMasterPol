using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Manager
{
    public int IdManager { get; set; }

    public int? IdEmployee { get; set; }

    public virtual Employe? IdEmployeeNavigation { get; set; }

    public virtual ICollection<Partner> Partners { get; set; } = new List<Partner>();
}
