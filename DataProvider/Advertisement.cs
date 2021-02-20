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
    }
}
