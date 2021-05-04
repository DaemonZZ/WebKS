using DataAccess;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DuAnKhachSan
{
    public class Info
    {
        private int loai;
        private int gia;
        private int amount;
        private RoomTypeModel roomTypeModel;

        public int Loai { get => loai; set => loai = value; }
        public int Gia { get => gia; set => gia = value; }
        public int Amount { get => amount; set => amount = value; }

        public Info(int loai, int gia, int amount)
        {
            roomTypeModel = new RoomTypeModel();
            this.loai = loai;
            this.gia = gia;
            this.amount = amount;
        }

        public Info()
        {
            roomTypeModel = new RoomTypeModel();
        }


        public string getTypeRoom()
        {
            return roomTypeModel.getByID(loai).Roomtype1;
        }

        
    }
}