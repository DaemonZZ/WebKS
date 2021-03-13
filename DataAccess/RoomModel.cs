using DataProvider;

using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class RoomModel
    {
        HotelDataContext dbc;
        public RoomModel()
        {
            dbc = new HotelDataContext();
        }

        public List<Room> getListRoom(int? typeroom=null, int? state=null)
        {
            List<Room> list = dbc.Rooms.OrderBy(p => p.room1).ToList();
            if (typeroom == null && state == null)
                return list;
            if (typeroom != null) list = list.Where(p => p.typeID == typeroom).ToList();
            if (state != null) list = list.Where(p => p.RoomState == state-1).ToList();
            return list;
        }

        public List<Room> getListByType(int typeId)
        {
            return dbc.Rooms.OrderBy(p => p.room1).Where(p => p.typeID == typeId).ToList();
        }

        public List<Room> getListByState(int state)
        {
            return dbc.Rooms.OrderBy(p => p.room1).Where(p => p.RoomState == state).ToList();
        }
        public Room getById(int id)
        {
            return dbc.Rooms.Where(p => p.id == id).FirstOrDefault();
        }
        public bool InsertRoom(Room r)
        {
            if (isExist(r.room1)) return false;
            try
            {
                dbc.Rooms.Add(r);
                dbc.SaveChanges();
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }
        public bool UpdateRoom(Room room)
        {
            try
            {
                Room en = getById(room.id);
                en.price = room.price;
                en.typeID = room.typeID;
                dbc.SaveChanges();
                return true;
            } 
            catch(Exception e)
            {
                return false;
            }
        }
        public bool DeleteRoom(int id)
        {
            try
            {
                Room en = getById(id);
                dbc.Rooms.Remove(en);
                dbc.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool isExist(string name)
        {
            Room r=dbc.Rooms.Where(p => p.room1 == name).FirstOrDefault();
            return r != null;
        }
    }
}
