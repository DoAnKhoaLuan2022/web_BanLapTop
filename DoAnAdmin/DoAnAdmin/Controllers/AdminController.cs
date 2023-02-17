using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;
using System.Data;
using PagedList;
namespace DoAnAdmin.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        //dbQuanLyBanLaptopDataContext db = new dbQuanLyBanLaptopDataContext();

        QL_LaptopEntities db = new QL_LaptopEntities();

        HamXuLy xuLy = new HamXuLy();


        //-----------------------------------------------------------
        public ActionResult pageAdmin(string or)
        {
            if (or == null)
            {
                ViewBag.TongDoanhThu = db.DetailsOrders.Sum(n => n.orderMoney);
                ViewBag.TongDonHang = db.Orders.Count();
                ViewBag.TongCustomer = db.Customers.Count();

            }
            else
            if (or.Equals("month"))
            {
                ViewBag.TongDonHang = db.Orders.Where(n => n.orderDate.Value.Month == DateTime.Now.Month && n.orderDate.Value.Year == DateTime.Now.Year).Count();
                ViewBag.TongDoanhThu = db.DetailsOrders.Where(n => n.Order.orderDate.Value.Month == DateTime.Now.Month && n.Order.orderDate.Value.Year == DateTime.Now.Year).Sum(n => n.orderMoney);
                ViewBag.TongCustomer = db.Customers.Count();
            }
            else
            if (or.Equals("year"))
            {
                ViewBag.TongDonHang = db.Orders.Where(n => n.orderDate.Value.Year == DateTime.Now.Year).Count();
                ViewBag.TongDoanhThu = db.DetailsOrders.Where(n => n.Order.orderDate.Value.Year == DateTime.Now.Year).Sum(n => n.orderMoney);
                ViewBag.TongCustomer = db.Customers.Count();
            }
            else
            if (or.Equals("today"))
            {
                ViewBag.TongDonHang = db.Orders.Where(n => n.orderDate.Value.Day == DateTime.Now.Day && n.orderDate.Value.Year == DateTime.Now.Year && n.orderDate.Value.Month == DateTime.Now.Month).Count();
                ViewBag.TongDoanhThu = db.DetailsOrders.Where(n => n.Order.orderDate.Value.Day == DateTime.Now.Day && n.Order.orderDate.Value.Year == DateTime.Now.Year && n.Order.orderDate.Value.Month == DateTime.Now.Month).Sum(n => n.orderMoney);
                ViewBag.TongCustomer = db.Customers.Count();
            }
            else
            if (or.Equals("all"))
            {
                ViewBag.TongDoanhThu = db.DetailsOrders.Sum(n => n.orderMoney);
                ViewBag.TongDonHang = db.Orders.Count();
                ViewBag.TongCustomer = db.Customers.Count();

            }
            return View();

        }
        //quan ly don hang
        public ActionResult AdminOrder(string or)
        {
            if (or == null)
            {
                var item = db.Orders.ToList();
                return View(item);
            }
            else
                if (or.Equals("new"))
            {
                var newor = db.Orders.Where(n => n.orderStatus.Equals("Đang chờ xác nhận")).ToList();
                return View(newor);
            }
            else
                if (or.Equals("danggiao"))
            {
                var newor = db.Orders.Where(n => n.orderStatus.Equals("Đang giao hàng")).ToList();
                return View(newor);
            }
            else
                if (or.Equals("dagiao"))
            {
                var newor = db.Orders.Where(n => n.orderStatus.Equals("Đã giao hàng")).ToList();
                return View(newor);
            }
            else
                if (or.Equals("giaothanhcong"))
            {
                var newor = db.Orders.Where(n => n.orderStatus.Equals("Giao hàng thành công")).ToList();
                return View(newor);
            }
            else
                if (or.Equals("trahang"))
            {
                var rPro = db.returnProducts;
                List<Order> newor = new List<Order>();
                foreach (var item in rPro)
                {
                    if (item.tt.Equals("Đang chờ xác nhận"))
                    {
                        Order order = db.Orders.Where(n => n.orderID == item.id_order).FirstOrDefault();
                        newor.Add(order);
                    }
                }

                //var newor = db.Orders.Where(n => n.orderStatus.Equals("Trả hàng")).ToList();
                return View(newor);
            }
            else
                if (or.Equals("trahangdanggiao"))
            {
                var rPro = db.returnProducts;
                List<Order> newor = new List<Order>();
                foreach(var item in rPro)
                {
                    if(item.tt.Equals("Đang giao hàng"))
                    {
                        Order order = db.Orders.Where(n => n.orderID == item.id_order).FirstOrDefault();
                        newor.Add(order);
                    }
                }
                    
                //var newor = db.Orders.Where(n => n.orderStatus.Equals("Trả hàng")).ToList();
                return View(newor);
            }
            else
                if (or.Equals("huy"))
            {
                var newor = db.Orders.Where(n => n.orderStatus.Equals("Đã hủy")).ToList();
                return View(newor);
            }
            return View();
        }
        public ActionResult AdminDetailsOrder(int id)
        {
            var item = db.DetailsOrders.Where(n => n.orderID == id).ToList();
            return View(item);
        }
        public ActionResult detailReturnProduct(int id)
        {
            var item = db.returnProducts.Where(n => n.id_order == id).FirstOrDefault();
            return View(item);
        }
        public ActionResult AdminUpdateStatusOrder(int id,string tt)
        {
            string tt2 = "";
            if(tt.Equals("Đang chờ xác nhận"))
            {
                tt = "Đang giao hàng";
                tt2 = "Đã hủy";
            }
            else if(tt.Equals("Đang giao hàng"))
            {
                tt = "Đã giao hàng";
            }
            else if (tt.Equals("Đã giao hàng"))
            {
                tt = "Giao hàng thành công";
                tt2 = "Đã hủy";
            }
            else if (tt.Equals("Đã hủy"))
            {
                tt = "Đang chờ xác nhận";
            }
            else if (tt.Equals("Giao hàng thành công"))
            {
                tt = "Đang chờ xác nhận";
            }
            if (tt.Length != 0 || tt2.Length != 0)
            {
                ViewBag.orderStatus = new SelectList(db.NameOrderStatus.Where(n => n.NameOrderStatus.Equals(tt)||n.NameOrderStatus.Equals(tt2)), "NameOrderStatus", "NameOrderStatus");
            }
            else
            {
                ViewBag.orderStatus = new SelectList(db.NameOrderStatus, "NameOrderStatus", "NameOrderStatus");
            }
                
            
            ViewBag.cusID = new SelectList(db.Customers, "cusID", "cusName");
            var item = db.Orders.FirstOrDefault(n => n.orderID == id);
            return View(item);
        }
        [HttpPost]
        public ActionResult AdminUpdateStatusOrder(Order d)
        {

            db.Orders.Attach(d);
            db.Entry(d).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("AdminOrder");
        }
        public ActionResult deleteReturnOrder(int id)
        {
           
            var oneitem = db.Orders.Where(n => n.orderID == id).FirstOrDefault();

            if (oneitem != null)
            {
                db.Orders.Remove(oneitem);
                db.SaveChanges();
                return RedirectToAction("AdminOrder", "Admin", new { or = "trahang" });
            }
            return RedirectToAction("AdminOrder", "Admin", new { or = "trahang" });

        }
        [HttpPost]
        public ActionResult updateTT(int id, FormCollection f)
        {
            string gender = f["optRadioGender"].ToString();
            var oneitem = db.returnProducts.Where(n => n.id_order == id).FirstOrDefault();
            oneitem.tt = gender;
            db.SaveChanges();
            if(oneitem.tt.Equals("Đang chờ xác nhận"))
            {
                return RedirectToAction("AdminOrder", "Admin", new { or = "trahangdanggiao" });
            }    
            return RedirectToAction("AdminOrder", "Admin", new { or = "trahang" });
        }
        //---------------------------------------------------------quan ly nhan vien ---------------------------------------
        public ActionResult Employees()
        {
            return View(db.Employees.ToList());
        }
        public ActionResult CreateEmployees()
        {
            ViewBag.empRole = new SelectList(db.EmployeesRoles, "empRole", "empRoleName");
            return View();
        }
        [HttpPost]
        public ActionResult CreateEmployees(Employee e)
        {
            db.Employees.Add(e);
            db.SaveChanges();
            return RedirectToAction("Employees");
        }

        public ActionResult DeleteEmployees(int id)
        {
            var item = db.Employees.FirstOrDefault(n => n.empID == id);
            db.Employees.Remove(item);
            db.SaveChanges();
            return RedirectToAction("Employees");
        }


        public ActionResult UpdateEmployees(int id)
        {
            ViewBag.empRole = new SelectList(db.EmployeesRoles, "empRole", "empRoleName");
            return View(db.Employees.FirstOrDefault(n => n.empID == id));
        }
        [HttpPost]
        public ActionResult UpdateEmployees(Employee e)
        {
            db.Employees.Attach(e);
            db.Entry(e).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Employees");
        }
        //---------------------------------------------------------quan ly khach hang ---------------------------------------
        public ActionResult Customers()
        {
            return View(db.Customers.ToList());
        }
        public ActionResult CreateCustomers()
        {
            ViewBag.cusType = new SelectList(db.Customertypes, "cusType", "cusTypeName");
            return View();
        }
        [HttpPost]
        public ActionResult CreateCustomers(Customer e)
        {
            db.Customers.Add(e);
            db.SaveChanges();
            return RedirectToAction("Customers");
        }

        public ActionResult DeleteCustomers(int id)
        {
            var item = db.Customers.FirstOrDefault(n => n.cusID == id);
            db.Customers.Remove(item);
            db.SaveChanges();
            return RedirectToAction("Customers");
        }


        public ActionResult UpdateCustomers(int id)
        {
            return View(db.Customers.FirstOrDefault(n => n.cusID == id));
        }
        [HttpPost]
        public ActionResult UpdateCustomers(Customer e)
        {
            db.Customers.Attach(e);
            db.Entry(e).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Customers");
        }
        [HttpPost]
        public ActionResult thongKeTheoNgay(FormCollection f)
        {
            string bd = f["txtBD"];
            string kt = f["txtKT"];
            string[] datedb = bd.Split('-');
            string[] datekt = kt.Split('-');
            bd = datedb[1] + "-" + datedb[0] + "-" + datedb[2];
            kt = datekt[1] + "-" + datekt[0] + "-" + datekt[2];
            Session["listTopSP"] = null;
            if (bd.Length==0 || kt.Length ==0)
            {
                return RedirectToAction("pageAdmin");
            }
            DateTime dateBD = DateTime.Parse(bd);
            DateTime dateKT = DateTime.Parse(kt);
            int DayBD = dateBD.Day;
            int DayKT = dateKT.Day;
            int MBD = dateBD.Month;
            int MKT = dateKT.Month;
            int NBD = dateBD.Year;
            int NKT = dateKT.Year;

            List<top10SPBanChay> lstSP = new List<top10SPBanChay>();
            var detail = db.DetailsOrders.Where(n => n.Order.orderDate >= dateBD && n.Order.orderDate <= dateKT).Distinct();
            var detail1 = db.DetailsOrders.Where(n => n.Order.orderDate >= dateBD && n.Order.orderDate <= dateKT);
           
            foreach (var item in detail)
            {
                int ptD = 0;
                int i = 0;
                foreach(var item1 in detail1)
                {
                    if(item1.proID.Equals(item.proID))
                    {
                        i++;
                    }    
                }
                ptD ++;
                if(ptD != 1 || ptD != detail.Count())
                {
                    top10SPBanChay a = new top10SPBanChay(item.Product.Name, i, (int)item.proPrice * i);
                    lstSP.Add(a);
                }    
            }
            Session["listTopSP"] = lstSP;
            return RedirectToAction("pageAdmin");
        }
    }
}
