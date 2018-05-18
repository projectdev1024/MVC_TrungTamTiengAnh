using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.Entities;
using TrungTamTiengAnh.Models.DAO;
using TrungTamTiengAnh.Models.Bean;
using PagedList.Mvc;
using PagedList;
using TrungTamTiengAnh.Models.DTO;

namespace TrungTamTiengAnh.Controllers
{
    public class HocSinhController : Controller
    {
        public ActionResult Admin()
        {
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                return View();
            }
        }
        public ActionResult QLHocSinh(int? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            if (Session["UserName"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                HocSinhDAO dao = new HocSinhDAO();
                IQueryable<HocSinh> hs = dao.DanhSachHS();
                return View(hs.OrderBy(n => n.HocSinhID).ToPagedList(pageNumber, pageSize));
            }
        }
        public ActionResult SearchStudent()
        {
            return View();
        }
        public ActionResult Search(FormCollection fc)
        {
            HocSinhDAO dao = new HocSinhDAO();
            IQueryable<HocSinh> hs;

            string com = fc["searchString"];
            hs = dao.SearchStudent(com);
            if (hs != null)
                return PartialView("SearchStudent", hs);
            else
                return PartialView("Null", "GiaoVien");
            
        }
        
        public ActionResult ThemHocSinh()
        {
            return View();
        }
        public ActionResult AddStd(HocSinhDTO hsa)
        {
            HocSinhDAO dao = new HocSinhDAO();
            dao.ThemHocSinh(hsa);
            return RedirectToAction("QLHocSinh");
        }
        public ActionResult SuaHocSinh(int id)
        {
            HocSinhDAO dao = new HocSinhDAO();
            HocSinh hs = dao.FindStudentById(id);
            return View(hs);
        }
        public ActionResult EditActionStd(HocSinh hsu)
        {
            HocSinhDAO dao = new HocSinhDAO();
            
            dao.SuaHocSinh(hsu);
            return RedirectToAction("QLHocSinh");
        }
        public ActionResult XoaHocSinh(int id)
        {
            HocSinhDAO dao = new HocSinhDAO();
            HocSinh hs = dao.FindStudentById(id);
            dao.XoaHocSinh(hs);
            
            return RedirectToAction("QLHocSinh");
        }
        public ActionResult HoaDon(int id)
        {
            HoaDonDao dao = new HoaDonDao();
            IQueryable<HoaDon> hd = dao.HoaDonHS(id);
            return View(hd);
        }
    }
}