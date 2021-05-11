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

        public Customer AddCustomer(Customer cs)
        {
            Customer cus = dbc.Customers.Add(cs);
             dbc.SaveChanges();
            return cus;
        }
    }
}
