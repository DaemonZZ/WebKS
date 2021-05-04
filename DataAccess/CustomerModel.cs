using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CustomerModel
    {
        HotelDataContext dbc;

        public CustomerModel()
        {
            this.dbc = new HotelDataContext() ;
        }

        public bool AddCustomer(Customer cs)
        {
            dbc.Customers.Add(cs);
            bool rs = dbc.SaveChanges()>0;
            return rs;
        }
    }
}
