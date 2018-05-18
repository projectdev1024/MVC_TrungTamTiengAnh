namespace TrungTamTiengAnh.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DoTuoi")]
    public partial class DoTuoi
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DoTuoi()
        {
            KhoaHocs = new HashSet<KhoaHoc>();
        }

        public int DoTuoiID { get; set; }

        public string KhoangDoTuoi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhoaHoc> KhoaHocs { get; set; }
    }
}
