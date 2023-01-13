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
    public class add_categoryController : Controller
    {
        // GET: add_category
        ExpenseContext exp = new ExpenseContext();
        public ActionResult Index()
        {
            IList<Addcategory> exlist = exp.adding_categories.ToList();

            return View(exlist);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Addcategory d)
        {
            exp.adding_categories.Add(d);
            int a = exp.SaveChanges();
            if (a > 0)
            {
                ViewBag.InsetMessage = "<script>alert('Data Inserted')</script>";
            }
            else
            {
                ViewBag.InsertMessage = "<script>alert('Data Not Inserted')</script>";
            }

            return View();
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var raw = exp.adding_categories.Where(model => model.Cid == id).FirstOrDefault();

           return View(raw);
        }

        [HttpPost]
        public ActionResult Edit(Addcategory d)
        {
           exp.Entry(d).State = EntityState.Modified;
           int a = exp.SaveChanges();
           if (a > 0)
           {
              ViewBag.UpdateMessage = "<script>alret('Data Updataed')</script>";

          }
            else
            {
               ViewBag.UpdateMessage = "<script>alret('Data Not Updataed')</script>";

          }

            if (ModelState.IsValid)
            { //checking model state

                //update student to db

                return RedirectToAction("Index");
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Delete(int Id)
        {
           var catraw = exp.adding_categories.Where(model => model.Cid == Id).FirstOrDefault();

            if (catraw != null)
            {
                exp.Entry(catraw).State = EntityState.Deleted;
                try
                {
                    int a = exp.SaveChanges();
                    if (a > 0)
                    {
                        TempData["Deleted"] = "<script>alert('Data Deleted')</script>";
                    }
                    else
                    {
                        TempData["Deleted"] = "<script>alert('Data Not Deleted')</script>";
                    }
                }
                catch
                {
                    TempData["Deleted"] = "<script>alert('first you delete your data in xpense list')</script>";
                }
            }        


            return RedirectToAction("Index");
        }


    }
}
