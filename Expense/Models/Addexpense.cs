using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Expense.Models
{
    [Table("expenses")]
    public class Addexpense
    {
        [Key]
        public int Id { get; set; }

       [Required,RegularExpression(@"^[a-zA-Z''-'\s]{1,40}$",ErrorMessage ="not allow numeric value")]
        public string Title { get; set; }

        [Required,RegularExpression(@"^[a-zA-Z''-'\s]{1,40}$", ErrorMessage = "not allow numeric value")]
         public string Description { get; set; }

        public DateTime Date { get; set; } = DateTime.Now;

        public int Amount { get; set; }
        public int Cid { get; set; }

    }
}