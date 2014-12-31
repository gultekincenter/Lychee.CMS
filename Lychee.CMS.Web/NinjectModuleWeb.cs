using Lychee.CMS.Domain.Domain.User;
using Lychee.CMS.Domain.Interface;
using Ninject.Modules;

namespace Lychee.CMS.Web
{
    public class NinjectModuleWeb : NinjectModule
    {
        public override void Load()
        {
            Bind<IUserDomain>().To<UserDomain>().InSingletonScope();
        }
    }
}