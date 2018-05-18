using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrungTamTiengAnh.Models.DTO
{
    public class KhoaHocDTO
    {
        public int KhoaHocID { get; set; }

        public int? DoTuoiID { get; set; }

        public string TenKhoaHoc { get; set; }
        
        public DateTime? NgayBatDau { get; set; }
        
        public DateTime? NgayKetThuc { get; set; }

        public string ThoiLuongKhoaHoc { get; set; }

        public string MoTa { get; set; }

        public string HinhAnh { get; set; }

        public int? SoLuongHS { get; set; }
        
        public decimal? HocPhi { get; set; }

        public string KhoangDoTuoi { get; set; }
    }
}