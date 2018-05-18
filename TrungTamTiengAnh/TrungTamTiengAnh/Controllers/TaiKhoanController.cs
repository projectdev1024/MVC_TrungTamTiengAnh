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
    public class TaiKhoanController : Controller
    {
        public ActionResult QLTaiKhoan(int? page, string search)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                TaiKhoanDao dao = new TaiKhoanDao();
                IQueryable<TaiKhoan> tk = dao.DanhSachTK();
                ViewBag.SearchString = search;
                return View(tk.OrderBy(n => n.TaiKhoanID).ToPagedList(pageNumber, pageSize));
            }
        }
        public ActionResult SearchTK()
        {
            return View();
        }
        public ActionResult Search(FormCollection fc)
        {
            TaiKhoanDao dao = new TaiKhoanDao();
            IQueryable<TaiKhoan> tk;

            string com = fc["searchString"];
            tk = dao.SearchTK(com);
            if (tk != null)
                return PartialView("SearchTK", tk);
            else
                return PartialView("Null", "TaiKhoan");


        }
        public ActionResult ThemTaiKhoan()
        {
            return View();
        }
        public ActionResult AddAcc(TaiKhoan tka)
        {
            TaiKhoanDao dao = new TaiKhoanDao();
            dao.ThemTaiKhoan(tka);
            return RedirectToAction("QLTaiKhoan");
        }
        public ActionResult SuaTaiKhoan(int id)
        {
            TaiKhoanDao dao = new TaiKhoanDao();
            TaiKhoan tk = dao.FindTKById(id);
            return View(tk);
        }
        public ActionResult EditActionTea(TaiKhoan tku)
        {
            TaiKhoanDao dao = new TaiKhoanDao();
            dao.SuaTaiKhoan(tku);
            return RedirectToAction("QLTaiKhoan");
        }
        public ActionResult XoaTaiKhoan(int id)
        {
            TaiKhoanDao dao = new TaiKhoanDao();
            dao.XoaTaiKhoan(id);
            return RedirectToAction("QLTaiKhoan");
        }
    }
}