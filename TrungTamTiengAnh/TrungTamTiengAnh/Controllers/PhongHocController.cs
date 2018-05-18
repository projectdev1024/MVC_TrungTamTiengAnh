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
    public class PhongHocController : Controller
    {
        public ActionResult QLPhongHoc(int? page, string search)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                PhongHocDao dao = new PhongHocDao();
                IQueryable<PhongHoc> ph = dao.DanhSachPH();
                ViewBag.SearchString = search;
                return View(ph.OrderBy(n => n.PhongHocID).ToPagedList(pageNumber, pageSize));
            }
        }
               public ActionResult SearchPH()
               {
                   return View();
               }
               public ActionResult Search(FormCollection fc)
               {
                   PhongHocDao dao = new PhongHocDao();
                   IQueryable<PhongHoc> ph;

                   string com = fc["searchString"];
                  ph = dao.SearchPH(com);
                   if (ph != null)
                       return PartialView("SearchPH", ph);
                   else
                       return PartialView("Null", "PhongHoc");


               }
              public ActionResult ThemPhongHoc()
               {
                   return View();
               }
               public ActionResult AddRoo(PhongHoc pha)
               {
                   PhongHocDao dao = new PhongHocDao();
                   dao.ThemPhongHoc(pha);
                   return RedirectToAction("QLPhongHoc");
               }
               public ActionResult SuaPhongHoc(int id)
               {
                   PhongHocDao dao = new PhongHocDao();
                   PhongHoc ph = dao.FindPHrById(id);
                   return View(ph);
               }
               public ActionResult EditActionTea(PhongHoc phu)
               {
                   PhongHocDao dao = new PhongHocDao();
                   dao.SuaPhongHoc(phu);
                   return RedirectToAction("QLPhongHoc");
               }
               public ActionResult XoaPhongHoc(int id)
               {
                   PhongHocDao dao = new PhongHocDao();
                   dao.XoaPhongHoc(id);
                   return RedirectToAction("QLPhongHoc");
               }
    }
}