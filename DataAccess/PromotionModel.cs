using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class PromotionModel
    {
        HotelDataContext dbc;
        public PromotionModel()
        {
            dbc = new HotelDataContext();
        }

        public List<Promotion> getListCode()
        {
            return dbc.Promotions.OrderByDescending(p => p.id).ToList();
        }
        public Promotion getById(int id)
        {
            return dbc.Promotions.Where(p => p.id == id).FirstOrDefault();
        }
        public Promotion getByCode(string code)
        {
            return dbc.Promotions.Where(p => p.code == code).FirstOrDefault();
        }

        public String checkState(int id)
        {
            Promotion pr = getById(id);
            if (pr.State==1)
                return "Available";
            if (pr.State==3)
                return "Expired";
            if (pr.State==2)
                return "Used";
            return "Unavailble";
        }
        // tạo mã ngẫu nhiên
        public string generateCode()
        {
            string randoms = Guid.NewGuid().ToString().Replace("-", string.Empty).Replace("+", string.Empty).Substring(0, 7);
            return randoms;
        }

        public void InsertPro(Promotion pr)
        {
            dbc.Promotions.Add(pr);
            dbc.SaveChanges();
        }

        public void Delete(int id)
        {
            Promotion pr = getById(id);
            dbc.Promotions.Remove(pr);
            dbc.SaveChanges();
        }

        public void changeState(string code,int state)
        {
            Promotion p = getByCode(code);
            p.State = state;
            if (state == 2)
            {
                p.use_date = DateTime.Now;
            }
            dbc.SaveChanges();
        }
    }
}
