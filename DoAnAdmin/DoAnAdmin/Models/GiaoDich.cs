using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnAdmin.Models
{
    public class GiaoDich
    {
        public int TID;
        public string Items;
        public string quantity;
        public string u;
        public int tu;

        public GiaoDich(int tID, string items)
        {
            TID = tID;
            Items = items;
        }

        public GiaoDich(int tID, string items, string quantity, string u, int tu)
        {
            TID = tID;
            Items = items;
            this.quantity = quantity;
            this.u = u;
            this.tu = tu;
        }
    }
}