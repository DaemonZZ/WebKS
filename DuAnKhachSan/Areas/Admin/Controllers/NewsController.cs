using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Areas.Admin.Controllers
{
    public class NewsController : BaseController
    {
        private AdTypeModel typeModel = new AdTypeModel();
        // GET: Admin/Article
        [Authorize]
        public ActionResult Category()
        {
            return View();
        }
        [HttpGet]
        public ActionResult NewArticle()
        {
            List<AdType> listType = typeModel.listForAdd();
            SelectList s = new SelectList(listType, "id", "AdType1");
            ViewBag.ListType = s;
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult NewArticle(Advertisement ad)
        {
            return View();
        }

        
    }
}