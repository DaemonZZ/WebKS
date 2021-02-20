namespace DataProvider
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [StringLength(10)]
        public string id { get; set; }

        [StringLength(50)]
        public string userName { get; set; }

        [StringLength(50)]
        public string pwd { get; set; }

        public int? role_id { get; set; }

        public virtual Role Role { get; set; }
    }
}
