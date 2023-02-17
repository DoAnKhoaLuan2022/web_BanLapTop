using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnAdmin.Models
{
    public class OneGiaoDich
    {
        public string Items;
        
        public int u;

        public OneGiaoDich(string items,int u)
        {
            Items = items;
            this.u = u;
        }
    }
}