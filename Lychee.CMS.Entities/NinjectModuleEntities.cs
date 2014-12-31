using Lychee.CMS.Entities.Interface;
using Lychee.CMS.Entities.Users;
using Ninject.Modules;

namespace Lychee.CMS.Entities 
{
    public class NinjectModuleEntities : NinjectModule
    {
        public override void Load()
        {
            Bind<IUser>().To<User>().InSingletonScope();
        }
    }
}
