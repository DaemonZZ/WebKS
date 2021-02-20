using DataAccess;
using DuAnKhachSan.Areas.Admin.Code;
using DuAnKhachSan.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DuAnKhachSan.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model)
        {
            //var res = new UsersModel().Login(model.userName, model.password);
            if (Membership.ValidateUser(model.userName, model.password) && ModelState.IsValid)
            {
                FormsAuthentication.SetAuthCookie(model.userName, model.RememberMe);
                //SessionHelper.SetSession(new UserSession() { userName = model.userName });
                return RedirectToAction("Index", "Base");
            }
            else
            {
                ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu!");
            }
            return View(model);
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Login");
        }
    }
}