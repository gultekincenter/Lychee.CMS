using Lychee.CMS.Data.Interface;
using Lychee.CMS.Data.Repository;
using Lychee.CMS.Infrastructure.Infrastructure;
using Lychee.CMS.Infrastructure.Interface;
using Ninject.Modules;

namespace Lychee.CMS.Domain
{
    public class NinjectModuleDomain : NinjectModule
    {
        public override void Load()
        {
            //Repository
            Bind<IUserRepository>().To<UserRepository>().InSingletonScope();

            //Infrastructure
            Bind<IDatabaseFactory>().To<DatabaseFactory>().InSingletonScope();
            //Bind<IRepository<TEntity, TPrimaryKey>>().To < Repository<TEntity, TPrimaryKey>().InSingletonScope();
            
        }
    }
}
