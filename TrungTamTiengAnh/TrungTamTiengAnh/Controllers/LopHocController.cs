using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DAO;

namespace TrungTamTiengAnh.Controllers
{
    public class LopHocController : Controller
    {
        // GET: LopHoc
        public ActionResult AddClass(LopHoc lh)
        {
            LopHocDao loh = new LopHocDao();
            loh.ThemLopHoc(lh);
            return RedirectToAction("QLLopHoc");
        }
        public ActionResult ThemLopHoc()
        {
            SetViewBag();
            return View();
        }
        public void SetViewBag(int id = 0)
        {
            var KHdao = new KhoaHocDao();
            var GVdao = new GiaoVienDao();
            var PHdao = new PhongHocDao();
            ViewBag.KhoaHocID = new SelectList(KHdao.DSKhoaHoc(), "KhoaHocID", "TenKhoaHoc", id);
            ViewBag.GiaoVienID = new SelectList(GVdao.DanhSachGV(), "GiaoVienID", "TenGiaoVien");
            ViewBag.PhongHocID = new SelectList(PHdao.DanhSachPH(), "PhongHocID", "TenPhongHoc");
        }
        public ActionResult QLLopHoc()
        {
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                LopHocDao loh = new LopHocDao();
                IQueryable<LopHoc> lh = loh.DSLopHoc();

                return View(lh);
            }
        }
        public ActionResult SuaLopHoc(int id)
        {
            LopHocDao dao = new LopHocDao ();
            LopHoc lh = dao.FindClassbyID(id);
            SetViewBag();
            return View(lh);
        }
        public ActionResult EditActionClass(LopHoc lhe)
        {
            LopHocDao dao = new LopHocDao();
            dao.SuaLopHoc(lhe);
            return RedirectToAction("QLLopHoc");
        }
        public ActionResult XoaLopHoc(int id)
        {
            LopHocDao dao = new LopHocDao();
            LopHoc lh = dao.FindClassbyID(id);
            dao.XoaLopHoc(lh);
            return RedirectToAction("QLLopHoc");
        }
    }
}