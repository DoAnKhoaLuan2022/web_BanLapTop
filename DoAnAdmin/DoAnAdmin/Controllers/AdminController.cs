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
            if (or.Equals("today"))
            {
                ViewBag.TongDonHang = db.Orders.Where(n => n.orderDate == DateTime.Today).Count();
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
            return View();
        }
        public ActionResult AdminDetailsOrder(int id)
        {
            var item = db.DetailsOrders.Where(n => n.orderID == id).ToList();
            return View(item);
        }
        public ActionResult AdminUpdateStatusOrder(int id)
        {
            ViewBag.orderStatus = new SelectList(db.NameOrderStatus, "NameOrderStatus", "NameOrderStatus");
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
