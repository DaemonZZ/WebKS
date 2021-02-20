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
    }
}