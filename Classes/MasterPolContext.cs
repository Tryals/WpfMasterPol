using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WpfMasterPol;

public partial class MasterPolContext : DbContext
{
    public MasterPolContext()
    {
    }

    public MasterPolContext(DbContextOptions<MasterPolContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cadr> Cadrs { get; set; }

    public virtual DbSet<Dostup> Dostups { get; set; }

    public virtual DbSet<Employe> Employes { get; set; }

    public virtual DbSet<Manager> Managers { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<MaterialType> MaterialTypes { get; set; }

    public virtual DbSet<Partner> Partners { get; set; }

    public virtual DbSet<PartnerType> PartnerTypes { get; set; }

    public virtual DbSet<PostavType> PostavTypes { get; set; }

    public virtual DbSet<Postavshik> Postavshiks { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductType> ProductTypes { get; set; }

    public virtual DbSet<Proizvodstvo> Proizvodstvos { get; set; }

    public virtual DbSet<Sklad> Sklads { get; set; }

    public virtual DbSet<ViewPartner> ViewPartners { get; set; }

    public virtual DbSet<Zayavka> Zayavkas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=44-1\\SQLEXPRESS;Database=MasterPol;TrustServerCertificate=True; Trusted_Connection=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cadr>(entity =>
        {
            entity.HasKey(e => e.IdCadr);

            entity.ToTable("cadrs");

            entity.Property(e => e.IdCadr).HasColumnName("id_cadr");
            entity.Property(e => e.Description).HasColumnName("description");
        });

        modelBuilder.Entity<Dostup>(entity =>
        {
            entity.HasKey(e => e.IdDostup);

            entity.ToTable("dostups");

            entity.Property(e => e.IdDostup).HasColumnName("id_dostup");
            entity.Property(e => e.DataTime)
                .HasColumnType("datetime")
                .HasColumnName("dataTime");
            entity.Property(e => e.IdEmployee).HasColumnName("id_employee");

            entity.HasOne(d => d.IdEmployeeNavigation).WithMany(p => p.Dostups)
                .HasForeignKey(d => d.IdEmployee)
                .HasConstraintName("FK_dostups_employes");
        });

        modelBuilder.Entity<Employe>(entity =>
        {
            entity.HasKey(e => e.IdEmployee);

            entity.ToTable("employes");

            entity.Property(e => e.IdEmployee).HasColumnName("id_employee");
            entity.Property(e => e.BanksRekv).HasColumnName("banks_rekv");
            entity.Property(e => e.DateOfBirth).HasColumnName("date_of_birth");
            entity.Property(e => e.HavingAFamily).HasColumnName("having_a_family");
            entity.Property(e => e.HealthStatus).HasColumnName("health_status");
            entity.Property(e => e.Pasport).HasColumnName("pasport");
        });

        modelBuilder.Entity<Manager>(entity =>
        {
            entity.HasKey(e => e.IdManager);

            entity.ToTable("managers");

            entity.Property(e => e.IdManager).HasColumnName("id_manager");
            entity.Property(e => e.IdEmployee).HasColumnName("id_employee");

            entity.HasOne(d => d.IdEmployeeNavigation).WithMany(p => p.Managers)
                .HasForeignKey(d => d.IdEmployee)
                .HasConstraintName("FK_managers_employes");
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.IdMaterial);

            entity.ToTable("materials");

            entity.Property(e => e.IdMaterial).HasColumnName("id_material");
            entity.Property(e => e.CountBox).HasColumnName("count_box");
            entity.Property(e => e.CountSklad).HasColumnName("count_sklad");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.HistoryCountMat).HasColumnName("history_count_mat");
            entity.Property(e => e.IdPostav).HasColumnName("id_postav");
            entity.Property(e => e.IdSklad).HasColumnName("id_sklad");
            entity.Property(e => e.IdTypeMat).HasColumnName("id_type_mat");
            entity.Property(e => e.MinCount).HasColumnName("min_count");
            entity.Property(e => e.Picture)
                .HasColumnType("image")
                .HasColumnName("picture");
            entity.Property(e => e.Price)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("price");
            entity.Property(e => e.TitleMat).HasColumnName("title_mat");
            entity.Property(e => e.Unit).HasColumnName("unit");

            entity.HasOne(d => d.IdPostavNavigation).WithMany(p => p.Materials)
                .HasForeignKey(d => d.IdPostav)
                .HasConstraintName("FK_materials_postavshiks");

            entity.HasOne(d => d.IdSkladNavigation).WithMany(p => p.Materials)
                .HasForeignKey(d => d.IdSklad)
                .HasConstraintName("FK_materials_sklads");

            entity.HasOne(d => d.IdTypeMatNavigation).WithMany(p => p.Materials)
                .HasForeignKey(d => d.IdTypeMat)
                .HasConstraintName("FK_materials_material_type");
        });

        modelBuilder.Entity<MaterialType>(entity =>
        {
            entity.HasKey(e => e.IdTypeMat);

            entity.ToTable("material_type");

            entity.Property(e => e.IdTypeMat).HasColumnName("id_type_mat");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.PercentBreak).HasColumnName("percent_break");
        });

        modelBuilder.Entity<Partner>(entity =>
        {
            entity.HasKey(e => e.IdPartners);

            entity.ToTable("partners");

            entity.Property(e => e.IdPartners).HasColumnName("id_partners");
            entity.Property(e => e.DirectorName).HasColumnName("Director_name");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.History).HasColumnName("history");
            entity.Property(e => e.IdManager).HasColumnName("id_manager");
            entity.Property(e => e.IdPartnerType).HasColumnName("id_partner_type");
            entity.Property(e => e.Inn).HasColumnName("INN");
            entity.Property(e => e.Logo)
                .HasColumnType("image")
                .HasColumnName("logo");
            entity.Property(e => e.NameCompany).HasColumnName("name_company");
            entity.Property(e => e.Phone).HasColumnName("phone");
            entity.Property(e => e.PlacesSales).HasColumnName("places_sales");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.UrAdress).HasColumnName("ur_adress");

            entity.HasOne(d => d.IdManagerNavigation).WithMany(p => p.Partners)
                .HasForeignKey(d => d.IdManager)
                .HasConstraintName("FK_partners_managers");

            entity.HasOne(d => d.IdPartnerTypeNavigation).WithMany(p => p.Partners)
                .HasForeignKey(d => d.IdPartnerType)
                .HasConstraintName("FK_partners_partner_type");
        });

        modelBuilder.Entity<PartnerType>(entity =>
        {
            entity.HasKey(e => e.IdPartnerType);

            entity.ToTable("partner_type");

            entity.Property(e => e.IdPartnerType).HasColumnName("id_partner_type");
            entity.Property(e => e.NamePartner)
                .HasMaxLength(50)
                .HasColumnName("name_partner");
        });

        modelBuilder.Entity<PostavType>(entity =>
        {
            entity.HasKey(e => e.IdPostavType);

            entity.ToTable("postav_type");

            entity.Property(e => e.IdPostavType).HasColumnName("id_postav_type");
        });

        modelBuilder.Entity<Postavshik>(entity =>
        {
            entity.HasKey(e => e.IdPostav);

            entity.ToTable("postavshiks");

            entity.Property(e => e.IdPostav).HasColumnName("id_postav");
            entity.Property(e => e.HistoryPostav).HasColumnName("history_postav");
            entity.Property(e => e.IdTypePostav).HasColumnName("id_type_postav");
            entity.Property(e => e.Inn).HasColumnName("INN");
            entity.Property(e => e.Title).HasColumnName("title");

            entity.HasOne(d => d.IdTypePostavNavigation).WithMany(p => p.Postavshiks)
                .HasForeignKey(d => d.IdTypePostav)
                .HasConstraintName("FK_postavshiks_postav_type");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.IdProduct);

            entity.ToTable("products");

            entity.Property(e => e.IdProduct).HasColumnName("id_product");
            entity.Property(e => e.Articul).HasColumnName("articul");
            entity.Property(e => e.CountPeople).HasColumnName("count_people");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.HistoryMinPrice).HasColumnName("history_min_price");
            entity.Property(e => e.IdMaterial).HasColumnName("id_material");
            entity.Property(e => e.IdProiz).HasColumnName("id_proiz");
            entity.Property(e => e.IdType).HasColumnName("id_type");
            entity.Property(e => e.License)
                .HasColumnType("image")
                .HasColumnName("license");
            entity.Property(e => e.MinPrice)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("min_price");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.NumberCesh).HasColumnName("number_cesh");
            entity.Property(e => e.NumberStandart).HasColumnName("number_standart");
            entity.Property(e => e.Picture)
                .HasColumnType("image")
                .HasColumnName("picture");
            entity.Property(e => e.Sebeprice)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("sebeprice");
            entity.Property(e => e.SizeBox).HasColumnName("size_box");
            entity.Property(e => e.Time)
                .HasColumnType("datetime")
                .HasColumnName("time");
            entity.Property(e => e.WeightBox).HasColumnName("weight_box");
            entity.Property(e => e.WeightNoBox).HasColumnName("weight_no_box");

            entity.HasOne(d => d.IdMaterialNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.IdMaterial)
                .HasConstraintName("FK_products_materials");

            entity.HasOne(d => d.IdProizNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.IdProiz)
                .HasConstraintName("FK_products_proizvodstvos");

            entity.HasOne(d => d.IdTypeNavigation).WithMany(p => p.Products)
                .HasForeignKey(d => d.IdType)
                .HasConstraintName("FK_products_Product_type");
        });

        modelBuilder.Entity<ProductType>(entity =>
        {
            entity.HasKey(e => e.IdType);

            entity.ToTable("Product_type");

            entity.Property(e => e.IdType).HasColumnName("id_type");
            entity.Property(e => e.KoefType)
                .HasColumnType("decimal(18, 2)")
                .HasColumnName("koef_type");
            entity.Property(e => e.NameType)
                .HasMaxLength(50)
                .HasColumnName("name_type");
        });

        modelBuilder.Entity<Proizvodstvo>(entity =>
        {
            entity.HasKey(e => e.IdProiz);

            entity.ToTable("proizvodstvos");

            entity.Property(e => e.IdProiz).HasColumnName("id_proiz");
            entity.Property(e => e.IdCadr).HasColumnName("id_cadr");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdCadrNavigation).WithMany(p => p.Proizvodstvos)
                .HasForeignKey(d => d.IdCadr)
                .HasConstraintName("FK_proizvodstvos_cadrs");
        });

        modelBuilder.Entity<Sklad>(entity =>
        {
            entity.HasKey(e => e.IdSklad);

            entity.ToTable("sklads");

            entity.Property(e => e.IdSklad).HasColumnName("id_sklad");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<ViewPartner>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("View_Partners");

            entity.Property(e => e.DirectorName).HasColumnName("Director_name");
            entity.Property(e => e.NameCompany).HasColumnName("name_company");
            entity.Property(e => e.NamePartner)
                .HasMaxLength(50)
                .HasColumnName("name_partner");
            entity.Property(e => e.Phone).HasColumnName("phone");
            entity.Property(e => e.Rating).HasColumnName("rating");
        });

        modelBuilder.Entity<Zayavka>(entity =>
        {
            entity.HasKey(e => e.IdZayavka);

            entity.ToTable("zayavka");

            entity.Property(e => e.IdZayavka).HasColumnName("id_zayavka");
            entity.Property(e => e.CountProducts).HasColumnName("count_products");
            entity.Property(e => e.Data).HasColumnName("data");
            entity.Property(e => e.IdPartners).HasColumnName("id_partners");
            entity.Property(e => e.IdProduct).HasColumnName("id_product");
            entity.Property(e => e.Percentage).HasComputedColumnSql("(case when [count_products]<(10000) then (0) when [count_products]<(50000) then (5) when [count_products]<(300000) then (10) else (15) end)", false);

            entity.HasOne(d => d.IdPartnersNavigation).WithMany(p => p.Zayavkas)
                .HasForeignKey(d => d.IdPartners)
                .HasConstraintName("FK_zayavka_partners");

            entity.HasOne(d => d.IdProductNavigation).WithMany(p => p.Zayavkas)
                .HasForeignKey(d => d.IdProduct)
                .HasConstraintName("FK_zayavka_products1");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
