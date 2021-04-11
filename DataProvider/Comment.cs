namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Comment")]
    public partial class Comment
    {
        public int id { get; set; }

        [StringLength(50)]
        public string name { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [Column(TypeName = "ntext")]
        public string noidung { get; set; }

        public int? adId { get; set; }

        public virtual Advertisement Advertisement { get; set; }
    }
}
