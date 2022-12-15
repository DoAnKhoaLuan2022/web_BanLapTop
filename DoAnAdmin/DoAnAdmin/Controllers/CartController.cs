using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;

namespace DoAnAdmin.Controllers
{
    public class CartController : Controller
    {
        //
        // GET: /Cart/
        QL_LaptopEntities mydb = new QL_LaptopEntities();
        public ActionResult AddCart(string id)
        {
           
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            if (item == null)
            {
                ViewBag.ErrM = "Vui lòng đăng nhập để tiếp tục mua hàng !";
                return RedirectToAction("Login", "Customers");
            }
            else
            {
                var a = mydb.Products.Where(n => n.id == id).FirstOrDefault();
                Cart c = new Cart();
                c.proID = id;
                c.cusID = item.cusID;
                c.proPrice = (int)a.price;

                var sll = mydb.Carts.Where(n => n.proID == id).FirstOrDefault();
                if (sll != null)
                {
                    sll.CartQuantity = sll.CartQuantity + 1;
                    sll.CartMoney = sll.CartQuantity * sll.proPrice;
                    mydb.Carts.Attach(sll);
                    mydb.Entry(sll).State = EntityState.Modified;
                    mydb.SaveChanges();
                    ViewBag.Message = "Thêm giỏ hàng thành công";
                    return RedirectToAction("DetailsCart");
                }
                c.CartQuantity = 1;
                c.CartMoney =(int)a.price;
                mydb.Carts.Add(c);
                mydb.SaveChanges();
                ViewBag.Message = "Thêm giỏ hàng thành công";
                return RedirectToAction("ShowAllProducts","Product");
            }

        }
        public ActionResult WindowsMessageLogin()
        {
            return PartialView();
        }
        public ActionResult DetailsCart()
        {
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            if (item != null)
            {
                var cart = mydb.Carts.ToList().Where(n => n.cusID == item.cusID).ToList();
                return View(cart);
            }
            else
            {
                return RedirectToAction("Login", "Customers");
            }

        }
        public ActionResult Delete(string id)
        {
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            if (item != null)
            {
                var cart = mydb.Carts.Where(n => n.proID == id && n.cusID == item.cusID).FirstOrDefault();
                mydb.Carts.Remove(cart);
                mydb.SaveChanges();
                return RedirectToAction("DetailsCart");
            }
            else
            {
                return RedirectToAction("DetailsCart");
            }
        }
        public ActionResult Update(int id)
        {
            //ViewBag.id = id;
            //Session["id"] = id;
            //var item = Session["user"] as DoAnAdmin.Models.Customer;
            //if (item != null)
            //{
            //    var sll = mydb.Carts.Where(n => n.cartID == id).FirstOrDefault();
            //}
            //var item = Session["user"] as DoAnAdmin.Models.Customer;
            //int idCart = int.Parse(f["txt_idCart"].Trim().ToString());
            //if (item != null)
            //{
            //    var sll = mydb.Carts.Where(n => n.cartID == idCart).FirstOrDefault();
            //    if (sll != null)
            //    {
            //        sll.CartQuantity = int.Parse(f["txt_quantity"].Trim().ToString());
            //        sll.CartMoney = int.Parse(f["txt_quantity"].Trim().ToString()) * sll.proPrice;
            //        mydb.SaveChanges();
            //        ViewBag.Message = "Cập nhật thành công";
            //        return RedirectToAction("DetailsCart");
            //    }
            //}
            return RedirectToAction("DetailsCart");
        }
        [HttpPost]
        public ActionResult Update(FormCollection f)
        {
            string quantity = f.GetValues("quantity").FirstOrDefault();
            int so = int.Parse(quantity);
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            string idCart = f.GetValues("idcart").FirstOrDefault();
            int id = int.Parse(idCart);
            if (item != null)
            {
                var sll = mydb.Carts.Where(n => n.cartID == id).FirstOrDefault();
                if (sll != null)
                {
                    sll.CartQuantity = so;
                    sll.CartMoney = so * sll.proPrice;
                    mydb.SaveChanges();
                    ViewBag.Message = "Cập nhật thành công";
                    return RedirectToAction("DetailsCart");
                }
            }
            return RedirectToAction("DetailsCart");
        }
    }
}
