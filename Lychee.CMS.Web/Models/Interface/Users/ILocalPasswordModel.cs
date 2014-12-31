
namespace Lychee.CMS.Web.Models.Interface.Users
{
    public interface ILocalPasswordModel
    {
        string OldPassword { get; set; }
        string NewPassword { get; set; }
        string ConfirmPassword { get; set; }
    }
}