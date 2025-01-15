using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class Material
{
    public int IdMaterial { get; set; }

    public int? IdTypeMat { get; set; }

    public string? TitleMat { get; set; }

    public int? IdPostav { get; set; }

    public int? CountBox { get; set; }

    public string? Unit { get; set; }

    public string? Description { get; set; }

    public byte[]? Picture { get; set; }

    public decimal? Price { get; set; }

    public int? CountSklad { get; set; }

    public int? MinCount { get; set; }

    public string? HistoryCountMat { get; set; }

    public int? IdSklad { get; set; }

    public virtual Postavshik? IdPostavNavigation { get; set; }

    public virtual Sklad? IdSkladNavigation { get; set; }

    public virtual MaterialType? IdTypeMatNavigation { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
