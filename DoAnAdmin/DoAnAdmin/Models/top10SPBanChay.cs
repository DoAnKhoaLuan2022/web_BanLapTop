using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnAdmin.Models
{
    public class top10SPBanChay
    {
        public string tenSP;
        public int slSP;
        public int tongGia;

        public top10SPBanChay(string tenSP, int slSP, int tongGia)
        {
            this.tenSP = tenSP;
            this.slSP = slSP;
            this.tongGia = tongGia;
        }
    }
}