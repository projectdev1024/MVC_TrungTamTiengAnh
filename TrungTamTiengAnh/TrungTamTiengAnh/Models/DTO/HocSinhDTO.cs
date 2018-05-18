using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrungTamTiengAnh.Models.DTO
{
    public class HocSinhDTO
    {
        public int HocSinhID { get; set; }

        public string TenHocSinh { get; set; }
        
        public DateTime? NgaySinh { get; set; }
        
        public string GioiTinh { get; set; }

        public string PhuHuynh { get; set; }
        
        public string DiaChi { get; set; }
        
        public string SDT { get; set; }

        public int? TrangThai { get; set; }

        public int? KhoaHocID { get; set; }
    }
}