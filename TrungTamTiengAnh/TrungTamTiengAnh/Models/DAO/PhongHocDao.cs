using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class PhongHocDao
    {
        MyModel md;
        public PhongHocDao()
        {
            md = new MyModel();
        }
        public IQueryable<PhongHoc> DanhSachPH()
        {
            var rs = (from ph in md.PhongHocs
                      where ph.TenPhongHoc != null
                      select ph);
            return rs;
        }
       public int ThemPhongHoc(PhongHoc pha)
        {
            PhongHoc ph = new PhongHoc();
            ph.TenPhongHoc = pha.TenPhongHoc;
            ph.TrangThietBi = pha.TrangThietBi;
            
            md.PhongHocs.Add(ph);
            md.SaveChanges();
            return ph.PhongHocID;
        }
        public void SuaPhongHoc(PhongHoc phu)
        {
            PhongHoc ph = md.PhongHocs.Find(phu.PhongHocID);
            if (ph != null)
            {
                ph.TenPhongHoc = phu.TenPhongHoc;
                ph.TrangThietBi = phu.TrangThietBi;
                
                md.SaveChanges();
            }
        }

        public void XoaPhongHoc(int id)
        {
            PhongHoc ph = md.PhongHocs.Find(id);
            if (ph != null)
            {
                ph.TenPhongHoc = null;
                md.SaveChanges();
            }
        }
       
        public PhongHoc FindPHrById(int id)
        {
            return md.PhongHocs.Find(id);
        } 
        public IEnumerable<PhongHoc> ListAllPaging(string searchString, int page, int pagesize)
        {
            IQueryable<PhongHoc> model = md.PhongHocs;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenPhongHoc.Contains(searchString));
            }
            return model.OrderByDescending(x => x.PhongHocID).ToPagedList(page, pagesize);
        }
        public IQueryable<PhongHoc> SearchPH(string com)
        {
            var rs = (from ph in md.PhongHocs
                      where ph.TenPhongHoc.Contains(com)
                      select ph);
            return rs;


        }
    }
}