namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LopHoc")]
    public partial class LopHoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LopHoc()
        {
            Hocs = new HashSet<Hoc>();
        }

        public int LopHocID { get; set; }

        public int? GiaoVienID { get; set; }

        public int? PhongHocID { get; set; }

        [StringLength(50)]
        public string TenLopHoc { get; set; }

        public int? SoLuongHS { get; set; }

        [Column(TypeName = "date")]
        public DateTime? LichThi { get; set; }

        public int? TrangThai { get; set; }

        public int? KhoaHocID { get; set; }

        public virtual GiaoVien GiaoVien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Hoc> Hocs { get; set; }

        public virtual KhoaHoc KhoaHoc { get; set; }

        public virtual PhongHoc PhongHoc { get; set; }
    }
}
