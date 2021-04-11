using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            AdvertisementModel adModel = new DataAccess.AdvertisementModel();
            ViewBag.adModel = adModel;
            //Load banner
            List<Gallery> model = new GalleryModel().getListByIdType(1);

            //Load promotion carousel item
            List<Advertisement> list = adModel.getListActivePromotion();
            ViewBag.promoList = list;

            //Load nav 
            List<Advertisement> listRoomArticle = adModel.getListActiveRoomAd();
            ViewBag.listRoomArt = listRoomArticle;

            List<Advertisement> listDinning = adModel.getListActiveDinning();
            ViewBag.ListDinning = listDinning;

            List<Advertisement> listFacilities = adModel.getListFacilities();
            ViewBag.ListFacilities = listFacilities;

            //Load room article
            List<Advertisement> listRoom = adModel.getListActiveRoomAd();
            ViewBag.RoomList = listRoom;
            //Facilities

            List<Advertisement> listNews = adModel.getListNews();
            ViewBag.NewsList = listNews;

            ViewBag.Spa = adModel.getByID(25);
            ViewBag.Pool = adModel.getByID(22);
            ViewBag.Fitness = adModel.getByID(23);
            return View(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

       
        public ActionResult _NavBar()
        {
            return PartialView("_NavBar");
        }
    }
}