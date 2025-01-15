using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Product
{
    public int IdProduct { get; set; }

    public int? IdType { get; set; }

    public string? Name { get; set; }

    public string? Description { get; set; }

    public byte[]? Picture { get; set; }

    public decimal? MinPrice { get; set; }

    public string? SizeBox { get; set; }

    public string? WeightNoBox { get; set; }

    public string? WeightBox { get; set; }

    public byte[]? License { get; set; }

    public string? NumberStandart { get; set; }

    public string? HistoryMinPrice { get; set; }

    public DateTime? Time { get; set; }

    public decimal? Sebeprice { get; set; }

    public int? NumberCesh { get; set; }

    public int? CountPeople { get; set; }

    public int? IdMaterial { get; set; }

    public int? IdProiz { get; set; }

    public string? Articul { get; set; }

    public virtual Material? IdMaterialNavigation { get; set; }

    public virtual Proizvodstvo? IdProizNavigation { get; set; }

    public virtual ProductType? IdTypeNavigation { get; set; }

    public virtual ICollection<Zayavka> Zayavkas { get; set; } = new List<Zayavka>();
}
