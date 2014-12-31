
namespace Lychee.CMS.Web.Models.Interface.Users
{
    public interface IRegisterExternalLoginModel
    {
        string UserName { get; set; }
        string ExternalLoginData { get; set; }
    }
}
