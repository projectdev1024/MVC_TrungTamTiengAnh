using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class GiaoVienDao
    {
        MyModel md;
        public GiaoVienDao()
        {
            md = new MyModel();
        }
        public IQueryable<GiaoVien> DanhSachGV()
        {
            var rs = (from gv in md.GiaoViens
                      where gv.TrangThai == 1
                      select gv);
            return rs;
        }
        public int ThemGiaoVien(GiaoVien gva)
        {
            GiaoVien gv = new GiaoVien();
            gv.TenGiaoVien = gva.TenGiaoVien;
            gv.NgaySinh = gva.NgaySinh;
            gv.GioiTinh = gva.GioiTinh;
            gv.DiaChi = gva.DiaChi;
            gv.SDT = gva.SDT;
            gv.Luong = gva.Luong;
            gv.TrangThai = 1;
            md.GiaoViens.Add(gv);
            md.SaveChanges();
            return gv.GiaoVienID;
        }
        public void SuaGiaoVien(GiaoVien gvu)
        {
            GiaoVien gv = md.GiaoViens.Find(gvu.GiaoVienID);
            if(gv != null)
            {
                gv.TenGiaoVien = gvu.TenGiaoVien;
                gv.NgaySinh = gvu.NgaySinh;
                gv.GioiTinh = gvu.GioiTinh;
                gv.DiaChi = gvu.DiaChi;
                gv.SDT = gvu.SDT;
                gv.Luong = gvu.Luong;
                gv.TrangThai = gvu.TrangThai;
                md.SaveChanges();
            }
        }

        public void XoaGiaoVien(int id)
        {
            GiaoVien gv = md.GiaoViens.Find(id);
            if(gv != null)
            {
                gv.TrangThai = 0;
                md.SaveChanges();
            }
        }

        public GiaoVien FindTeacherById(int id)
        {
            return md.GiaoViens.Find(id);
        }
        public IEnumerable<GiaoVien> ListAllPaging(string searchString, int page, int pagesize)
        {
            IQueryable<GiaoVien> model = md.GiaoViens;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenGiaoVien.Contains(searchString));
            }
            return model.OrderByDescending(x => x.GiaoVienID).ToPagedList(page, pagesize);
        }
        public IQueryable<GiaoVien> SearchTeacher(string com)
        {
            var rs = (from gv in md.GiaoViens
                      where gv.TenGiaoVien.Contains(com)
                      select gv);
            return rs;


        }
    }
}