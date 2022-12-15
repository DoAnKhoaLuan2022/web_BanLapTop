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
            ViewBag.Prod = new SelectList(db.Products, "id", "Name");
            return View();
        }

        [HttpPost]
        //
        public ActionResult ThemCTPhieuNhap(ChiTietPhieuNhap c, FormCollection f)
        {
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

    }
}
