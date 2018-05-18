namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhanVien")]
    public partial class NhanVien
    {
        public int NhanVienID { get; set; }

        public string TenNhanVien { get; set; }

        public string ChucVu { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        [StringLength(10)]
        public string GioiTinh { get; set; }

        [StringLength(50)]
        public string DiaChi { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? SDT { get; set; }

        [Column(TypeName = "money")]
        public decimal? Luong { get; set; }
    }
}
