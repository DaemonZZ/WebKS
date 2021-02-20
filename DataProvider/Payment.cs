namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Payment")]
    public partial class Payment
    {
        [StringLength(50)]
        public string id { get; set; }

        public int? bookingID { get; set; }

        [StringLength(50)]
        public string paymentMethod { get; set; }

        [StringLength(50)]
        public string cardNumber { get; set; }

        public int? expDate { get; set; }

        public int? expYear { get; set; }

        public virtual Booking Booking { get; set; }
    }
}
