using Lychee.CMS.Data.Interface;
using Lychee.CMS.Infrastructure.Interface;
using Lychee.CMS.Infrastructure.Infrastructure;
using Lychee.CMS.Entities.Users;
using Lychee.CMS.Entities.Interface;

namespace Lychee.CMS.Data.Repository
{
    public class UserRepository : Repository<IUser, int>, IUserRepository
    {
        public UserRepository(IDatabaseFactory databaseFactory)
            : base(databaseFactory)
        {

        }
    }
}
