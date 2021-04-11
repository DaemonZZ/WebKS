using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class CommentModel
    {
        HotelDataContext dbc;
        public CommentModel()
        {
            dbc = new HotelDataContext();
        }

        public bool AddComment(Comment c)
        {
            bool rs = dbc.Comments.Add(c) != null;
            dbc.SaveChanges();
            return rs;
        }

        public List<Comment> getListComment(int adId)
        {
            return dbc.Comments.Where(p => p.adId == adId).ToList();
        }
    }
}
