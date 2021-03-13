using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class BookingModel
    {
        private HotelDataContext dbc;
        public BookingModel()
        {
            dbc = new HotelDataContext();
        }

        public void Add(Booking b)
        {
            dbc.Bookings.Add(b);
            dbc.SaveChanges();
        }

        public void Delete(Booking b)
        {
            dbc.Bookings.Remove(b);
            dbc.SaveChanges();
        }
        public List<Booking> getAvailableBookingList()
        {
            DateTime today = DateTime.Now;
            return dbc.Bookings.Where(p => DateTime.Compare(today, p.checkout) > 0).ToList();
        }
        public bool CheckRoom(Room r,DateTime checkin,DateTime checkout)
        {
            List<Booking> bookingListWithSameRoom = getAvailableBookingList().Where(p=>p.bookedRoom==r.id).ToList();
            foreach(Booking item in bookingListWithSameRoom)
            {
                if(DateTime.Compare(checkin,item.checkin)>=0&& DateTime.Compare(checkin, item.checkout) <= 0)
                {
                    return false;
                }
                if (DateTime.Compare(checkout, item.checkin) >= 0 && DateTime.Compare(checkout, item.checkout) <= 0)
                {
                    return false;
                }
            }

            RoomModel rmd = new RoomModel();
            if (DateTime.Compare(checkin, DateTime.Now) == 0)
            {
                if (r.RoomState != 1) return false;
            }
            return true;
        }
    }
}
