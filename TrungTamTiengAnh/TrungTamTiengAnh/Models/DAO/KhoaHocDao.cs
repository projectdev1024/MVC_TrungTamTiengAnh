using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DTO;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class KhoaHocDao
    {
        MyModel md;
        public KhoaHocDao()
        {
            md = new MyModel();
        }
        public IQueryable<KhoaHoc> DSKhoaHoc()
        {
            var rs = (from kh in md.KhoaHocs
                      where kh.HinhAnh != null
                      select kh);
            return rs;
        }
        public int ThemKhoaHoc(KhoaHoc kh)
        {
            KhoaHoc khh = new KhoaHoc();
            khh.TenKhoaHoc = kh.TenKhoaHoc;
            khh.NgayBatDau = kh.NgayBatDau;
            khh.NgayKetThuc = kh.NgayKetThuc;
            khh.SoLuongHS = kh.SoLuongHS;
            khh.ThoiLuongKhoaHoc = kh.ThoiLuongKhoaHoc;
            khh.MoTa = kh.MoTa;
            khh.HinhAnh = kh.HinhAnh;
            khh.HocPhi = kh.HocPhi;
            khh.TrangThai = 1;
            khh.DoTuoiID = kh.DoTuoiID;
            md.KhoaHocs.Add(khh);
            md.SaveChanges();
            return khh.KhoaHocID;
        }
        public void SuaKhoaHoc(KhoaHoc khs)
        {
            KhoaHoc kh = md.KhoaHocs.Find(khs.KhoaHocID);
            if (kh != null)
            {
                kh.TenKhoaHoc = khs.TenKhoaHoc;
                kh.NgayBatDau = khs.NgayBatDau;
                kh.NgayKetThuc = khs.NgayKetThuc;
                kh.SoLuongHS = khs.SoLuongHS;
                kh.ThoiLuongKhoaHoc = khs.ThoiLuongKhoaHoc;
                kh.MoTa = khs.MoTa;
                kh.HinhAnh = khs.HinhAnh;
                kh.HocPhi = khs.HocPhi;
                kh.DoTuoiID = khs.DoTuoiID;
                md.SaveChanges();
            }
        }
        public void XoaKhoaHoc(KhoaHoc khd)
        {
            KhoaHoc kh = md.KhoaHocs.Find(khd.KhoaHocID);
            if (kh != null)
            {
                kh.TrangThai = 0;
                md.SaveChanges();
            }
        }
        public KhoaHoc FindCourseById(int id)
        {
            return md.KhoaHocs.Find(id);
        }
        public IEnumerable<KhoaHoc> ListAllPaging(string searchString, int page, int pagesize)
        {
            IQueryable<KhoaHoc> model = md.KhoaHocs;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenKhoaHoc.Contains(searchString));
            }
            return model.OrderByDescending(x => x.KhoaHocID).ToPagedList(page, pagesize);
        }
        public KhoaHoc GetById(string userName)
        {
            return md.KhoaHocs.SingleOrDefault(x => x.TenKhoaHoc == userName);
        }
        public KhoaHoc ViewDetail(int id)
        {
            return md.KhoaHocs.Find(id);
        }
        public List<KhoaHoc> ListNewProduct(int top)
        {
            return md.KhoaHocs.OrderByDescending(x => x.NgayBatDau).Take(top).ToList();
        }
        //public List<KhoaHoc> ListFeatureProduct(int top)
        //{
        //    return db.KhoaHocs.Where(x => x.TopHot != null).OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        //}

        public List<KhoaHoc> ListRelateKhoaHoc(long khoahocID)
        {
            var khoahoc = md.KhoaHocs.Find(khoahocID);
            return md.KhoaHocs.OrderByDescending(x => x.KhoaHocID != khoahocID && x.DoTuoiID == khoahoc.DoTuoiID).ToList();
        }
    }
}