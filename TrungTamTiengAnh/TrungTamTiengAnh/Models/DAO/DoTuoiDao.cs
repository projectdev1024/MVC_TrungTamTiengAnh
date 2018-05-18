using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class DoTuoiDao
    {
        MyModel db = null;
        public DoTuoiDao()
        {
            db = new MyModel();
        }
        /*public List<DoTuoi> ListAll()
        {
           return db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }
        linkq
        */
        public IQueryable<string> GetNameProductCategory()
        {
            var res = (from s in db.DoTuois select s.KhoangDoTuoi);
            return res;
        }
        public DoTuoi viewDetail(long id)
        {
            return db.DoTuois.Find(id);
        }

        public IQueryable<DoTuoi> DanhSachDT()
        {
            var rs = (from ph in db.DoTuois
                      where ph.KhoangDoTuoi != null
                      select ph);
            return rs;
        }

        public int ThemDoTuoi(DoTuoi dta)
        {
            DoTuoi dt = new DoTuoi();
            dt.KhoangDoTuoi = dta.KhoangDoTuoi;
            

            db.DoTuois.Add(dt);
            db.SaveChanges();
            return dt.DoTuoiID;
        }
        public void SuaDoTuoi(DoTuoi dtu)
        {
            DoTuoi dt = db.DoTuois.Find(dtu.DoTuoiID);
            if (dt != null)
            {
                dt.KhoangDoTuoi = dtu.KhoangDoTuoi;
              

                db.SaveChanges();
            }
        }

        public void XoaDoTuoi(int id)
        {
            DoTuoi dt = db.DoTuois.Find(id);
            if (dt != null)
            {
                dt.KhoangDoTuoi = null;
                db.SaveChanges();
            }
        }

        public DoTuoi FindDTById(int id)
        {
            return db.DoTuois.Find(id);
        }
        public IEnumerable<DoTuoi> ListAllPaging(string searchString, int page, int pagesize)
        {
            IQueryable<DoTuoi> model = db.DoTuois;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.KhoangDoTuoi.Contains(searchString));
            }
            return model.OrderByDescending(x => x.DoTuoiID).ToPagedList(page, pagesize);
        }

        public IQueryable<DoTuoi> SearchDT(string com)
        {
            var rs = (from ph in db.DoTuois
                      where ph.KhoangDoTuoi.Contains(com)
                      select ph);
            return rs;


        }

    }
}