using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Employe
{
    public int IdEmployee { get; set; }

    public string? Fio { get; set; }

    public DateOnly? DateOfBirth { get; set; }

    public int? Pasport { get; set; }

    public string? BanksRekv { get; set; }

    public string? HavingAFamily { get; set; }

    public string? HealthStatus { get; set; }

    public virtual ICollection<Dostup> Dostups { get; set; } = new List<Dostup>();

    public virtual ICollection<Manager> Managers { get; set; } = new List<Manager>();
}
