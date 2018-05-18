using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TrungTamTiengAnh.Models.DAO;

namespace TrungTamTiengAnh.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginAction(Models.Account account)
        {
            if (ModelState.IsValid)
            {
                UserDAO dao = new UserDAO();
                bool check = dao.Login(account.UserName, account.PassWord);
                if (check)
                {
                    Session["UserName"] = account.UserName;
                    return RedirectToAction("Admin", "HocSinh");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng!");
                }
            }
            return RedirectToAction("Login", "Login");
        }
        public ActionResult Logout()
        {
            Session["UserName"] = null;
            return View("Login");
        }
    }
}