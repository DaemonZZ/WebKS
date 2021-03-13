namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Promotion")]
    public partial class Promotion
    {
        public int id { get; set; }

        [StringLength(50)]
        public string code { get; set; }

        public int? typeID { get; set; }

        public int? State { get; set; }

        public DateTime? use_date { get; set; }

        public DateTime? expiration_date { get; set; }

        public virtual PromotionType PromotionType { get; set; }
    }
}
