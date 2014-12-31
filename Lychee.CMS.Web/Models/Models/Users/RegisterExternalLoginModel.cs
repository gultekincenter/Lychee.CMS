using Lychee.CMS.Web.Models.Interface.Users;
using System.ComponentModel.DataAnnotations;

namespace Lychee.CMS.Web.Models.Models.Users
{
    public class RegisterExternalLoginModel : IRegisterExternalLoginModel
    {
        [Required]
        [Display(Name = "User name")]
        public string UserName { get; set; }

        public string ExternalLoginData { get; set; }
    }
}