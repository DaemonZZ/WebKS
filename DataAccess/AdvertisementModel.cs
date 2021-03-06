using DataProvider;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class AdvertisementModel
    {
        private HotelDataContext dbc;
        public AdvertisementModel()
        {
            dbc = new HotelDataContext();
        }
        public Advertisement getByID(int? id)
        {
            return dbc.Advertisements.Where(p => p.id == id).FirstOrDefault();
        }
        public List<Advertisement> getListActiveRoomAd()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 2 && p.priority > 0).ToList();
        }

        public Advertisement getIntroArticle()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 1).FirstOrDefault();
        }
        public List<Advertisement> getListActivePromotion()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 8 && p.priority > 0).ToList();
        }
        public List<Advertisement> getListActiveDinning()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 3 && p.priority > 0).ToList();
        }
        public Advertisement getSpaArticle()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 4).FirstOrDefault();
        }
        public List<Advertisement> getListFacilities()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 6 && p.priority > 0).ToList();
        }
        public List<Advertisement> getListNews()
        {
            return dbc.Advertisements.Where(p => p.img_id == 6).ToList();
        }
        public List<Advertisement> getListDestionations()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 7).ToList();
        }

        public Gallery getImageByAdID(int adId)
        {
            int idGallery = (int)dbc.Advertisements.Where(p => p.id == adId).FirstOrDefault().img_id;
            return new GalleryModel().getImageByID(idGallery);
        }

        public List<Advertisement> getByCagotery(int id)
        {
            return dbc.Advertisements.Where(p => p.tyepId == id).ToList();
        }

        public void add(Advertisement ad)
        {
            dbc.Advertisements.Add(ad);
            dbc.SaveChanges();
        }

        public List<Advertisement> getListAllArticle()
        {
            return dbc.Advertisements.Where(p => p.tyepId == 5 || p.tyepId == 7 || p.tyepId == 8).OrderByDescending(p=>p.id).ToList();
        }

        public void Delete(int? id)
        {
            Advertisement ad = dbc.Advertisements.Where(p => p.id == id).FirstOrDefault();
            dbc.Advertisements.Remove(ad);
            dbc.SaveChanges();
        }
    }
}
