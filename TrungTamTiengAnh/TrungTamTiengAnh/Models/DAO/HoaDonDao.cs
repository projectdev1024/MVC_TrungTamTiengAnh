using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TrungTamTiengAnh.Models.Entities;

namespace TrungTamTiengAnh.Models.DAO
{
    public class HoaDonDao
    {
        MyModel md;
        public HoaDonDao()
        {
            md = new MyModel();
        }
        public IQueryable<HoaDon> HoaDonHS(int id)
        {
            var rs = (from hd in md.HoaDons
                      where hd.HocSinhID == id
                      select hd);
            return rs;
        }
    }
}