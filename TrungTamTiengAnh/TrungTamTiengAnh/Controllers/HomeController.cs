using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.DAO;
using TrungTamTiengAnh.Models.DTO;
using TrungTamTiengAnh.Models.Entities;

namespace TrungTamTiengAnh.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var khoahocDao = new KhoaHocDao();
            IQueryable<KhoaHoc> ttt = khoahocDao.DSKhoaHoc();
            return PartialView(ttt);

        }

        public ActionResult MenuKhoaHoc()
        {
            return View(new KhoaHocDao().DSKhoaHoc());
        }

        public ActionResult ParView()
        {
            var khoahocDao = new KhoaHocDao();
            IQueryable<KhoaHoc> ttt = khoahocDao.DSKhoaHoc();
            return PartialView(ttt);
        }
        public ActionResult HocThuView()
        {
            return View();
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult _6LyDo()
        {
            return View();
        }
        public ActionResult CauHoiThuongGap()
        {
            return View();
        }
        public ActionResult KienThuc()
        {
            return View();
        }
        public ActionResult KienThuc1()
        {
            return View();
        }
        public ActionResult KienThuc2()
        {
            return View();
        }
        public ActionResult KienThuc3()
        {
            return View();
        }
        public ActionResult LichKhaiGiang()
        {
            return View();
        }
        public ActionResult LichKhaiGiang1()
        {
            return View();
        }
        public ActionResult LichKhaiGiang2()
        {
            return View();
        }
        public ActionResult LichKhaiGiang3()
        {
            return View();
        }
        public ActionResult LienHe()
        {
            return View();
        }
        public ActionResult TuyenDung()
        {
            return View();
        }
        public ActionResult Dangki()
        {
            SetViewBag();
            return PartialView();
        }
        public void SetViewBag(int id = 0)
        {
            var KHdao = new KhoaHocDao();
            ViewBag.KhoaHocID = new SelectList(KHdao.DSKhoaHoc(), "KhoaHocID", "TenKhoaHoc");
        }
        public ActionResult AddStd(HocSinhDTO hsa)
        {
            HocSinhDAO dao = new HocSinhDAO();
            dao.ThemHocSinh(hsa);
            SetViewBag();
            return RedirectToAction("Index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult DetailKhoaHoc(int ID)
        {
            KhoaHocDao khh = new KhoaHocDao();
            KhoaHoc kh = khh.ViewDetail(ID);
            return View(kh);
        }

    }
}