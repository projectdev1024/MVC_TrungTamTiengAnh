namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Hoc")]
    public partial class Hoc
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int LopHocID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int HocSinhID { get; set; }

        public int? NgayNghi { get; set; }

        public double? Diem { get; set; }

        [StringLength(10)]
        public string XepLoai { get; set; }

        public virtual HocSinh HocSinh { get; set; }

        //public virtual TaiKhoan TaiKhoan { get; set; }
        public virtual LopHoc LopHoc { get; set; }
    }
}
