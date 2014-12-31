using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using Lychee.CMS.Infrastructure.Interface;
using Lychee.CMS.Entities.Context;
using Lychee.CMS.Entities.Interface;


namespace Lychee.CMS.Infrastructure.Infrastructure
{
    public abstract class Repository<TEntity, TPrimaryKey> : IRepository<TEntity, TPrimaryKey>
            where TEntity : class
    {

        protected IDbContext _context;
        protected readonly DbSet<TEntity> _dbSet;
        private readonly IDatabaseFactory _databaseFactory;

        protected Repository(IDatabaseFactory databaseFactory)
        {
            _databaseFactory = databaseFactory;
            _context = databaseFactory.GetContext();
            _dbSet = _context.Set<TEntity>();
        }

        public virtual TEntity Save(TEntity entity, System.Data.EntityState state)
        {
            _context.Entry(entity).State = state;
            return entity;
        }

        public virtual TEntity GetById(TPrimaryKey id)
        {
            return _dbSet.Find(id);
        }

        public virtual IEnumerable<TEntity> GetAll()
        {
            return _dbSet;
        }


        public virtual IEnumerable<TEntity> Get(System.Linq.Expressions.Expression<Func<TEntity, bool>> expression)
        {
            return _dbSet.Where(expression);
        }

        public virtual TEntity Single(System.Linq.Expressions.Expression<Func<TEntity, bool>> expression)
        {
            return _dbSet.FirstOrDefault(expression);
        }

        public virtual void Update(TEntity entity, string[] propertyToUpdate)
        {
            _dbSet.Attach(entity);
            foreach (string property in propertyToUpdate)
                _context.Entry(entity).Property(property).IsModified = true;
        }

        public virtual void Delete(TEntity entity)
        {
            _dbSet.Attach(entity);
            _dbSet.Remove(entity);
        }

        public virtual void ExecuteSQLCommand(string command, params object[] parameters)
        {
            _context.Database.ExecuteSqlCommand(command, parameters);
        }
    }
}
