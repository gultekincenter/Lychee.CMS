using Lychee.CMS.Data.Interface;
using Lychee.CMS.Domain.Interface;
using Lychee.CMS.Entities.Interface;
using System;
using System.Linq;

namespace Lychee.CMS.Domain.Domain.User
{
    public class UserDomain : IUserDomain
    {
        private readonly IUserRepository _userRepository;

        public UserDomain(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public IUser GetUserByEmail(string email)
        {
            return _userRepository.Single(u => u.EmailAddress == email);
        }
    }
}
