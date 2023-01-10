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
                if (or.Equals("giaothanhcong"))
            {
                var newor = db.Orders.Where(n => n.orderStatus.Equals("Giao hàng thành công")).ToList();
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
                tt = "Giao hàng thành công";
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
    }
}
