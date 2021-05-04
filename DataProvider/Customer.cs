namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            Bookings = new HashSet<Booking>();
        }

        [StringLength(50)]
        public string id { get; set; }

        [StringLength(50)]
        public string fisrtName { get; set; }

        [StringLength(50)]
        public string lastName { get; set; }

        [StringLength(6)]
        public string sex { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [StringLength(50)]
        public string country { get; set; }

        [StringLength(50)]
        public string phone { get; set; }

        public int? typeID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Booking> Bookings { get; set; }

        public virtual CustomerType CustomerType { get; set; }
    }
}
