using DataAccess;

using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DuAnKhachSan.Areas.Admin.Controllers
{
    public class PromotionController : BaseController
    {
        HotelDataContext dbc = new HotelDataContext();
        PromotionModel proModel = new PromotionModel();
        PromotionTypeModel typeModel = new PromotionTypeModel();
        // GET: Admin/Promotion
        [HttpGet]
        public ActionResult Promotion(int? promotionType, int? state)
        {
            setViewBag();
            List<Promotion> model = proModel.getListCode();
            if(promotionType==null&& state==null) 
                return View(model);
            if (promotionType != null) model = model.Where(p => p.PromotionType.id == promotionType).ToList();
            if (state != null) model = model.Where(p => p.State == state).ToList();
            return View(model);
        }
        [HttpPost]
        public JsonResult Add(FormCollection data)
        {
            try
            {
                string pro = data["pro"];
                float discost = float.Parse(data["discost"]);
                DateTime exp = DateTime.Parse(data["exp"]);
                int amount = int.Parse(data["amount"]);

                JsonResult js = new JsonResult();
                PromotionType type = new PromotionType();

                if (!typeModel.isExist(pro))
                {
                    type.PromotionType1 = pro;
                    type.discost = discost / 100;
                    typeModel.addType(type);
                }

                type = typeModel.getByName(pro);

                for (int i = 0; i < amount; i++)
                {
                    Promotion pr = new Promotion();
                    pr.code = proModel.generateCode();
                    pr.expiration_date = exp;
                    pr.typeID = type.id;
                    pr.State = 1;
                    proModel.InsertPro(pr);
                }

                js.Data = new
                {
                    status = "OK"
                };

                return Json(js, JsonRequestBehavior.AllowGet);

            } catch(FormatException e)
            {

                return Json(new JsonResult()
                {
                    Data = new
                    {
                        status = "ER",
                        message = "Date format error"
                    }
                },JsonRequestBehavior.AllowGet);
            }
           
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            proModel.Delete(id);
            return RedirectToAction("Promotion");
        }
    }
}