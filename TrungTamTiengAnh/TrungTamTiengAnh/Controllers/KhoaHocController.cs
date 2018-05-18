using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DAO;
using TrungTamTiengAnh.Models.DTO;

namespace TrungTamTiengAnh.Controllers
{
    public class KhoaHocController : Controller
    {
        // GET: KhoaHoc
        
        public ActionResult QlKhoaHoc()
        {
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                KhoaHocDao kh = new KhoaHocDao();
                IQueryable<KhoaHoc> khh = kh.DSKhoaHoc();

                return View(khh);
            }
        }
        
        public ActionResult ThemKhoaHoc()
        {
            return View();
        }
        public ActionResult AddCourse(KhoaHoc kh)
        {
            KhoaHocDao khh = new KhoaHocDao();
            khh.ThemKhoaHoc(kh);
            return RedirectToAction("QLKhoaHoc");
        }
      
        public ActionResult SuaKhoaHoc(int id)
        {
            KhoaHocDao dao = new KhoaHocDao();
            KhoaHoc kh = dao.FindCourseById(id);
            return View(kh);
        }
        public ActionResult EditActionCourse(KhoaHoc hsu)
        {
            KhoaHocDao dao = new KhoaHocDao();
            dao.SuaKhoaHoc(hsu);
            return RedirectToAction("QLKhoaHoc");
        }
        public ActionResult XoaKhoaHoc(int id)
        {
            KhoaHocDao dao = new KhoaHocDao();
            KhoaHoc kh = dao.FindCourseById(id);
            dao.XoaKhoaHoc(kh);
            return RedirectToAction("QLKhoaHoc");
        }
    }
}