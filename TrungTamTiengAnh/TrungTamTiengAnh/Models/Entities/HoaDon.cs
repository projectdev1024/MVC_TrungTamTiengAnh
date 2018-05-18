namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        public int HoaDonID { get; set; }

        public int HocSinhID { get; set; }

        public int? NhanVienID { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayHoaDon { get; set; }

        public int? TinhTrang { get; set; }

        [Column(TypeName = "money")]
        public decimal? SoTien { get; set; }

        public int? KhoaHocID { get; set; }

        public virtual HocSinh HocSinh { get; set; }

        public virtual KhoaHoc KhoaHoc { get; set; }
    }
}
