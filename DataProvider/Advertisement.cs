namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Advertisement")]
    public partial class Advertisement
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Advertisement()
        {
            Comments = new HashSet<Comment>();
        }

        public int id { get; set; }

        [StringLength(255)]
        public string adName { get; set; }

        [Column(TypeName = "ntext")]
        public string AdDescription { get; set; }

        public int? img_id { get; set; }

        public int? tyepId { get; set; }

        public int? priority { get; set; }

        [Column(TypeName = "ntext")]
        public string summary { get; set; }

        public virtual AdType AdType { get; set; }

        public virtual Gallery Gallery { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
    }
}
