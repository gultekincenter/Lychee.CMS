using Lychee.CMS.Entities.Interface;

namespace Lychee.CMS.Domain.Interface
{
    public interface IUserDomain
    {
        IUser GetUserByEmail(string email);
    }
}
