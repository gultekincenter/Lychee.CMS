using Lychee.CMS.Entities.Context;
using Lychee.CMS.Entities.Interface;
using System.Data.Common;

namespace Lychee.CMS.Infrastructure.Interface
{
    public interface IDatabaseFactory
    {
        LycheeCMSContext GetContext();
        DbConnection Connection();
        void Dispose();
    }
}
