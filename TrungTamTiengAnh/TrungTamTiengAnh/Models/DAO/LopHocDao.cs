using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;

namespace TrungTamTiengAnh.Models.DAO
{
    public class LopHocDao
    {
        MyModel md;
        public LopHocDao()
        {
            md = new MyModel();
        }
        public IQueryable<LopHoc> DSLopHoc()
        {
            var rs = (from lh in md.LopHocs
                      where lh.TrangThai == 1
                      select lh);
            return rs;
        }
        public void ThemLopHoc(LopHoc lh)
        {
            LopHoc loh = new LopHoc();
            loh.KhoaHocID = lh.KhoaHocID;
            loh.GiaoVienID = lh.GiaoVienID;
            loh.PhongHocID = lh.PhongHocID;
            loh.TenLopHoc = lh.TenLopHoc;
            loh.SoLuongHS = lh.SoLuongHS;
            loh.LichThi = lh.LichThi;
            loh.TrangThai = 1;
            md.LopHocs.Add(loh);
            md.SaveChanges();
        }
        public void SuaLopHoc(LopHoc lh)
        {
            LopHoc loh = md.LopHocs.Find(lh.LopHocID);
            if (loh != null)
            {
                loh.PhongHocID = lh.PhongHocID;
                loh.KhoaHocID = lh.KhoaHocID;
                loh.GiaoVienID = lh.GiaoVienID;
                loh.PhongHocID = lh.PhongHocID;
                loh.TenLopHoc = lh.TenLopHoc;
                loh.SoLuongHS = lh.SoLuongHS;
                loh.LichThi = lh.LichThi;
                md.SaveChanges();
            }
        }
        public void XoaLopHoc(LopHoc lhd)
        {
            LopHoc kh = md.LopHocs.Find(lhd.LopHocID);
            if (kh != null)
            {
                kh.TrangThai = 0;
                md.SaveChanges();
            }
        }
        public LopHoc FindClassbyID(int id)
        {
            return md.LopHocs.Find(id);
        }

    }
}