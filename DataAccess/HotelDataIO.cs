using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataProvider;

namespace DataAccess
{
    public class HotelDataIO
    {
        private HotelDataContext dbc ;
        public HotelDataIO()
        {
            dbc = new HotelDataContext();
        }
        public void InsertObject<T>(T obj)
        {
             dbc.Set(obj.GetType()).Add(obj);
        }
        public void DeleteObject<T>(T obj)
        {
            dbc.Set(obj.GetType()).Remove(obj);
        }
        public bool Save()
        {
            return dbc.SaveChanges()>0;
        }
       
    }
}
