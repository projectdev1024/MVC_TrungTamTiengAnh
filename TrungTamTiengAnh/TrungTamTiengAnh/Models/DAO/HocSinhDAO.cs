using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DTO;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class HocSinhDAO
    {
        MyModel md;
        public HocSinhDAO()
        {
            md = new MyModel();
        }
        public IQueryable<HocSinh> DanhSachHS()
        {
            var rs = (from hs in md.HocSinhs
                      where hs.TrangThai == 1
                      select hs);
            return rs; 
        }
        public int ThemHocSinh(HocSinhDTO hsa)
        {
            HocSinh hs = new HocSinh();
            Hoc h = new Hoc();
            LopHoc rs = (from lh in md.LopHocs
                         where lh.KhoaHocID == hsa.KhoaHocID
                         select lh).ToList().ElementAt(0);
            int a = rs.LopHocID;
            hs.HocSinhID = hsa.HocSinhID;
            hs.TenHocSinh = hsa.TenHocSinh;
            hs.NgaySinh = hsa.NgaySinh;
            hs.GioiTinh = hsa.GioiTinh;
            hs.DiaChi = hsa.DiaChi;
            hs.PhuHuynh = hsa.PhuHuynh;
            hs.SDT = hsa.SDT;
            hs.TrangThai = 1;
            h.LopHocID = a;
            h.HocSinhID = hsa.HocSinhID;
            md.HocSinhs.Add(hs);
            md.Hocs.Add(h);
            md.SaveChanges();

            return hs.HocSinhID;
        }
        public int SuaHocSinh(HocSinh hsu)
        {
            HocSinh hs = md.HocSinhs.Find(hsu.HocSinhID);
            if (hs != null)
            {
                hs.TenHocSinh = hsu.TenHocSinh;
                hs.NgaySinh = hsu.NgaySinh;
                hs.GioiTinh = hsu.GioiTinh;
                hs.DiaChi = hsu.DiaChi;
                hs.PhuHuynh = hsu.PhuHuynh;
                hs.SDT = hsu.SDT;
                hs.TrangThai = hsu.TrangThai;
                md.SaveChanges();
            }
            return hs.HocSinhID;
        }
        public void XoaHocSinh(HocSinh hsdel)
        {
            HocSinh hs = md.HocSinhs.Find(hsdel.HocSinhID);
            if (hs != null)
            {
                hs.TrangThai = 0;
                md.SaveChanges();
            }
        }
        public HocSinh FindStudentById(int id)
        {
            return md.HocSinhs.Find(id);
        }
        public IQueryable<HocSinh> SearchStudent(string com)
        {
                var rs = (from hs in md.HocSinhs
                          where hs.TenHocSinh.Contains(com)
                          select hs);
                return rs;
            

        }
    }
}