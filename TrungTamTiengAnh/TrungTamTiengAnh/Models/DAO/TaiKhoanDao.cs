using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;
using PagedList;

namespace TrungTamTiengAnh.Models.DAO
{
    public class TaiKhoanDao
    {
        MyModel md;
        public TaiKhoanDao()
        {
            md = new MyModel();
        }
        public IQueryable<TaiKhoan> DanhSachTK()
        {
            var rs = (from tk in md.TaiKhoans
                      where tk.UserName != null
                      select tk);
            return rs;
        }
        public int ThemTaiKhoan(TaiKhoan tka)
        {
            TaiKhoan tk = new TaiKhoan();
            tk.UserName = tka.UserName;
            tk.PassWord = tka.PassWord;

            md.TaiKhoans.Add(tk);
            md.SaveChanges();
            return tk.TaiKhoanID;
        }
        public void SuaTaiKhoan(TaiKhoan tku)
        {
            TaiKhoan tk = md.TaiKhoans.Find(tku.TaiKhoanID);
            if (tk != null)
            {
                tk.UserName = tku.UserName;
                tk.PassWord = tku.PassWord;

                md.SaveChanges();
            }
        }

        public void XoaTaiKhoan(int id)
        {
            TaiKhoan tk = md.TaiKhoans.Find(id);
            if (tk != null)
            {
                tk.UserName = null;
                md.SaveChanges();
            }
        }

        public TaiKhoan FindTKById(int id)
        {
            return md.TaiKhoans.Find(id);
        }
        public IEnumerable<TaiKhoan> ListAllPaging(string searchString, int page, int pagesize)
        {
            IQueryable<TaiKhoan> model = md.TaiKhoans;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.TaiKhoanID).ToPagedList(page, pagesize);
        }
        public IQueryable<TaiKhoan> SearchTK(string com)
        {
            var rs = (from tk in md.TaiKhoans
                      where tk.UserName.Contains(com)
                      select tk);
            return rs;


        }
    }
}