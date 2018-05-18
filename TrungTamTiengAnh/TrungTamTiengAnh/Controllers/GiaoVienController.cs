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
    public class GiaoVienController : Controller
    {
        public ActionResult QLGiaoVien(int? page, string search)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                GiaoVienDao dao = new GiaoVienDao();
                IQueryable<GiaoVien> gv = dao.DanhSachGV();
                ViewBag.SearchString = search;
                return View(gv.OrderBy(n => n.GiaoVienID).ToPagedList(pageNumber, pageSize));
            }
        }
        public ActionResult SearchTeacher()
        {
            return View();
        }
        public ActionResult Search(FormCollection fc)
        {
            GiaoVienDao dao = new GiaoVienDao();
            IQueryable<GiaoVien> gv;

            string com = fc["searchString"];
            gv = dao.SearchTeacher(com);
            if (gv != null)
                return PartialView("SearchTeacher", gv);
            else
                return PartialView("Null", "GiaoVien");


        }
        public ActionResult ThemGiaoVien()
        {
            return View();
        }
        public ActionResult AddTea(GiaoVien gva)
        {
            GiaoVienDao dao = new GiaoVienDao();
            dao.ThemGiaoVien(gva);
            return RedirectToAction("QLGiaoVien");
        }
        public ActionResult SuaGiaoVien(int id)
        {
            GiaoVienDao dao = new GiaoVienDao();
            GiaoVien gv = dao.FindTeacherById(id);
            return View(gv);
        }
        public ActionResult EditActionTea(GiaoVien gvu)
        {
            GiaoVienDao dao = new GiaoVienDao();
            dao.SuaGiaoVien(gvu);
            return RedirectToAction("QLGiaoVien");
        }
        public ActionResult XoaGiaoVien(int id)
        {
            GiaoVienDao dao = new GiaoVienDao();
            dao.XoaGiaoVien(id);
            return RedirectToAction("QLGiaoVien");
        }
    }
}