using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnAdmin.Models
{
    public class ChonLoc
    {
        public string daChon;
        public bool tt;
        public ChonLoc(string daChon, bool tt)
        {
            this.daChon = daChon;
            this.tt = tt;
        }
    }
}