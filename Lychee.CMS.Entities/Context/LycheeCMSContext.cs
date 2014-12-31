using Lychee.CMS.Entities.Interface;
using Lychee.CMS.Entities.Users;
using System.Data.Entity;

namespace Lychee.CMS.Entities.Context
{
    public class LycheeCMSContext : DbContext, IDbContext
    {
        public LycheeCMSContext()
            : base("LycheeConnectionString")
        {
            
        }

        public DbSet<User> Users { get; set; }
    }
}
