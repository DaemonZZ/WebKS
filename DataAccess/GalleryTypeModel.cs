using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class GalleryTypeModel
    {
        private HotelDataContext dbc = null;
        public GalleryTypeModel()
        {
            dbc = new HotelDataContext();
        }

        public string getNameByID(int id)
        {
            return dbc.GalleryTypes.Where(p => p.id == id).FirstOrDefault().typeName;
        }
    }
}
