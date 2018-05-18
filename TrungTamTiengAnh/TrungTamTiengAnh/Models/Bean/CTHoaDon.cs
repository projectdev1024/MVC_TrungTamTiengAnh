using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TrungTamTiengAnh.Models.Bean
{
    public class CTHoaDon
    {
        public int HocSinhID { get; set; }

        public string TenHocSinh { get; set; }
        
        public DateTime? NgaySinh { get; set; }
        
        public string GioiTinh { get; set; }

        public string PhuHuynh { get; set; }
        
        public string DiaChi { get; set; }
        
        public string SDT { get; set; }

        public int? TrangThai { get; set; }
        public int? DoTuoiID { get; set; }

        public string TenKhoaHoc { get; set; }
        
        public DateTime? NgayBatDau { get; set; }
        
        public DateTime? NgayKetThuc { get; set; }

        public string ThoiLuongKhoaHoc { get; set; }

        public string MoTa { get; set; }

        public string HinhAnh { get; set; }

        public int? SoLuongHS { get; set; }
        
        public decimal? HocPhi { get; set; }
        public int? NhanVienID { get; set; }
        
        public DateTime? NgayHoaDon { get; set; }

        public int? TinhTrang { get; set; }
        
        public decimal? SoTien { get; set; }
    }
}