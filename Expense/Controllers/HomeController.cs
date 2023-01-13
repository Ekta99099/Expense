
using Expense.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Expense.Controllers
{
    public class HomeController : Controller
    {
        ExpenseContext exp = new ExpenseContext();
        public ActionResult Index()
        {

            //var cat = adding_categories();

           // var expen = adding_expense();

            return View();
        }

        public PartialViewResult Categories()
        {
            var cat = adding_categories();
            return PartialView("_categories", cat);
        }



        public IList<Addcategory> adding_categories()
        {
            return exp.adding_categories.ToList();
        }
       
    }
}