using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Areas.Admin.Controllers
{
    [Authorize]
    public class BaseController : Controller
    {
        RoomModel roomModel = new RoomModel();
        PromotionModel proModel = new PromotionModel();
        PromotionTypeModel typeModel = new PromotionTypeModel();
        // GET: Admin/Base
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Room(int? roomtype, int? state)
        {
            
            List<Room> model = roomModel.getListRoom(roomtype,state);
            ViewBag.ListRoom = model;
            setViewBag();
            RoomTypeModel roomTypeModel = new RoomTypeModel();
            ViewBag.Type = roomTypeModel;

            return View();
        }

        public void setViewBag()
        {
            RoomTypeModel roomTypeModel = new RoomTypeModel();
            SelectList listType = new SelectList(roomTypeModel.getAllType(),"id","Roomtype1");
            ViewBag.roomtype = listType;

            ViewBag.PromotionModel = proModel;

            SelectList listPrType = new SelectList(typeModel.listType(), "id", "PromotionType1");
            ViewBag.promotionType = listPrType;

        }
    }
}