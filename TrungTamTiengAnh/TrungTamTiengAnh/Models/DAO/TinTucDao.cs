using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class TinTucDao
    {
        MyModel md;
        public TinTucDao()
        {
            md = new MyModel();
        }
        public IQueryable<TinTuc> DanhSachTT()
        {
            var rs = (from tt in md.TinTucs
                      where tt.NoiDung != null
                      select tt);
            return rs;
        }
        public int ThemTinTuc(TinTuc tta)
        {
            TinTuc tt = new TinTuc();
            tt.NoiDung = tta.NoiDung;
            tt.HinhAnh = tta.HinhAnh;

            md.TinTucs.Add(tt);
            md.SaveChanges();
            return tt.TinTucID;
        }
        public void SuaTinTuc(TinTuc ttu)
        {
            TinTuc tt = md.TinTucs.Find(ttu.TinTucID);
            if (tt != null)
            {
                tt.NoiDung = ttu.NoiDung;
                tt.HinhAnh = ttu.HinhAnh;

                md.SaveChanges();
            }
        }

        public void XoaTinTuc(int id)
        {
            TinTuc tt = md.TinTucs.Find(id);
            if (tt != null)
            {
                tt.NoiDung = null;
                md.SaveChanges();
            }
        }

        public TinTuc FindTTById(int id)
        {
            return md.TinTucs.Find(id);
        }
        public IEnumerable<TinTuc> ListAllPaging(string searchString, int page, int pagesize)
        {
            IQueryable<TinTuc> model = md.TinTucs;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.NoiDung.Contains(searchString));
            }
            return model.OrderByDescending(x => x.TinTucID).ToPagedList(page, pagesize);
        }
        public IQueryable<TinTuc> SearchTT(string com)
        {
            var rs = (from tt in md.TinTucs
                      where tt.NoiDung.Contains(com)
                      select tt);
            return rs;


        }
    }
}