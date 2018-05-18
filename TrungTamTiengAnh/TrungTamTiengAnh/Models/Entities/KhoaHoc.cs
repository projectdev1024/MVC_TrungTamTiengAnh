namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;


    [Table("KhoaHoc")]
    public partial class KhoaHoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhoaHoc()
        {
            HoaDons = new HashSet<HoaDon>();
            TaiKhoans = new HashSet<TaiKhoan>();
        }

        public int KhoaHocID { get; set; }

        public int? DoTuoiID { get; set; }

        public string TenKhoaHoc { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayBatDau { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayKetThuc { get; set; }

        public string ThoiLuongKhoaHoc { get; set; }
    
        public string MoTa { get; set; }

        public string HinhAnh { get; set; }

        public int? SoLuongHS { get; set; }

        [Column(TypeName = "money")]
        public decimal? HocPhi { get; set; }

        public int? TrangThai { get; set; }

        public string ChiTiet { get; set; }

        public int? GiaoVienID { get; set; }

        public virtual DoTuoi DoTuoi { get; set; }

        public virtual GiaoVien GiaoVien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TaiKhoan> TaiKhoans { get; set; }
    }
}
