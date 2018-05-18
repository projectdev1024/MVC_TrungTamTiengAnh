using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DAO;
using PagedList;

namespace TrungTamTiengAnh.Controllers
{
    public class DoTuoiController : Controller
    {
        public ActionResult QLDoTuoi(int? page, string search)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                DoTuoiDao dao = new DoTuoiDao();
                IQueryable<DoTuoi> dt = dao.DanhSachDT();
                ViewBag.SearchString = search;
                return View(dt.OrderBy(n => n.DoTuoiID).ToPagedList(pageNumber, pageSize));
            }
        }
        public ActionResult SearchDT()
        {
            return View();
        }
        public ActionResult Search(FormCollection fc)
        {
            DoTuoiDao dao = new DoTuoiDao();
            IQueryable<DoTuoi> dt;

            string com = fc["searchString"];
            dt = dao.SearchDT(com);
            if (dt != null)
                return PartialView("SearchDT", dt);
            else
                return PartialView("Null", "DoTuoi");


        }
        public ActionResult ThemDoTuoi()
        {
            return View();
        }
        public ActionResult AddAge(DoTuoi dta)
        {
            DoTuoiDao dao = new DoTuoiDao();
            dao.ThemDoTuoi(dta);
            return RedirectToAction("QLDoTuoi");
        }
        public ActionResult SuaDoTuoi(int id)
        {
            DoTuoiDao dao = new DoTuoiDao();
            DoTuoi dt = dao.FindDTById(id);
            return View(dt);
        }
        public ActionResult EditActionTea(DoTuoi dtu)
        {
            DoTuoiDao dao = new DoTuoiDao();
            dao.SuaDoTuoi(dtu);
            return RedirectToAction("QLDoTuoi");
        }
        public ActionResult XoaDoTuoi(int id)
        {
            DoTuoiDao dao = new DoTuoiDao();
            dao.XoaDoTuoi(id);
            return RedirectToAction("QLDoTuoi");
        }
    }
}