using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DuAnKhachSan
{
    public class BookingInfo
    {
        private string cusID;
        private DateTime ci;
        private DateTime co;
        private Promotion code;
        private List<Info> roomList;

        public BookingInfo(string cusID, DateTime ci, DateTime co, Promotion code, List<Info> roomList)
        {
            this.cusID = cusID;
            this.ci = ci;
            this.co = co;
            this.code = code;
            this.roomList = roomList;
        }

        public string CusID { get => cusID; set => cusID = value; }
        public DateTime Ci { get => ci; set => ci = value; }
        public DateTime Co { get => co; set => co = value; }
        public Promotion Code { get => code; set => code = value; }
        public List<Info> RoomList { get => roomList; set => roomList = value; }
    }
}