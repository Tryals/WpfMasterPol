using System;
using System.Collections.Generic;

namespace WpfMasterPol;

public partial class ProductType
{
    public int IdType { get; set; }

    public string? NameType { get; set; }

    public decimal? KoefType { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
