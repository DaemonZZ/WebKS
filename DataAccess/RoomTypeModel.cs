using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class RoomTypeModel
    {
        HotelDataContext dbc;
        public RoomTypeModel()
        {
            dbc = new HotelDataContext();
        }
        public RoomType getByID(int Id)
        {
            return dbc.RoomTypes.Where(p => p.id == Id).FirstOrDefault();
        }
        public List<RoomType> getAllType()
        {
            return dbc.RoomTypes.OrderBy(i => i.id).ToList();
        }
    }
}
