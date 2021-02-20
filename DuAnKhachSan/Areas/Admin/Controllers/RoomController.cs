using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Areas.Admin.Controllers
{
    public class RoomController : Controller
    {
        private RoomModel roomModel = new RoomModel();
        // GET: Admin/Room
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Edit(int id, int roomtype, double price)
        {
            Room room = roomModel.getById(id);
            room.typeID = roomtype;
            room.price = price;
            bool rs = roomModel.UpdateRoom(room);
            if (rs)
            {
                return RedirectToAction("Room", "Base");
            }
            else
            {
                ModelState.AddModelError("price", "Edit Failed");
            }
            return View("Room", "Base");
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            bool rs = roomModel.DeleteRoom(id);
            if (rs)
            {
                return RedirectToAction("Room", "Base");
            }
            else
            {
                ModelState.AddModelError("price", "Delete Failed");
            }
            return View("Room", "Base");
        }
        [HttpPost]
        public ActionResult Add(string roomname, int roomtype, double price)
        {
            Room r = new Room();
            r.room1 = roomname;
            r.typeID = roomtype;
            r.price = price;
            r.RoomState = 1;
            bool rs = roomModel.InsertRoom(r);
            if (rs)
            {

                return RedirectToAction("Room", "Base");
            }
            else
            {
                return Content("Room is already exist !");
            }
        }
    }
}