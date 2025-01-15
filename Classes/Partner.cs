using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Partner
{
    public int IdPartners { get; set; }

    public int? IdPartnerType { get; set; }

    public string? NameCompany { get; set; }

    public string? UrAdress { get; set; }

    public string? Inn { get; set; }

    public string? DirectorName { get; set; }

    public string? Phone { get; set; }

    public string? Email { get; set; }

    public byte[]? Logo { get; set; }

    public int? Rating { get; set; }

    public string? PlacesSales { get; set; }

    public string? History { get; set; }

    public int? IdManager { get; set; }

    public virtual Manager? IdManagerNavigation { get; set; }

    public virtual PartnerType? IdPartnerTypeNavigation { get; set; }

    public virtual ICollection<Zayavka> Zayavkas { get; set; } = new List<Zayavka>();
}
