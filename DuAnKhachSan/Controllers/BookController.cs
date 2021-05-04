using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

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
        public ActionResult Error()
        {
            return View();
        }
        public ActionResult GetInfo(DateTime checkin , DateTime checkout, int adult, int? children, string code)
        {
            PromotionModel prmd = new PromotionModel();
            Promotion pr = prmd.getByCode(code);
            if (pr == null && code != "") return Redirect("Error");
            if (checkin == null || checkout == null) return Redirect("Error");

            ViewBag.Code = code;
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
                ViewBag.CI = checkin;
                ViewBag.CO = checkout;
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
        [HttpGet]
        public ActionResult Pay()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Pay(string listRoom, string code,string ci, string co)
        {

            List<Info> list = new JavaScriptSerializer().Deserialize<List<Info>>(listRoom);
            int total = 0;
            foreach(Info it in list)
            {
                total += (it.Amount * it.Gia);
            }
            ViewBag.discost = getDiscost(code);
            ViewBag.code = code;
            ViewBag.Total = total;
            ViewBag.CI = ci;
            ViewBag.CO = co;


            return View(list);
        }

        public double? getDiscost(string code)
        {
            PromotionModel prmd = new PromotionModel();
            Promotion promotion;

            if (code != "")
            {
                promotion = prmd.getByCode(code);
                if (promotion.State == 1) return new PromotionTypeModel().getByCode(code).discost;
                else return 0;
            }
            else
            {
                return 0;
            }
        }


        public ActionResult getCusInfo(string ci, string co,string code, string total)
        {
            ViewBag.ci = ci;
            ViewBag.co = co;
            ViewBag.code = code;
            ViewBag.total = total;
            return View();
        }
        [HttpPost]
        public JsonResult CreateCus(string first, string last,int sex,string mail, string country, string phone)
        {
            CustomerModel md = new CustomerModel();
            Customer cs = new Customer();
            cs.fisrtName = first;
            cs.lastName = last;
            if (sex == 0)
            {
                cs.sex = "Male";
            }
            else
            {
                cs.sex = "Female";
            }
            cs.email = mail;
            cs.phone = phone;
            cs.country = country;

            bool rs = md.AddCustomer(cs);

            if (rs) return Json(new JsonResult()
            {
                Data = new
                {
                    state= "ok"

                }
            },JsonRequestBehavior.AllowGet);

            else
            {
                return Json(new JsonResult()
                {
                    Data = new
                    {
                        status = "fail"
                    }
                }, JsonRequestBehavior.AllowGet);
            }
            
        }
        
    }

    
    
    
}