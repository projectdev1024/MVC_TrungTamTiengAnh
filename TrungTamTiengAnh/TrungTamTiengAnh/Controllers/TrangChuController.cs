using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DAO;
using TrungTamTiengAnh.Models;
using PagedList;
using TrungTamTiengAnh.Models.DTO;

namespace TrungTamTiengAnh.Controllers
{
    public class TrangChuController : Controller
    {
        public ActionResult TrangChu(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            KhoaHocDao dao = new KhoaHocDao();
            IQueryable<KhoaHoc> kh = dao.DSKhoaHoc();
            return View(kh.OrderBy(n => n.KhoaHocID).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult DangKiHoc()
        {
            return View();
        }
        public ActionResult DangKi(HocSinhDTO hsa)
        {
            HocSinhDAO dao = new HocSinhDAO();
            dao.ThemHocSinh(hsa);
            return RedirectToAction("TrangChu");
        }
        public ActionResult DoTuoi(long cateId)
        {
            var dotuoi = new DoTuoiDao().viewDetail(cateId);
            return View(dotuoi);
        }
        public ActionResult Detail(int id)
        {
            var product = new KhoaHocDao().ViewDetail(id);
            ViewBag.DoTuoi = new DoTuoiDao().viewDetail(product.DoTuoiID.Value);
            ViewBag.KhoaHoc = new KhoaHocDao().ListRelateKhoaHoc(id);
            return View(product);
        }

        
       

    }
}