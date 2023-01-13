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
    public class add_expenseController : Controller
    {
        // GET: add_expense
        ExpenseContext exp = new ExpenseContext();

        public ActionResult Index()
        {
            //var catteg = exp.adding_expense.ToList();
           // ViewBag.catteg = new SelectList(catteg, "Cid", "Categoryname");
            IList<Addexpense> elist = exp.adding_expense.ToList();

            return View(elist);
        }

        public ActionResult Create()
        {
            List<Addcategory> clist = exp.adding_categories.ToList();
            TempData["cname"] = new SelectList(clist, "Cid", "Categoryname");

            return View();

        }

        [HttpPost]
        public ActionResult Create(Addexpense s,Addcategory e)
            
        {

             var getamount = exp.adding_categories.Where(x => x.Cid == s.Cid).FirstOrDefault();
            if (getamount.Categorylimit > s.Amount)
            {

            IList<Addcategory> clist = exp.adding_categories.ToList();
                TempData["cname"] = new SelectList(clist, "Cid", "Categoryname");

                exp.adding_expense.Add(s);
                int a = exp.SaveChanges();
                if (a > 0)
                {
                    ViewBag.InsetMessage = "<Script>alert('Data Inserted')</script>";
                }
                else
                {

                    ViewBag.InsetMessage = "<Script>alert('Data Not Inserted')</script>";
                }
                
            }
            else
            {
                IList<Addcategory> clist = exp.adding_categories.ToList();
                TempData["cname"] = new SelectList(clist, "Cid", "Categoryname");
               ViewBag.msg = "<Script>alert(' Check calategory limit')</script>";

            }
            return View();

        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            IList<Addcategory> clist = exp.adding_categories.ToList();
            TempData["cname"] = new SelectList(clist, "Cid", "Categoryname");

            var raw =exp.adding_expense.Where(model => model.Id == id).FirstOrDefault();

            return View(raw);
        }

        [HttpPost]
        public ActionResult Edit(Addexpense s)
        {
            IList<Addcategory> clist = exp.adding_categories.ToList();
            TempData["cname"] = new SelectList(clist, "Cid", "Categoryname");

            exp.Entry(s).State = EntityState.Modified;
            int a = exp.SaveChanges();
     

       

            if (a>0)
            {
                ViewBag.UpdateMessage = "<script>aleart('Data updatae')</scrit>";
            }
            else
            {
                ViewBag.UpdateMessage = "<script>aleart('Data Not updatae')</scrit>";

            }

            return RedirectToAction("Index");
        }
        [HttpPost]

        public ActionResult Delete(int id)
        {
            if(id>0)
            {
                var catraw = exp.adding_expense.Where(model => model.Id==id).FirstOrDefault();

                if (catraw!= null)
                {
                    exp.Entry(catraw).State = EntityState.Deleted;
                    int a = exp.SaveChanges();

                    if(a>0)
                    {
                        TempData["Deleted"]="<script>aleart('Data Deleted')</script>";
                    }
                    else
                    {
                        TempData["Deleted"] = "<script>aleart('Data Not Deleted')</script>";

                    }



                }
            }

            return RedirectToAction("Index");
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
