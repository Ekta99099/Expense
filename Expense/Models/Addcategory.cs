using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Data.Entity;


namespace Expense.Models
{
    [Table("category")]
    public class Addcategory
    {
        [Key]

        public int Cid {get; set; }

        [Required, RegularExpression(@"^[a-zA-Z''-'\s]{1,40}$", ErrorMessage = "not allow more than 40 character")]
        public String Categoryname { get; set; }

        [Range(0,20000, ErrorMessage ="please enter between 20,000")]
        public int Categorylimit { get; set; }
    }
}