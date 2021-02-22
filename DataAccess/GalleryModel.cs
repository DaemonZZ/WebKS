using DataProvider;

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class GalleryModel
    {
        private HotelDataContext dbc = null;
        public GalleryModel()
        {
            dbc = new HotelDataContext();
        }
        public List<Gallery> getListByIdType(int id)
        {
            return dbc.Galleries.Where(p => p.typeId == id).ToList();
        }

        public Gallery getImageByID(int ID)
        {
            return dbc.Galleries.Where(p => p.id == ID).FirstOrDefault();
        }
       

        public int add(Gallery g)
        {
            dbc.Galleries.Add(g);
            dbc.SaveChanges();
            return dbc.Galleries.OrderByDescending(p => p.id).FirstOrDefault().id;
        }
    }
}
