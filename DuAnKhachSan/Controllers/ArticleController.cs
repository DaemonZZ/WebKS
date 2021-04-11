using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Controllers
{
    public class ArticleController : Controller
    {
        // GET: Article
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ArticleDescription(int id)
        {
            Advertisement model = new AdvertisementModel().getByID(id);
            CommentModel cmmd = new CommentModel();
            ViewBag.ListCm = cmmd.getListComment(id);

            return View(model);
        }

        public ActionResult ArticleCategory(int id)
        {
            List<Advertisement> model = new AdvertisementModel().getByCagotery(id);

            return View(model);
        }
        public ActionResult _RoomSlider()
        {
            AdvertisementModel adModel = new DataAccess.AdvertisementModel();
            ViewBag.adModel = adModel;
            List<Advertisement> model = adModel.getListActiveRoomAd();
            ViewBag.RoomList = model;

            return PartialView("_RoomSlider");
        }
        [HttpPost]
        public ActionResult Comment(string ten, string mail, string noidung, int adId) 
        {
            CommentModel cmmd = new CommentModel();
            Comment c = new Comment();
            c.name = ten;
            c.email = mail;
            c.noidung = noidung;
            c.adId = adId;

            bool rs = cmmd.AddComment(c);

            return Redirect("ArticleDescription/"+(c.adId).ToString());
        }
    }
}