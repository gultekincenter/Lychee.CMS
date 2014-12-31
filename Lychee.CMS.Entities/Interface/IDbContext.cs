
using System.Data.Entity.Infrastructure;
using System.Data.Entity;

namespace Lychee.CMS.Entities.Interface
{
    public interface IDbContext
    {
        DbSet<T> Set<T>() where T : class;
        DbEntityEntry<T> Entry<T>(T entity) where T : class;
        Database Database { get; }
        int SaveChanges();
        void Dispose();
    }
}
