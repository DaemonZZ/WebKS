using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DuAnKhachSan.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required]
        public string userName { get; set; }
        public string password { get; set; }
        public bool RememberMe { get; set; }

    }
}