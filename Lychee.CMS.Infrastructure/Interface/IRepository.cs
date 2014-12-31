using System;
using System.Data;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Lychee.CMS.Infrastructure.Interface
{
    public interface IRepository<TEntity, TPrimaryKey> 
    {
        TEntity Save(TEntity entity, EntityState state);
        TEntity GetById(TPrimaryKey id);
        TEntity Single(Expression<Func<TEntity, bool>> expression);
        IEnumerable<TEntity> GetAll();      
        IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> expression);

        void Update(TEntity entity, string[] propertyToUpdate);
        void Delete(TEntity entity);
        void ExecuteSQLCommand(string command, params object[] parameters);
    }
}
