using Lychee.CMS.Entities.Context;
using Lychee.CMS.Infrastructure.Interface;
using System;

namespace Lychee.CMS.Infrastructure.Infrastructure
{
    public class DatabaseFactory : IDatabaseFactory
    {
        private LycheeCMSContext _context;

        public LycheeCMSContext GetContext()
        {
            return _context ?? (_context = new LycheeCMSContext());
        }

        public System.Data.Common.DbConnection Connection()
        {
            return _context.Database.Connection;
        }

        public void Dispose()
        {
            if (_context != null)
                _context.Dispose();

            GC.SuppressFinalize(this);
        }
    }
}
