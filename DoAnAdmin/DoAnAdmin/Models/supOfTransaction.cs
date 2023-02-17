using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnAdmin.Models
{
    public class supOfTransaction
    {
        public string Itemset;
        public int sup;

        public supOfTransaction(string itemset, int sup)
        {
            Itemset = itemset;
            this.sup = sup;
        }
    }
}