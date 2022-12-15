using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;

namespace DoAnAdmin.Controllers
{
    public class PartialViewController : Controller
    {
        QL_LaptopEntities mydb = new QL_LaptopEntities();
        public ActionResult ShowAddress()
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                var item = mydb.CustomerAddresses.Where(n => n.cusID == info.cusID).ToList();
                return PartialView(item);
            }
            return PartialView();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult Cart()
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                ViewBag.tong = mydb.Carts.Where(n => n.cusID == info.cusID).ToList().Count;
                ViewBag.tongtien = mydb.Carts.Where(n => n.cusID == info.cusID).ToList().Sum(n => n.CartMoney);
                return PartialView();
            }
            return PartialView();
        }

        public ActionResult Order()
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                ViewBag.tong1 = mydb.DetailsOrders.Where(n => n.cusID == info.cusID).ToList().Count;
                ViewBag.tongtien1 = mydb.DetailsOrders.Where(n => n.cusID == info.cusID).ToList().Sum(n => n.orderMoney);
                return PartialView();
            }
            return PartialView();
        }
    }
}
