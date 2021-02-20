using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DuAnKhachSan.Areas.Admin.Code
{
    public class SessionHelper
    {

        public static void SetSession(UserSession session)
        {
            HttpContext.Current.Session["loginSession"] = session;
        }
        public static UserSession GetSession()
        {
            var sess = HttpContext.Current.Session["loginSession"];
            if (sess == null)
                return null;
            else
            {
                return sess as UserSession;
            }
        }
    }
}