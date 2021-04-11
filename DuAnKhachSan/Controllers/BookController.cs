using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Controllers
{
    public class BookController : Controller
    {
        private BookingModel bkModel = new BookingModel();
        private RoomModel rmd = new RoomModel();
        private RoomTypeModel rtmd = new RoomTypeModel();
        // GET: Book
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetInfo(DateTime checkin , DateTime checkout, int adult, int? children, string code)
        {
            List<Room> model = new List<Room>();
            List<RoomType> listType = rtmd.getAllType();
            SelectList s = new SelectList(listType, "id", "Roomtype1");
            ViewBag.ListType = s;
            int songay = (checkout - checkin).Days;
            ViewBag.SoNgay = songay;
            foreach (Room item in rmd.getListRoom())
             {
                if (bkModel.CheckRoom(item, checkin, checkout))
                {
                    model.Add(item);
                }
            }
            if (model.Count > 0)
            {

                return View(model);
            }
            else
            {
                return null;
            }
        }
        //index: thu tu khung phong
        public JsonResult Select(int id)
        {
            List<Room> l = rmd.getListByType(id);
            int roomRemain = l.Where(p => p.RoomState > 0).Count();
            Advertisement desc = new AdvertisementModel().getByID(id + 9);
            Gallery img = new GalleryModel().getImageByID((int)desc.img_id);
            double? price = l.FirstOrDefault().price;
            return Json(new
            {
                imglink = "/Image/Room/" + img.img,
                link = "/Article/ArticleDescription/" + (id + 9),
                count = roomRemain,
                summ = desc.summary,
                price = price
            }) ;
        }

        public ActionResult Pay()
        {
            return View();
        }
    }
    
    
}