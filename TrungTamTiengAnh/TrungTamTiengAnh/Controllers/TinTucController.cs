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
    public class TinTucController : Controller
    {
        public ActionResult QLTinTuc(int? page, string search)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                TinTucDao dao = new TinTucDao();
                IQueryable<TinTuc> tt = dao.DanhSachTT();
                ViewBag.SearchString = search;
                return View(tt.OrderBy(n => n.TinTucID).ToPagedList(pageNumber, pageSize));
            }
        }
        public ActionResult SearchTT()
        {
            return View();
        }
        public ActionResult Search(FormCollection fc)
        {
            TinTucDao dao = new TinTucDao();
            IQueryable<TinTuc> tt;

            string com = fc["searchString"];
            tt = dao.SearchTT(com);
            if (tt != null)
                return PartialView("Searchtt", tt);
            else
                return PartialView("Null", "TinTuc");


        }
        public ActionResult ThemTinTuc()
        {
            return View();
        }
        public ActionResult AddNew(TinTuc tta)
        {
            TinTucDao dao = new TinTucDao();
            dao.ThemTinTuc(tta);
            return RedirectToAction("QLTinTuc");
        }
        public ActionResult SuaTinTuc(int id)
        {
            TinTucDao dao = new TinTucDao();
            TinTuc tt = dao.FindTTById(id);
            return View(tt);
        }
        public ActionResult EditActionTea(TinTuc ttu)
        {
            TinTucDao dao = new TinTucDao();
            dao.SuaTinTuc(ttu);
            return RedirectToAction("QLTinTuc");
        }
        public ActionResult XoaTinTuc(int id)
        {
            TinTucDao dao = new TinTucDao();
            dao.XoaTinTuc(id);
            return RedirectToAction("QLTinTuc");
        }
    }
}