namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Gallery")]
    public partial class Gallery
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Gallery()
        {
            Advertisements = new HashSet<Advertisement>();
        }

        public int id { get; set; }

        [Column(TypeName = "ntext")]
        public string img { get; set; }

        [Column(TypeName = "ntext")]
        public string caption { get; set; }

        public int? typeId { get; set; }

        public bool active { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Advertisement> Advertisements { get; set; }

        public virtual GalleryType GalleryType { get; set; }
    }
}
