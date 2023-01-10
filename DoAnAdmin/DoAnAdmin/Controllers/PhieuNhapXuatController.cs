using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;
using PagedList;

namespace DoAnAdmin.Controllers
{
    public class PhieuNhapXuatController : Controller
    {
        //
        // GET: /PhieuNhapXuat/
        QL_LaptopEntities db = new QL_LaptopEntities();
        HamXuLy xuLy = new HamXuLy();

        public ActionResult Index()
        {
            return View();
        }


        //Phiếu nhập
        public ActionResult PhieuNhap(int? page)
        {
            //1. Tham số int? dùng để thể hiện null và kiểu int
            //Nếu page == null thì gán là mặc định là trang 1
            if (page == null)
                page = 1;
            //Tạo kích thước cho trang (PageSize) hay là số lượng bài hát trên 1 trang
            int pageSize = 15;
            //Nếu page = null thì lấy giá trị 1 cho biến pageNumber
            int pageNumber = (page ?? 1);

            return View(db.PhieuNhaps.OrderBy(t => t.id).ToPagedList(pageNumber, pageSize));
        }
        //Chi tiết Phiếu nhập
        public ActionResult ChiTietPhieuNhap(string id)
        {
            return View(db.ChiTietPhieuNhaps.Where(t => t.PhieuNhap_id == id).OrderBy(t => t.product_id).ToList());
        }
        //Thêm phiếu nhập
        public ActionResult ThemCTPhieuNhap()
        {
            string maPN = xuLy.createIDPhieuNhap();
            Session["id"] = maPN;
            ViewBag.id = maPN;
            //Thêm vào phiếu nhập
            PhieuNhap p = new PhieuNhap();
            p.id = ViewBag.id;
            p.employee_id = null;//Admin
            p.date_ = DateTime.Now;

            db.PhieuNhaps.Add(p);
            db.SaveChanges();
            //Lấy dữ liệu cho dropdown List
            ViewBag.Emloy = new SelectList(db.Employees, "empID", "empName");
            ViewBag.Prod = new SelectList(db.Products, "id", "Name");
            return View();
        }

        [HttpPost]
        //
        public ActionResult ThemCTPhieuNhap(ChiTietPhieuNhap c, FormCollection f)
        {
            ViewBag.Emloy = new SelectList(db.Employees, "empID", "empName");
            ViewBag.Prod = new SelectList(db.Products, "id", "Name");
            if (xuLy.kiemTraKhoaChinhOnCTPN(f["txtID"].ToString(), c.product_id) == true)
            {
                ViewBag.tb = "Bạn đã nhập sản phẩm của phiếu nhập này rồi";
                return View();
            }
            try
            {
                c.PhieuNhap_id = f["txtID"].ToString();
                c.quanlity = int.Parse(f["txtQuanlity"]);
                c.price_Import = int.Parse(f["txtImport"]);
                c.ratio = int.Parse(f["txtRatio"]);
                db.ChiTietPhieuNhaps.Add(c);
                db.SaveChanges();

                ViewBag.tb = "Thêm thành công";
            }
            catch (Exception)
            {
                ViewBag.tb = "Thêm thất bại";
            }
            return View();
        }
        //Thêm phiếu nhập
        public ActionResult ThemCTPhieuNhapIDPro(string idPro)
        {
            string maPN = xuLy.createIDPhieuNhap();
            Session["id"] = maPN;
            ViewBag.id = maPN;
            //Thêm vào phiếu nhập
            PhieuNhap p = new PhieuNhap();
            p.id = ViewBag.id;
            p.employee_id = 1;//Admin
            p.date_ = DateTime.Now;

            db.PhieuNhaps.Add(p);
            db.SaveChanges();
            //Lấy dữ liệu cho dropdown List
            ViewBag.Emloy = new SelectList(db.Employees, "empID", "empName");
            ViewBag.Prod = new SelectList(db.Products.Where(n => n.id == idPro), "id", "id");
            ViewBag.idAddNhap = idPro;
            return View();
        }

        [HttpPost]
        //
        public ActionResult ThemCTPhieuNhapIDPro(string idPro,ChiTietPhieuNhap c, FormCollection f)
        {
            ViewBag.Emloy = new SelectList(db.Employees, "empID", "empName");
            
            ViewBag.Prod = new SelectList(db.Products.Where(n => n.id == idPro), "id", "id");
            ViewBag.idAddNhap = idPro;
            if (xuLy.kiemTraKhoaChinhOnCTPN(f["txtID"].ToString(), c.product_id) == true)
            {
                ViewBag.tb = "Bạn đã nhập sản phẩm của phiếu nhập này rồi";
                return View();
            }
            try
            {
                c.PhieuNhap_id = f["txtID"].ToString();
                c.quanlity = int.Parse(f["txtQuanlity"]);
                c.price_Import = int.Parse(f["txtImport"]);
                c.ratio = int.Parse(f["txtRatio"]);
                db.ChiTietPhieuNhaps.Add(c);
                db.SaveChanges();

                ViewBag.tb = "Thêm thành công";
                return RedirectToAction("InsertDescriptionIDPro","Product",new { idPro});
            }
            catch (Exception)
            {
                ViewBag.tb = "Thêm thất bại";
            }
            return View();
        }
        public ActionResult HoaDonKH(int maHD)
        {
            ViewBag.maHD = maHD;
            Session["MaHD"] = maHD;
            var px = db.Orders.Single(t => t.orderID == maHD);
            int tong = 0;
            var lstDetOr = db.DetailsOrders.Where(n => n.orderID == maHD);
            foreach(var item in lstDetOr)
            {
                tong = tong + (int)(item.orderQuantity * item.proPrice);
            }
                
            ViewBag.address = px.Customer.cusAddress;
            ViewBag.name = px.Customer.cusName;
            ViewBag.phone = px.Customer.cusPhone;
            ViewBag.total = tong;

            Session["address"] = px.Customer.cusAddress;
            Session["name"] = px.Customer.cusName;
            Session["phone"] = px.Customer.cusPhone;
            Session["GioHang"] = null; 

            return View(db.DetailsOrders.Where(p => p.orderID == maHD).ToList());
        }
        [HttpPost]
        public ActionResult HoaDonKH(FormCollection f)
        {
            int maHD = (Session["MaHD"] != null) ? int.Parse(Session["MaHD"].ToString()) :0 ;
            ViewBag.maHD = maHD;
            var px = db.Orders.Single(t => t.orderID == maHD);
            var lstDetOr = db.DetailsOrders.Where(n => n.orderID == maHD);
            int tong = 0;
            foreach (var item in lstDetOr)
            {
                tong = tong + (int)(item.orderQuantity * item.proPrice);
            }
            ViewBag.total = tong;

            var lstHD = db.DetailsOrders.Where(p => p.orderID == maHD).ToList();
            //Kiểm tra Input
            if (string.IsNullOrEmpty(f["txtHoTen"]))
            {
                ViewBag.tbHoTen = "Vui lòng cho biết họ tên của bạn";
                return View(db.DetailsOrders.Where(p => p.orderID == maHD).ToList());
            }
            if (string.IsNullOrEmpty(f["txtSdt"]))
            {
                ViewBag.tbSDT = "Vui lòng nhập số điện thoại";
                return View(lstHD);
            }
            if (string.IsNullOrEmpty(f["txtAddress"]))
            {
                ViewBag.tbDiaChi = "Vui lòng nhập địa chỉ khi nhận hàng";
                return View(lstHD);
            }
            string phoneNew = f["txtSdt"].ToString();
            string nameNew = f["txtHoTen"].ToString();
            string addressNew = f["txtAddress"].ToString();

            //Kiểm tra sdt mới có trùng với các khách hàng còn lại hay không
            string sdtOld = (Session["phone"] != null) ? Session["phone"].ToString() : "";
            var customerKT = db.Customers.SingleOrDefault(t => t.cusID != px.cusID && t.cusPhone == phoneNew);
            if (customerKT != null)
            {
                ViewBag.tbSDT = "Số điện thoại đã tồn tại!";
                return View(lstHD);
            }
            else
            {
                Customer cusUpd = db.Customers.Single(c => c.cusID == px.cusID);
                cusUpd.cusPhone = phoneNew;
                cusUpd.cusName = nameNew;
                cusUpd.cusAddress = addressNew;

                db.SaveChanges();
                ViewBag.tbThanhCong = "Cập nhật thành công";
            }
            ViewBag.address = addressNew;
            ViewBag.name = nameNew;
            ViewBag.phone = phoneNew;
            //px.customer_id = IDKH;
            return View(db.DetailsOrders.Where(p => p.orderID == maHD).ToList());
        }


    }
}
