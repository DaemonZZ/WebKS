using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class PromotionTypeModel
    {
        private HotelDataContext dbc;
        public PromotionTypeModel()
        {
            dbc = new HotelDataContext();
            Clean();
        }
        public List<PromotionType> listType()
        {
            return dbc.PromotionTypes.ToList();
        }

        public PromotionType getByID(int? id)
        {
            return dbc.PromotionTypes.Where(p => p.id == id).FirstOrDefault();
        }
        public PromotionType getByCode(string code)
        {
            Promotion pr = new PromotionModel().getByCode(code);
            return getByID(pr.typeID);
        }

        public PromotionType getByName(string n)
        {
            return dbc.PromotionTypes.Where(p => p.PromotionType1 == n).FirstOrDefault();
        }

        public void addType(PromotionType t)
        {
            dbc.PromotionTypes.Add(t);
            dbc.SaveChanges();
        }

        public bool isExist(string type)
        {
            PromotionType check = dbc.PromotionTypes.Where(p => p.PromotionType1 == type).FirstOrDefault();
            return check != null;
        }
        public void DeleteType(int id)
        {
            PromotionType t = getByID(id);
            dbc.PromotionTypes.Remove(t);
            dbc.SaveChanges();
        }

        public void Clean()
        {
            List<PromotionType> list = listType();
            PromotionModel md = new PromotionModel();
            foreach(PromotionType item in list)
            {
                List<Promotion> prlist = md.getListCode().Where(p => p.typeID == item.id).ToList();
                if (!prlist.Any())
                {
                    DeleteType(item.id);
                }
            }
        }
    }
}
