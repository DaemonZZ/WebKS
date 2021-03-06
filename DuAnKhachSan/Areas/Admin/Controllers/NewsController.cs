using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Areas.Admin.Controllers
{
    public class NewsController : BaseController
    {
        private AdvertisementModel admd = new AdvertisementModel();
        private AdTypeModel typeModel = new AdTypeModel();
        // GET: Admin/Article
        [Authorize]
        public ActionResult Category()
        {
            SetViewBag();
            List<Advertisement> model = admd.getListAllArticle();
            return View(model);
        }
        [HttpGet]
        public ActionResult NewArticle()
        {
            SetViewBag();

            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult NewArticle(string adName, string desc, int? typeId, string sum, string imgPath)
        {
            //get image
            AdTypeModel typemd = new AdTypeModel();
            GalleryModel gModel = new GalleryModel();
            string imgName = System.IO.Path.GetFileName(imgPath);
            string type = typemd.getById(typeId).AdType1;
            string desPath = "/Image/" + type + "/" + imgName;
            System.IO.File.Copy(Server.MapPath("~") + imgPath, Server.MapPath("~") + desPath, true);
            Gallery g = new Gallery();
            g.img = imgName;
            g.typeId = typeId;
            g.caption = adName;
            g.active = false;
            int id_img = gModel.add(g);
            // add article
            AdvertisementModel adModel = new AdvertisementModel();
            Advertisement ad = new Advertisement();
            ad.img_id = id_img;
            ad.adName = adName;
            ad.tyepId = typeId;
            ad.AdDescription = desc;
            ad.summary = sum;
            ad.priority = 1;
            adModel.add(ad);

            return RedirectToAction("Category", "News");
        }

        public void SetViewBag()
        {
            List<AdType> listType = typeModel.listForAdd();
            SelectList s = new SelectList(listType, "id", "AdType1");
            ViewBag.ListType = s;


        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            admd.Delete(id);
            return RedirectToAction("Category", "News");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            SetViewBag();

            return View();
        }
    }
}