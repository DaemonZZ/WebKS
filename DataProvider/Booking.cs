namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Booking")]
    public partial class Booking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Booking()
        {
            Payments = new HashSet<Payment>();
        }

        public int id { get; set; }

        [StringLength(50)]
        public string customerID { get; set; }

        public int? bookedRoom { get; set; }

        public int? number_of_night { get; set; }

        public DateTime? checkin { get; set; }

        public DateTime? checkout { get; set; }

        [StringLength(50)]
        public string promotion_code { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual Room Room { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Payment> Payments { get; set; }
    }
}
