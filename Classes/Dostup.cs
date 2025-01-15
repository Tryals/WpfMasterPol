using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Dostup
{
    public int IdDostup { get; set; }

    public DateTime? DataTime { get; set; }

    public int? IdEmployee { get; set; }

    public virtual Employe? IdEmployeeNavigation { get; set; }
}
