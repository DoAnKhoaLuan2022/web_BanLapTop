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
        //public ActionResult AddCart(string id)
        //{
           
        //    var item = Session["user"] as DoAnAdmin.Models.Customer;
        //    if (item == null)
        //    {
        //        //ViewBag.ErrM = "Vui lòng đăng nhập để tiếp tục mua hàng !";
        //        //return RedirectToAction("Login", "Customers");
        //        List<GioHang> lstCart = LayGioHang();
        //        //kiem tra sp nay da ton tai trong session[GioHang] chuaw
        //        GioHang SanPham = lstCart.Find(sp => sp.sIdSP == id);
        //        if (SanPham == null)//chua co trong gio
        //        {
        //            SanPham = new GioHang(id);
        //            lstCart.Add(SanPham);
        //            return RedirectToAction("ShowAllProducts", "Product");
                    
        //        }
        //        else  ///da co san pham nay trong gio
        //        {
        //            SanPham.iSoLuong++;
                    
        //            return RedirectToAction("ShowAllProducts", "Product");
        //        }
        //    }
        //    else
        //    {
        //        var a = mydb.Products.Where(n => n.id == id).FirstOrDefault();
        //        Cart c = new Cart();
        //        c.proID = id;
        //        c.cusID = item.cusID;
        //        c.proPrice = (int)a.price;

        //        var sll = mydb.Carts.Where(n => n.proID == id).FirstOrDefault();
        //        if (sll != null)
        //        {
        //            sll.CartQuantity = sll.CartQuantity + 1;
        //            sll.CartMoney = sll.CartQuantity * sll.proPrice;
        //            mydb.Carts.Attach(sll);
        //            mydb.Entry(sll).State = EntityState.Modified;
        //            mydb.SaveChanges();
        //            ViewBag.Message = "Thêm giỏ hàng thành công";
        //            return RedirectToAction("DetailsCart");
        //        }
        //        c.CartQuantity = 1;
        //        c.CartMoney =(int)a.price;
        //        mydb.Carts.Add(c);
        //        mydb.SaveChanges();
        //        ViewBag.Message = "Thêm giỏ hàng thành công";
        //        return RedirectToAction("ShowAllProducts","Product");
        //    }

        //}
        public ActionResult AddCart(string id,string strURL)
        {

            var item = Session["user"] as DoAnAdmin.Models.Customer;
            if (item == null)
            {
                //ViewBag.ErrM = "Vui lòng đăng nhập để tiếp tục mua hàng !";
                //return RedirectToAction("Login", "Customers");
                List<GioHang> lstCart = LayGioHang();
                //kiem tra sp nay da ton tai trong session[GioHang] chuaw
                GioHang SanPham = lstCart.Find(sp => sp.sIdSP == id);
                if (SanPham == null)//chua co trong gio
                {
                    SanPham = new GioHang(id);
                    lstCart.Add(SanPham);
                    return Redirect(strURL);

                }
                else  ///da co san pham nay trong gio
                {
                    SanPham.iSoLuong++;
                    return Redirect(strURL);
                }
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
                    return Redirect(strURL);
                }
                c.CartQuantity = 1;
                c.CartMoney = (int)a.price;
                mydb.Carts.Add(c);
                mydb.SaveChanges();
                ViewBag.Message = "Thêm giỏ hàng thành công";
                return Redirect(strURL);
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
                if (Session["GioHang"] == null)
                {
                    return RedirectToAction("EmptyCart", "Cart");
                }
                List<GioHang> lstGioHang = LayGioHang();

                //neu gio hang rong
                if (lstGioHang.Count == 0)
                {
                    return RedirectToAction("EmptyCart", "Cart");
                }

                ViewBag.TongSoLuong = TongSoLuong();
                ViewBag.TongThanhTien = TongThanhTien();

                return View(lstGioHang);
                //return RedirectToAction("Login", "Customers");
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
        public ActionResult updateTang(string id)
        {
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            if (item != null)
            {
                var cart = mydb.Carts.Where(n => n.proID == id && n.cusID == item.cusID).FirstOrDefault();
                int slTon = (int)cart.Product.quanlity;
                if(cart.CartQuantity >= slTon)
                {
                    return RedirectToAction("DetailsCart");
                }    
                else
                {
                    cart.CartQuantity = cart.CartQuantity + 1;
                    mydb.SaveChanges();
                    return RedirectToAction("DetailsCart");
                }    
            }
            else
            {
                return RedirectToAction("DetailsCart");
            }
        }
        public ActionResult updateGiam(string id)
        {
            var item = Session["user"] as DoAnAdmin.Models.Customer;
            if (item != null)
            {
                var cart = mydb.Carts.Where(n => n.proID == id && n.cusID == item.cusID).FirstOrDefault();
                if (cart.CartQuantity <= 1)
                {
                    mydb.Carts.Remove(cart);
                    mydb.SaveChanges();
                    return RedirectToAction("DetailsCart");
                }
                else
                {
                    cart.CartQuantity = cart.CartQuantity - 1;
                    mydb.SaveChanges();
                    return RedirectToAction("DetailsCart");
                }
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
        //[HttpPost]
        //public ActionResult Update(FormCollection f)
        //{
        //    string quantity = f.GetValues("quantity").FirstOrDefault();
        //    int so = int.Parse(quantity);
        //    var item = Session["user"] as DoAnAdmin.Models.Customer;
        //    string idCart = f.GetValues("idcart").FirstOrDefault();
        //    int id = int.Parse(idCart);
        //    if (item != null)
        //    {
        //        var sll = mydb.Carts.Where(n => n.cartID == id).FirstOrDefault();
        //        if (sll != null)
        //        {
        //            sll.CartQuantity = so;
        //            sll.CartMoney = so * sll.proPrice;
        //            mydb.SaveChanges();
        //            ViewBag.Message = "Cập nhật thành công";
        //            return RedirectToAction("DetailsCart");
        //        }
        //    }
        //    return RedirectToAction("DetailsCart");
        //}
        public ActionResult EmptyCart()
        {
            return View();
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                //neu lstgiohang chua ton tai thi khoi tao
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //them vao gio hang
        public ActionResult ThemGioHang(string idsp, string strURL)
        {
            ///Lay ra gio hang
            List<GioHang> lstCart = LayGioHang();
            //kiem tra sp nay da ton tai trong session[GioHang] chuaw
            GioHang SanPham = lstCart.Find(sp => sp.sIdSP == idsp);
            if (SanPham == null)//chua co trong gio
            {
                SanPham = new GioHang(idsp);
                lstCart.Add(SanPham);
                return Redirect(strURL);
            }
            else  ///da co san pham nay trong gio
            {
                SanPham.iSoLuong++;
                return Redirect(strURL);
            }
        }
        //Cap nhat
        public ActionResult updateGiamNotAc(string id)
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            GioHang gh = lstGioHang.Where(n => n.sIdSP.Equals(id)).FirstOrDefault();
            Product pro = mydb.Products.Where(n => n.id == id).FirstOrDefault();
            if (gh.iSoLuong <= 1)
            {
                lstGioHang.Remove(gh);
                if (lstGioHang == null)
                {
                    return RedirectToAction("EmptyCart", "Cart");
                }
                return RedirectToAction("Cart", "Cart");
            }
            else
            {
                gh.iSoLuong = gh.iSoLuong - 1;
                return RedirectToAction("Cart", "Cart");
            }

        }
        public ActionResult updateTangNotAc(string id)
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            GioHang gh = lstGioHang.Where(n => n.sIdSP.Equals(id)).FirstOrDefault();
            Product pro = mydb.Products.Where(n => n.id == id).FirstOrDefault();
            if (gh.iSoLuong >= pro.quanlity)
            {
                return RedirectToAction("Cart", "Cart");
            }
            else
            {
                gh.iSoLuong = gh.iSoLuong + 1;
                return RedirectToAction("Cart", "Cart");
            }
        }
        ///Tong so luong
        private int TongSoLuong()
        {
            int tsl = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                tsl = lstGioHang.Sum(sp => sp.iSoLuong);
            }
            return tsl;
        }

        ///Tong thanh tien
        private decimal TongThanhTien()
        {
            decimal ttt = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                ttt += lstGioHang.Sum(sp => sp.dThanhTien);
            }
            return ttt;

        }
        //trang gio hang
        public ActionResult Cart()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("EmptyCart", "Cart");
            }
            List<GioHang> lstGioHang = LayGioHang();

            //neu gio hang rong
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("EmptyCart", "Cart");
            }

            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongThanhTien = TongThanhTien();

            return View(lstGioHang);
        }
        [HttpPost]//Khi KH Đặt hàng
        public ActionResult Cart(FormCollection f)
        {
            try
            {
                //Kiểm tra Input
                if (string.IsNullOrEmpty(f["txtHoTen"]))
                {
                    ViewBag.tbHoTen = "Vui lòng cho biết họ tên của bạn";
                    return RedirectToAction("Cart", "Cart");
                }
                if (string.IsNullOrEmpty(f["txtSdt"]))
                {
                    ViewBag.tbSDT = "Vui lòng nhập số điện thoại";
                    return RedirectToAction("Cart", "Cart");
                }
                if (string.IsNullOrEmpty(f["txtAddress"]))
                {
                    ViewBag.tbDiaChi = "Vui lòng nhập địa chỉ khi nhận hàng";
                    return RedirectToAction("Cart", "Cart");
                }

                if (Session["GioHang"] != null)
                {
                    List<GioHang> lstCart = Session["GioHang"] as List<GioHang>;
                    string phone = f["txtSdt"].ToString();
                    string name = f["txtHoTen"].ToString();
                    string address = f["txtAddress"].ToString();

                    Order px = new Order();
                    px.empID = null;
                    px.orderDate = DateTime.Now;
                    px.orderStatus = "Đang chờ xác nhận";

                    //Kiểm tra nếu sđt khách hàng chưa có trong bảng KhachHang thì thêm mới KH
                    var customer = mydb.Customers.SingleOrDefault(t => t.cusPhone == phone);
                    if (customer == null)
                    {

                        string gender = f["optRadioGender"].ToString();
                        Customer cus = new Customer();

                        cus.cusName = name;
                        cus.cusPhone = phone;
                        cus.cusAddress = address;
                        cus.cusGender = gender;
                        cus.cusPassword = null;
                        cus.cusQuantityBuy = 0;
                        cus.cusTotal = 0;
                        cus.cusType = 1;
                        cus.cusStatus = 1;
                        cus.cusEmail = null;
                        mydb.Customers.Add(cus);
                        mydb.SaveChanges();
                    }
                    else//
                    {
                        return RedirectToAction("Login", "Customers");
                    }
                    int maKH = mydb.Customers.Where(n => n.cusPhone == phone).FirstOrDefault().cusID;
                    //Thêm Phiếu xuất
                    px.cusID = maKH;
                    mydb.Orders.Add(px);
                    mydb.SaveChanges();
                    int maPX = mydb.Orders.Max(n => n.orderID);

                    //Thêm chiTietPX
                    foreach (GioHang c in lstCart)
                    {
                        DetailsOrder ctpx = new DetailsOrder();
                        ctpx.orderID = maPX;
                        ctpx.cusID = maKH;
                        ctpx.proID = c.sIdSP;
                        ctpx.orderQuantity = c.iSoLuong;
                        ctpx.proPrice = (int)c.dDetailPrice;
                        ctpx.orderMoney = (int)c.dThanhTien;
                        mydb.DetailsOrders.Add(ctpx);
                        mydb.SaveChanges();
                    }

                    return RedirectToAction("HoaDonKH", "PhieuNhapXuat", new { maHD = maPX });
                }
            }
            catch (Exception)
            {
                return RedirectToAction("Cart", "Cart");
            }
            return RedirectToAction("Cart", "Cart");
        }
        public ActionResult XoaGiohang(string MaSP)
        {
            //Lay gio hang
            List<GioHang> lstGioHang = LayGioHang();
            ///kiem tra xem sach can xoa co trong gio hang khong
            GioHang sp = lstGioHang.Single(s => s.sIdSP == MaSP);

            //neu co thi tien hanh xoa
            if (sp != null)
            {
                lstGioHang.RemoveAll(s => s.sIdSP == MaSP);
                //neu gio hang rong
                if (lstGioHang.Count == 0)
                {
                    return RedirectToAction("EmptyCart", "Cart");
                }
                return RedirectToAction("Cart", "Cart");
            }
            return RedirectToAction("Cart", "Cart");
        }
    }
}
