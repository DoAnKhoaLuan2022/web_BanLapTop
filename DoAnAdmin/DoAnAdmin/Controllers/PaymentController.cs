using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;

namespace DoAnAdmin.Controllers
{
    public class PaymentController : Controller
    {
        QL_LaptopEntities mydb = new QL_LaptopEntities();
        //
        // GET: /Payment/
        public ActionResult demo(string diachi)
        {
            return View();
        }
        public ActionResult PaymentCard()
        {
            return View();
        }
        public ActionResult PayMoMo()
        {
            return View();
        }
        public ActionResult DetailsPay()
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                var item = mydb.DetailsOrders.Where(n => n.cusID == info.cusID).ToList();
                return View(item);
            }
            else
            {
               
                return RedirectToAction("orderPhone", "Payment");
            }


        }
        public ActionResult DetailsProOrders(int idOrder)
        {
                var item = mydb.DetailsOrders.Where(n => n.orderID == idOrder).ToList();
                return View(item);
        }
        public ActionResult PaymentOne(string id)
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            var ma = Session["maorder"];
            if(ma != null)
            {
                var one = mydb.Orders.FirstOrDefault(n => n.orderID == (int)ma);
                mydb.Orders.Remove(one);
                mydb.SaveChanges();
                var item = mydb.Products.FirstOrDefault(n => n.id == id);
                return View(item);
            }
            if (info == null)
            {
                ViewBag.ErrM = "Vui lòng đăng nhập để tiếp tục mua hàng !";
                return RedirectToAction("Login", "Customers");
            }
            else
            {
                var item = mydb.Products.FirstOrDefault(n => n.id== id);
                return View(item);
            }
        }
        [HttpPost]
        public ActionResult PaymentOne(string id, FormCollection f)
        {
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            var pro = mydb.Products.Where(n => n.id == id).FirstOrDefault();
            
            string txt = f["txt"];
            if (pro != null)
            {
                Session["tongtien"] = "";
                Session["maorder"] = "";
                Session["idPro"] = "";
                Order d = new Order();
                d.orderDate = DateTime.Now;
                d.orderStatus = "Đang chờ xác nhận";
                d.empID = null;
                d.cusID = item.cusID;
                mydb.Orders.Add(d);
                mydb.SaveChanges();
                var last = mydb.Orders.ToList().LastOrDefault();
                int maorder = last.orderID;
                Session["maorder"] = maorder;
                int tong = 0;
                DetailsOrder det = new DetailsOrder();
                det.cusID = item.cusID;
                det.orderID = maorder;
                det.proID = pro.id;
                det.orderAddress = txt;
                det.proPrice = (int)pro.price;
                det.orderQuantity = 1;
                det.orderMoney = (int)pro.price*1;

                tong = tong + (int)(pro.price * 1);
                mydb.DetailsOrders.Add(det);

                Product product = mydb.Products.Where(n => n.id == pro.id).FirstOrDefault();
                product.quanlity = product.quanlity - 1;
                mydb.Products.Attach(product);
                mydb.Entry(product).State = EntityState.Modified;

                mydb.SaveChanges();
                Session["tongtien"] = tong;
                Session["idPro"] = pro.id;
                mydb.SaveChanges();
                string tt = f["txtTT"];
                if (tt.Equals("MoMo"))
                {
                    return RedirectToAction("PayMoMo");
                }
                else
                {
                    return RedirectToAction("DetailsPay");
                }

            }
            else
            {
                return RedirectToAction("DetailsPay");
            }
        }

        public ActionResult Payment()
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info == null)
            {
                ViewBag.ErrM = "Vui lòng đăng nhập để tiếp tục mua hàng !";
                return RedirectToAction("Login", "Customers");
            }
            else
            {
                var item = mydb.Carts.Where(n => n.cusID == info.cusID).ToList();
                return View(item);
            }
        }
        [HttpPost]
        public ActionResult Payment(string txt,FormCollection f)
        {
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            var cart = mydb.Carts.Where(n => n.cusID == item.cusID).ToList();
            if (item != null)
            {
                Session["tongtien"] = "";
                Session["maorder"] = "";
                Order d = new Order();
                d.orderDate = DateTime.Now;
                d.orderStatus = "Đang chờ xác nhận";
                d.empID = null;
                d.cusID = item.cusID;
                mydb.Orders.Add(d);
                mydb.SaveChanges();
                var last = mydb.Orders.ToList().LastOrDefault();
                int maorder = last.orderID;
                Session["maorder"] = maorder;
                int tong = 0;
                foreach (var a in cart)
                {
                    DetailsOrder det = new DetailsOrder();
                    det.cusID = a.cusID;
                    det.orderID = maorder;
                    det.proID = a.proID;
                    det.orderAddress = txt;
                    det.proPrice = a.proPrice;
                    det.orderQuantity = a.CartQuantity;
                    det.orderMoney = a.CartMoney;

                    tong = tong + (int)(a.CartQuantity * a.proPrice);
                    mydb.DetailsOrders.Add(det);

                    Product product = mydb.Products.Where(n => n.id == a.proID).FirstOrDefault();
                    product.quanlity = product.quanlity - a.CartQuantity;
                    mydb.Products.Attach(product);
                    mydb.Entry(product).State = EntityState.Modified;

                    mydb.SaveChanges();
                }
                Session["tongtien"] = tong; 
                mydb.Carts.RemoveRange(cart);
                mydb.SaveChanges();
                string tt = f["txtTT"];
                if(tt.Equals("MoMo"))
                {
                    return RedirectToAction("PayMoMo");
                }    
                else
                {
                    return RedirectToAction("DetailsPay");
                }    
               
            }
            else
            {
                return RedirectToAction("DetailsPay");
            }
        }

        public ActionResult deletePay(int idOr, string strURL)
        {

            Order or = mydb.Orders.Where(n => n.orderID == idOr).FirstOrDefault();
            or.orderStatus = "Đã hủy";
            mydb.SaveChanges();
            return Redirect(strURL);
        }
        [HttpPost]
        public ActionResult deletePay(int idOr,string strURL,FormCollection f)
        {

            Order or = mydb.Orders.Where(n => n.orderID == idOr).FirstOrDefault();
            or.orderStatus = "Đã hủy";
            mydb.SaveChanges();
            string lido = f["txtLiDo"];
            if(lido != null)
            {
                CancelOrder co = new CancelOrder();
                co.id_order = or.orderID;
                co.reason = lido;
                mydb.CancelOrders.Add(co);
                mydb.SaveChanges();
                return Redirect(strURL);
            } 
            else
            {
                return Redirect(strURL);
            }    
        }
        public ActionResult completeOrder(int idOr, string strURL)
        {

            Order or = mydb.Orders.Where(n => n.orderID == idOr).FirstOrDefault();
            or.orderStatus = "Giao hàng thành công";
            mydb.SaveChanges();
            return Redirect(strURL);
        }
        public ActionResult returnProduct(int idOr, string strURL)
        {

            Order or = mydb.Orders.Where(n => n.orderID == idOr).FirstOrDefault();
            or.orderStatus = "Trả hàng";
            mydb.SaveChanges();
            return Redirect(strURL);
        }
        [HttpPost]
        public ActionResult returnProduct(int idOr, string strURL, FormCollection f)
        {

            Order or = mydb.Orders.Where(n => n.orderID == idOr).FirstOrDefault();
            or.orderStatus = "Trả hàng";
            mydb.SaveChanges();
            string lido = f["txtLiDoTraHang"];
            string image = f["txtNameImage"];
            string tt = "Đang chờ xác nhận";
            if (lido != null)
            {
                returnProduct co = new returnProduct();
                co.id_order = or.orderID;
                co.reason = lido;
                co.nameImage = image;
                co.tt = tt;
                mydb.returnProducts.Add(co);
                mydb.SaveChanges();
                return Redirect(strURL);
            }
            else
            {
                return Redirect(strURL);
            }
        }
        public ActionResult orderPhone()
        {
            return View();

        }
        public ActionResult SearchPhone(FormCollection f)
        {
            string txt_sdt = "";
            txt_sdt = f["txt_sdt"];
            var item = mydb.DetailsOrders.Where(n => n.Customer.cusPhone.Equals(txt_sdt)).ToList();
            return View(item);
        }
        public ActionResult cancelOrder(int idOr)
        {
            Order or = mydb.Orders.Where(n => n.orderID == idOr).FirstOrDefault();
            return View(or);
        }
    }
}
