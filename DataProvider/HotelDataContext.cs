using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DataProvider
{
    public partial class HotelDataContext : DbContext
    {
        public HotelDataContext()
            : base("name=HotelDataContext")
        {
        }

        public virtual DbSet<AdType> AdTypes { get; set; }
        public virtual DbSet<Advertisement> Advertisements { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<CustomerType> CustomerTypes { get; set; }
        public virtual DbSet<Gallery> Galleries { get; set; }
        public virtual DbSet<GalleryType> GalleryTypes { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<Promotion> Promotions { get; set; }
        public virtual DbSet<PromotionType> PromotionTypes { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Room> Rooms { get; set; }
        public virtual DbSet<RoomType> RoomTypes { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdType>()
                .HasMany(e => e.Advertisements)
                .WithOptional(e => e.AdType)
                .HasForeignKey(e => e.tyepId);

            modelBuilder.Entity<Booking>()
                .Property(e => e.customerID)
                .IsUnicode(false);

            modelBuilder.Entity<Booking>()
                .Property(e => e.promotion_code)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.id)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerType>()
                .HasMany(e => e.Customers)
                .WithOptional(e => e.CustomerType)
                .HasForeignKey(e => e.typeID);

            modelBuilder.Entity<Gallery>()
                .HasMany(e => e.Advertisements)
                .WithOptional(e => e.Gallery)
                .HasForeignKey(e => e.img_id);

            modelBuilder.Entity<GalleryType>()
                .HasMany(e => e.Galleries)
                .WithOptional(e => e.GalleryType)
                .HasForeignKey(e => e.typeId);

            modelBuilder.Entity<Payment>()
                .Property(e => e.id)
                .IsUnicode(false);

            modelBuilder.Entity<Payment>()
                .Property(e => e.cardNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Promotion>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<PromotionType>()
                .HasMany(e => e.Promotions)
                .WithOptional(e => e.PromotionType)
                .HasForeignKey(e => e.typeID);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Users)
                .WithOptional(e => e.Role)
                .HasForeignKey(e => e.role_id);

            modelBuilder.Entity<Room>()
                .HasMany(e => e.Bookings)
                .WithOptional(e => e.Room)
                .HasForeignKey(e => e.bookedRoom);

            modelBuilder.Entity<RoomType>()
                .HasMany(e => e.Rooms)
                .WithOptional(e => e.RoomType)
                .HasForeignKey(e => e.typeID);

            modelBuilder.Entity<User>()
                .Property(e => e.id)
                .IsUnicode(false);
        }
    }
}
