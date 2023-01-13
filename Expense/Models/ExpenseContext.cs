using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Expense.Models
{
    public class ExpenseContext : DbContext
    {

        public DbSet<Addexpense> adding_expense { get; set; }

        public DbSet<Addcategory> adding_categories { get; set; }

        //internal int SaveChange()
        //{
        //    throw new NotImplementedException();
        //}

        //internal object Entry(Addcategory d)s
        //{
        //    throw new NotImplementedException();
        //}
    }
}