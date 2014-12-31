
namespace Lychee.CMS.Web.Models.Interface.Users
{
    public interface ILoginModel
    {
        string UserName { get; set; }
        string Password { get; set; }
        bool RememberMe { get; set; }
    }
}
