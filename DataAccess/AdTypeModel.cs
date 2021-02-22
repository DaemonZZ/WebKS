using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class AdTypeModel
    {
        private HotelDataContext dbc = null;
        public AdTypeModel()
        {
            dbc = new HotelDataContext();
        }
        public List<AdType> getListAdType()
        {
            return dbc.AdTypes.ToList();
        }

        public List<AdType> listForAdd()
        {
            return dbc.AdTypes.Where(i => i.id == 5 || i.id == 7 || i.id == 8).ToList();
        }
        public AdType getById(int? id)
        {
            return dbc.AdTypes.Where(p => p.id == id).FirstOrDefault();
        }
        
    }
}
