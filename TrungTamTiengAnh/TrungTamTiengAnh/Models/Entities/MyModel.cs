namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyModel : DbContext
    {
        public MyModel()
            : base("name=MyModel2")
        {
        }

        public virtual DbSet<DoTuoi> DoTuois { get; set; }
        public virtual DbSet<GiaoVien> GiaoViens { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<Hoc> Hocs { get; set; }
        public virtual DbSet<HocSinh> HocSinhs { get; set; }
        public virtual DbSet<KhoaHoc> KhoaHocs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<PhongHoc> PhongHocs { get; set; }
        public virtual DbSet<LopHoc> LopHocs { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<TinTuc> TinTucs { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<GiaoVien>()
                .Property(e => e.GioiTinh)
                .IsFixedLength();

            modelBuilder.Entity<GiaoVien>()
                .Property(e => e.SDT)
                .HasPrecision(18, 0);

            modelBuilder.Entity<GiaoVien>()
                .Property(e => e.Luong)
                .HasPrecision(19, 4);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.SoTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Hoc>()
                .Property(e => e.XepLoai)
                .IsFixedLength();

            modelBuilder.Entity<HocSinh>()
                .Property(e => e.GioiTinh)
                .IsFixedLength();

            modelBuilder.Entity<HocSinh>()
                .Property(e => e.SDT)
                .IsFixedLength();

            modelBuilder.Entity<HocSinh>()
                .HasMany(e => e.HoaDons)
                .WithRequired(e => e.HocSinh)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HocSinh>()
                .HasMany(e => e.Hocs)
                .WithRequired(e => e.HocSinh)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KhoaHoc>()
                .Property(e => e.HocPhi)
                .HasPrecision(19, 4);

            modelBuilder.Entity<LopHoc>()
                .HasMany(e => e.Hocs)
                .WithRequired(e => e.LopHoc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.GioiTinh)
                .IsFixedLength();

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SDT)
                .HasPrecision(18, 0);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.Luong)
                .HasPrecision(19, 4);
        }
    }
}
