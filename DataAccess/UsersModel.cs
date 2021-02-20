using DataProvider;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class UsersModel
    {
        private HotelDataContext context = null;
        public UsersModel()
        {
            context = new HotelDataContext();
        }
        public bool Login(string userName,string password)
        {
            object[] para =
            {
                new SqlParameter ("@name",userName),
                new SqlParameter ("@pass",password)
            };
            var res = context.Database.SqlQuery<bool>("User_Login @name,@pass", para).SingleOrDefault();
            return res;
        }
    }
}
