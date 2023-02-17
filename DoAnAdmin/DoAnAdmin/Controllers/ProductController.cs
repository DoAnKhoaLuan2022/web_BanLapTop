using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;
using PagedList;

namespace DoAnAdmin.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/
        QL_LaptopEntities db = new QL_LaptopEntities();
        HamXuLy xuLy = new HamXuLy();

        public ActionResult Index()
        {
            return View();
        }
        //----------------------------------------------Show giao diện--------------------------
        public ActionResult ShowAllProducts(int? page)
        {

            //1. Tham số int? dùng để thể hiện null và kiểu int
            //Nếu page == null thì gán là mặc định là trang 1
            if (page == null)
                page = 1;
            //Tạo kích thước cho trang (PageSize) hay là số lượng bài hát trên 1 trang
            int pageSize = 10;
            //Nếu page = null thì lấy giá trị 1 cho biến pageNumber
            int pageNumber = (page ?? 1);

            //Lấy dữ liệu từ 3 bảng: Products, Detail, Image

            return View(db.Details.Where(t => t.Product.quanlity > 0).OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult HUI()
        {
            var lstOr = db.Orders.Where(n => n.orderStatus.Equals("Giao hàng thành công"));
            var lstDetor = db.DetailsOrders;
            List<GiaoDich> lstGD = new List<GiaoDich>();
            string chuoiGD = "";

            foreach (var item in lstOr)
            {
                string Its = "";
                string quantity = "";
                int tu = 0;
                string u = "";
                foreach (var item1 in lstDetor)
                {
                    if (item.orderID == item1.orderID)
                    {
                        var ctpx = db.ChiTietPhieuNhaps.Where(n => n.product_id == item1.proID).FirstOrDefault();
                        if (ctpx != null)
                        {
                            Its = Its + item1.proID;
                            quantity = quantity + item1.orderQuantity + ",";
                            tu = tu + (int)((ctpx.price_Import * ctpx.ratio / 100) * (item1.orderQuantity));
                            u = u + ((ctpx.price_Import * ctpx.ratio / 100) * (item1.orderQuantity)).ToString() + ",";
                            chuoiGD = chuoiGD + item1.proID + "," + item1.orderQuantity + "," + (ctpx.price_Import * ctpx.ratio / 100) + ",";
                        }

                    }
                }
                GiaoDich gd = new GiaoDich(item.orderID, Its, quantity, u, tu);
                lstGD.Add(gd);
            }
            util(lstGD, chuoiGD);
            return RedirectToAction("pageAdmin","Admin");
        }
        public void util(List<GiaoDich> lst,string chuoiGiaoDich)
        {
            if(lst.Count == 0)
            {
                return;
            }
            var huiOne = db.HUIs.FirstOrDefault();
            if(huiOne!=null)
            {
                db.HUIs.RemoveRange(db.HUIs.ToList());
            }    
            
            int minsup = 1500000;
            string[] gd = chuoiGiaoDich.Split(',');
            List<OneGiaoDich> lstO = new List<OneGiaoDich>();
            for (int i = 0; i < gd.Length - 1; i=i+3)
            {
                OneGiaoDich o = new OneGiaoDich(gd[i],int.Parse(gd[i+2]));
                lstO.Add(o);
                for (int j = i + 1; j < gd.Length - 1; j++)
                {
                    if (ktTonTai(lstO, gd[j]) == false)
                    {
                        lstO.RemoveAt(lstO.Count - 1);
                    }
                }

            }
            string chuoiHoanChinh = "";
            foreach (OneGiaoDich a in lstO)
            {
                chuoiHoanChinh = chuoiHoanChinh + a.Items + ",";
            }
            string chuoiTapHopCon = "";
            List<supOfTransaction> lstSup = new List<supOfTransaction>();
            Session["chuoisanphambanchay"] = chuoiHoanChinh;
            for (int i = 0; i < chuoiHoanChinh.Length; i = i + 10)
            {
                for (int j = 0; j < chuoiHoanChinh.Length - i; j = j + 10)
                {
                    chuoiTapHopCon = chuoiHoanChinh.Substring(i, j + 10);
                    int util = demUtilItems(lst, chuoiTapHopCon);
                    int dem = demSoLanXuatHienItems(lst, chuoiTapHopCon);
                    int tong = util * dem;
                    if (dem != 0&&tong>=minsup)
                    {
                        supOfTransaction sup = new supOfTransaction(chuoiTapHopCon, dem);
                        lstSup.Add(sup);
                        HUI hui = new HUI();
                        hui.itemset = chuoiTapHopCon;
                        hui.Util = util;
                        db.HUIs.Add(hui);
                        db.SaveChanges();
                    }
                }
            }
            lstSup = lstSup.OrderByDescending(n => n.sup).ToList();
            Session["lstSup"] = lstSup;
        }
        public int demSoLanXuatHienItems(List<GiaoDich> lst, string str)
        {
            int i = 0;
            string[] chuoi = str.Split(',');
            string chuoiSS = "";
            for(int j=0;j<chuoi.Count()-1;j++)
            {
                chuoiSS = chuoiSS + chuoi[j];
            }    
            foreach(GiaoDich a in lst)
            {
                if(a.Items.Contains(chuoiSS))
                {
                    i++;
                }    
            }
            return i;
        }
        public int demUtilItems(List<GiaoDich> lst, string str)
        {
            int i = 0;
            string[] chuoi = str.Split(',');
           
            string chuoiSS = "";
            for (int j = 0; j < chuoi.Count() - 1; j++)
            {
                chuoiSS = chuoiSS + chuoi[j];
                var lstUtil = lst.Where(n => n.Items.Length >= 10 && n.Items.Contains(chuoi[0])).FirstOrDefault();
                if(lstUtil != null)
                {
                    string[] ut = lstUtil.u.Split(',');
                    i = i + int.Parse(ut[0]);
                }    
            }
           
            return i;
        }
        public bool ktTonTai(List<OneGiaoDich> lst,string str)
        {
            foreach(OneGiaoDich a in lst)
            {
                if (a.Items == str)
                    return false;
            }
            return true;
        }
        //Trang hiển thị sản phẩm Tai nghe
        public ActionResult ShowProductsTaiNghe(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Products.Where(det => det.productType_id == 3 && det.quanlity > 0);

            return View(listProd.OrderBy(p => p.id).ToPagedList(pageNumber, pageSize));
        }

        //Trang hiển thị sản phẩm bàn phím
        public ActionResult ShowProductsBanPhim(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Products.Where(det => det.productType_id == 4 && det.quanlity > 0);

            return View(listProd.OrderBy(p => p.id).ToPagedList(pageNumber, pageSize));
        }
        //Trang hiển thị sản phẩm chuột
        public ActionResult ShowProductsChuot(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Products.Where(det => det.productType_id == 5 && det.quanlity > 0);

            return View(listProd.OrderBy(p => p.id).ToPagedList(pageNumber, pageSize));
        }
        //Trang hiển thị sản phẩm cục sạc
        public ActionResult ShowProductsCucSac(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Products.Where(det => det.productType_id == 6 && det.quanlity > 0);

            return View(listProd.OrderBy(p => p.id).ToPagedList(pageNumber, pageSize));
        }        
        //Trang hiển thị sản phẩm phụ kiện khác
        public ActionResult ShowProductsPhuKienKhac(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Products.Where(det => det.productType_id == 7 && det.quanlity > 0);

            return View(listProd.OrderBy(p => p.id).ToPagedList(pageNumber, pageSize));
        }
        //Trang hiển thị sản phẩm Macbook
        public ActionResult ShowProductsMacbook(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 1 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }


        public ActionResult ShowProductsKhuyenMaiHome()
        {
            var lstKK = db.promotions;
            
            List<Product> lstProd = new List<Product>();
            foreach(var item in lstKK)
            {
                Product pro = db.Products.Where(det => det.quanlity > 0 && item.product_id == det.id && item.date_end >= DateTime.Now).FirstOrDefault();
                if(pro!=null)
                    lstProd.Add(pro);

            }
            
            return PartialView(lstProd);
        }
        public ActionResult ShowProductsKhuyenMai(int? page)
        {
            var lstKK = db.promotions;
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            List<Product> lstProd = new List<Product>();
            foreach (var item in lstKK)
            {
                Product pro = db.Products.Where(det => det.quanlity > 0 && item.product_id == det.id && item.date_end >= DateTime.Now).FirstOrDefault();
                if (pro != null)
                    lstProd.Add(pro);

            }
            return View(lstProd.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsSPbanChayHome()
        {
            try
            {
                var listProd = db.Products.Where(det => det.quanlity > 0);
                List<HUI> lstSup = db.HUIs.OrderByDescending(n => n.Util).ToList();
                List<Product> lstPro = new List<Product>();
                List<Detail> lstDet = new List<Detail>();
                foreach (var item in listProd)
                {
                    var lienquan = lstSup.Where(n => n.itemset.Contains(item.id) && n.itemset.Length <= 10).FirstOrDefault();
                    if (lienquan == null)
                    {
                        //lstPro = db.Products.ToList();
                    }
                    else
                    {
                        string chuoi = lienquan.itemset;
                        string[] cat = chuoi.Split(',');
                        for (int j = 0; j < cat.Count() - 1; j++)
                        {
                            string k = cat[j];
                            Product pro = db.Products.Where(n => n.id == k).FirstOrDefault();
                            lstPro.Add(pro);
                        }
                    }

                }
                Session["lstPro"] = lstPro;
                return PartialView(lstPro);
            }
            catch
            {
                List<Product> lstPro = db.Products.ToList();
                Session["lstPro"] = lstPro;
                return PartialView(lstPro);
            }
            
        }
        public ActionResult ShowProductsSPbanChay(int? page)
        {
            var lstKK = db.promotions;
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            List<Product> lstProd = Session["lstPro"] as List<Product>;
            return View(lstProd.ToPagedList(pageNumber, pageSize));
        }
        //public ActionResult ShowProductsSPbanChay()
        //{
        //    var listProd = db.Products.Where(det => det.trademark_id == 1 && det.quanlity > 0).ToList();

        //    return PartialView(listProd.ToList());
        //}
        //Trang hiển thị sản phẩm Macbook
        public ActionResult ShowProductsMacbookHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 1 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm Asus
        public ActionResult ShowProductsAsus(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 2 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsAsusHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 2 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm HP
        public ActionResult ShowProductsHP(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 3 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsHPHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 3 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm Lenovo
        public ActionResult ShowProductsLenovo(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 4 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsLenovoHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 4 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm Acer
        public ActionResult ShowProductsAcer(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 5 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsAcerHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 5 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm DELL
        public ActionResult ShowProductsDELL(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 6 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsDellHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 6 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm MSI
        public ActionResult ShowProductsMSI(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 7 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsMSIHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 7 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm LG
        public ActionResult ShowProductsLG(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 8 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsLGHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 8 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        //Trang hiển thị sản phẩm GIGABYTE
        public ActionResult ShowProductsGIGABYTE(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var listProd = db.Details.Where(det => det.Product.trademark_id == 9 && det.Product.quanlity > 0);

            return View(listProd.OrderBy(p => p.product_id).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ShowProductsGIGABYTEHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 9 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        public ActionResult ShowProductsKhacHome()
        {
            var listProd = db.Products.Where(det => det.trademark_id == 10 && det.quanlity > 0);

            return PartialView(listProd.ToList());
        }
        public ActionResult DetailAccessory(string maSP)
        {
            Product prod = db.Products.Single(p => p.id == maSP);
            prod.view_ += 1;
            db.SaveChanges();

            var promPrice = db.promotions.SingleOrDefault(t => t.product_id == maSP && (DateTime.Now >= t.date_start && DateTime.Now <= t.date_end));
            ViewBag.IsKhuyenMai = (promPrice == null) ? 0 : 1;
            accessory DetAcc = db.accessories.FirstOrDefault(p => p.product_id == maSP);
            ViewBag.maSP = maSP;
            return View(DetAcc);
        }
        public ActionResult DetailProduct(string maSP)
        {
            Product prod = db.Products.Single(p => p.id == maSP);
            prod.view_ += 1;
            db.SaveChanges();

            var promPrice = db.promotions.SingleOrDefault(t => t.product_id == maSP && (DateTime.Now >= t.date_start && DateTime.Now <= t.date_end));
            ViewBag.IsKhuyenMai = (promPrice == null) ? 0 : 1;
            Detail DetProd = db.Details.SingleOrDefault(p => p.product_id == maSP);
            ViewBag.maSP = maSP;
            return View(DetProd);
        }
        public ActionResult ThongSoKyThuatGUI(string maSP)
        {
            ViewBag.id = maSP;
            Session["id"] = maSP;
            Detail d = db.Details.Single(t => t.product_id == maSP);
            return View(d);
        }
        public ActionResult ImageProductPartial(string maSP)
        {
            var lstImage = db.Images.Where(p => p.product_id == maSP && p.active == false).OrderBy(t => t.image_);

            return View(lstImage.ToList());
        }
        //Quà khuyến mãi
        public ActionResult PromotionsGiftPartial(string maSP)
        {
            Product p = db.Products.Single(t => t.id == maSP);
            var promotion = db.promotions.Where(t => t.product_id == maSP).FirstOrDefault();
            if(promotion!= null)
                Session["price"] = promotion.price_after;
            else
                Session["price"] = 0;
            var prom = db.PromotionsGifts.SingleOrDefault(t => t.product_id == maSP && (DateTime.Now >= t.date_start && DateTime.Now <= t.date_end));
            if (prom == null)
            {
                return View();
            }
            ViewBag.prom = prom;
            return View(prom);
        }
        //Giá khuyến mãi
        public ActionResult PromotionPricePartial(string maSP)
        {
            Product p = db.Products.Single(t => t.id == maSP);
            Session["price"] = p.price;
            var promPrice = db.promotions.SingleOrDefault(t => t.product_id == maSP && (DateTime.Now >= t.date_start && DateTime.Now <= t.date_end));
            if (promPrice == null)
            {
                return View();
            }
            ViewBag.promPrice = promPrice;
            return View(promPrice);
        }
        //Bài viết đánh giá SP
        public ActionResult BaiVietPartial(string maSP)
        {
            var descr = db.Descriptions.SingleOrDefault(t => t.product_id == maSP);

            if (descr == null)
            { 
                ViewBag.tb = "Chưa có bài viết";
                return View();
            }
            ViewBag.tb = "1";
            return View(descr);
        }
        //Trang hiển thị sản phẩm theo hãng
        public ActionResult ShowProductsByTuVan(int id)
        {
            var listProd = db.Details.Where(det => det.Product.trademark_id == id && det.Product.quanlity > 0).ToList();
            return View(listProd.OrderBy(p => p.product_id).ToList());
        }
        //-------------------------Phần Admin-------------------------
        //Hiển thị sản phẩm (sử dụng phân trang)
        public ActionResult ProductsManager(int? page)
        {
            //1. Tham số int? dùng để thể hiện null và kiểu int
            //Nếu page == null thì gán là mặc định là trang 1
            if (page == null)
                page = 1;
            //Tạo kích thước cho trang
            int pageSize = 10;
            //Nếu page = null thì lấy giá trị 1 cho biến pageNumber
            int pageNumber = (page ?? 1);

            return View(db.Products.OrderBy(t => t.id).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult ProductsManager(int? page, FormCollection f)
        {
            //1. Tham số int? dùng để thể hiện null và kiểu int
            //Nếu page == null thì gán là mặc định là trang 1
            if (page == null)
                page = 1;
            //Tạo kích thước cho trang (PageSize) hay là số lượng bài hát trên 1 trang
            int pageSize = 10;
            //Nếu page = null thì lấy giá trị 1 cho biến pageNumber
            int pageNumber = (page ?? 1);
            string strS = f["txtSearch"];
            int iTH = Convert.ToInt32(f["TH"]);

            //Nếu textbox search rỗng thì lọc theo thương hiệu đang chọn
            if (string.IsNullOrEmpty(strS))
                return View(db.Products.Where(i => i.Trademark.id == iTH).OrderBy(t => t.id).ToPagedList(pageNumber, pageSize));
            
            return View(db.Products.Where(i => i.id == strS || i.Name.Contains(strS)).OrderBy(t => t.id).ToPagedList(pageNumber, pageSize));
        }
        //
        public ActionResult ProductOver()
        {
            return View(db.Products.Where(i => i.quanlity == 0).OrderBy(t => t.id).ToList());
        }
        [HttpPost]
        public ActionResult ProductOver(FormCollection f)
        {
            string strS = f["txtSearch"];
            int iTH = Convert.ToInt32(f["TH"]);

            //Nếu textbox search rỗng thì lọc theo thương hiệu đang chọn
            if (string.IsNullOrEmpty(strS))
                return View(db.Products.Where(i => i.Trademark.id == iTH).OrderBy(t => t.id).ToList());

            return View(db.Products.Where(i => i.id == strS || i.Name.Contains(strS)).OrderBy(t => t.id).ToList());
        }
        //
        public ActionResult ProductSelling()
        {
            return View(db.Products.Where(i => i.purchase >= 10).OrderBy(t => t.id).ToList());
        }
        [HttpPost]
        public ActionResult ProductSelling(FormCollection f)
        {
            string strS = f["txtSearch"];
            int iTH = Convert.ToInt32(f["TH"]);

            //Nếu textbox search rỗng thì lọc theo thương hiệu đang chọn
            if (string.IsNullOrEmpty(strS))
                return View(db.Products.Where(i => i.Trademark.id == iTH).OrderBy(t => t.id).ToList());

            return View(db.Products.Where(i => i.id == strS || i.Name.Contains(strS)).OrderBy(t => t.id).ToList());
        }
        //Mô tả sản phẩm
        public ActionResult ProductDescription(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(db.Descriptions.OrderBy(t => t.product_id).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult ProductDescription(int? page,FormCollection f)
        {
            string strS = f["txtSearch"];
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            //Nếu textbox search rỗng thì lọc theo thương hiệu đang chọn
            if (string.IsNullOrEmpty(strS))
            {
              
                return View(db.Descriptions.OrderBy(t => t.product_id).ToPagedList(pageNumber, pageSize));
            }
            return View(db.Descriptions.Where(n=>n.product_id.Contains(strS)).OrderBy(t => t.product_id).ToPagedList(pageNumber, pageSize));
        }
        //Thêm mô tả sản phẩm
        public ActionResult InsertDescription()
        {
            ViewBag.ProdID = new SelectList(db.Products, "id", "Name");
            return View();
        }
        [HttpPost]
        public ActionResult InsertDescription(Description d)
        {
            ViewBag.ProdID = new SelectList(db.Products, "id", "Name");
            var descr = db.Descriptions.SingleOrDefault(t => t.product_id == d.product_id);
            if (descr != null)
            {
                ViewBag.tb = "Sản phẩm này đã có mô tả!";
                return View();
            }
            if (ModelState.IsValid)
            {
                db.Descriptions.Add(d);
                db.SaveChanges();
                return RedirectToAction("ProductDescription", "Product");
            }

            return View();
        }
        public ActionResult InsertDescriptionIDPro(string idPro)
        {
            ViewBag.ProdID = new SelectList(db.Products.Where(n => n.id == idPro), "id", "id");
            return View();
        }
        [HttpPost]
        public ActionResult InsertDescriptionIDPro(string idPro,Description d)
        {
            ViewBag.ProdID = new SelectList(db.Products.Where(n=>n.id==idPro), "id", "id");
            var descr = db.Descriptions.SingleOrDefault(t => t.product_id == d.product_id);
            if (descr != null)
            {
                ViewBag.tb = "Sản phẩm này đã có mô tả!";
                return View();
            }
            if (ModelState.IsValid)
            {
                db.Descriptions.Add(d);
                db.SaveChanges();
                return RedirectToAction("AddImageIDPro", "Image",new {idPro});
            }

            return View();
        }
        //xóa mô tả
        public ActionResult DeleteDescription(string maSP)
        {
            try
            {
                Description d = db.Descriptions.SingleOrDefault(t => t.product_id == maSP);
                db.Descriptions.Remove(d);
                db.SaveChanges();
                Session["success "] = "Xóa thành công";
                return RedirectToAction("ProductDescription", "Product");
            }
            catch (Exception)
            {
                Session["failed "] = "Không thể xóa dữ liệu này!";
                return RedirectToAction("ProductDescription", "Product");
            }

            
        }
        public ActionResult Accessory(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);

            return View(db.accessories.OrderBy(t => t.ac_ID).ToPagedList(pageNumber, pageSize));
        }

        //Thêm  phụ kiện
        public ActionResult InsertAccessory()
        {
            ViewBag.ProdID = new SelectList(db.Products, "id", "Name");
            ViewBag.ParaID = new SelectList(db.parameters, "paraID", "paraName");
            return View();
        }
        [HttpPost]
        public ActionResult InsertAccessory(accessory d)
        {
            ViewBag.ProdID = new SelectList(db.Products, "id", "Name");
            ViewBag.ParaID = new SelectList(db.parameters, "paraID", "paraName");
            
            if (ModelState.IsValid)
            {
                db.accessories.Add(d);
                db.SaveChanges();
                return RedirectToAction("InsertAccessory", "Product");
            }

            return View();
        }
        // xóa
        public ActionResult deleteAccessory(int id)
        {
            accessory a = db.accessories.Where(n => n.ac_ID == id).FirstOrDefault();
            db.accessories.Remove(a);
            db.SaveChanges();
            return RedirectToAction("Accessory", "Product");
        }
        // Thuộc tính phụ kiện
        public ActionResult Parameter(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(db.parameters.OrderBy(t => t.paraID).ToPagedList(pageNumber, pageSize));
        }

        //Thêm  thuộc tính phụ kiện
        public ActionResult InsertParameter()
        {
            
            ViewBag.TitleID = new SelectList(db.TitleDetailAccessories, "tt_id", "ttName");
            return View();
        }
        [HttpPost]
        public ActionResult InsertParameter(parameter d)
        {
            ViewBag.TitleID = new SelectList(db.TitleDetailAccessories, "tt_id", "ttName");

            if (ModelState.IsValid)
            {
                db.parameters.Add(d);
                db.SaveChanges();
                return RedirectToAction("InsertParameter", "Product");
            }

            return View();
        }
        // xóa
        public ActionResult deleteParameter(int id)
        {
            parameter a = db.parameters.Where(n => n.paraID == id).FirstOrDefault();
            db.parameters.Remove(a);
            db.SaveChanges();
            return RedirectToAction("Parameter", "Product");
        }
        // Tiêu đề chi tiết phụ kiện
        public ActionResult TitleAccessory(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(db.TitleDetailAccessories.OrderBy(t => t.tt_id).ToPagedList(pageNumber, pageSize));
        }

        //Thêm  thuộc tính phụ kiện
        public ActionResult InsertTitleAccessory()
        {

            return View();
        }
        [HttpPost]
        public ActionResult InsertTitleAccessory(TitleDetailAccessory d)
        {

            if (ModelState.IsValid)
            {
                db.TitleDetailAccessories.Add(d);
                db.SaveChanges();
                return RedirectToAction("InsertTitleAccessory", "Product");
            }

            return View();
        }
        // xóa
        public ActionResult deleteTitleAccessory(int id)
        {
            TitleDetailAccessory a = db.TitleDetailAccessories.Where(n => n.tt_id == id).FirstOrDefault();
            db.TitleDetailAccessories.Remove(a);
            db.SaveChanges();
            return RedirectToAction("TitleAccessory", "Product");
        }
        //Thêm sản phẩm
        public ActionResult InsertProduct()
        {
            //Lấy dữ liệu cho dropdown List
            ViewBag.Trademark = new SelectList(db.Trademarks, "id", "Name");
            ViewBag.ProductType = new SelectList(db.ProductTypes, "productType_id", "Name_ProductType");
            return View();
        }
        
        [HttpPost]
        public ActionResult InsertProduct(Product p)
        {
            //Lấy dữ liệu cho dropdown List
            ViewBag.Trademark = new SelectList(db.Trademarks, "id", "Name");
            ViewBag.ProductType = new SelectList(db.ProductTypes, "productType_id", "Name_ProductType");
            if (string.IsNullOrEmpty(p.Name) == true)
            {
                ViewBag.tbName = "Vui lòng nhập tên sản phẩm!";
                return View();
            }
            string idPro;
            if(p.productType_id==1)
            {
                idPro = xuLy.createIDProducts();
            }
            else
            {
                idPro = xuLy.createIDAccessorys();
            }
            p.id = idPro;
            p.quanlity = 0;
            p.purchase = 0;
            p.view_ = 0;
            if (ModelState.IsValid)
            {
                db.Products.Add(p);
                db.SaveChanges();
                //return RedirectToAction("AddImageIDPro", "Image",new {idPro});
                return RedirectToAction("ThemCTPhieuNhapIDPro", "PhieuNhapXuat", new { idPro });
            }
            return View(p);
        }
        public ActionResult deleteProduct(String id)
        {
            
            try
            {
                Product pro = db.Products.Where(n => n.id == id).FirstOrDefault();
                db.Products.Remove(pro);
                db.SaveChanges();
                return RedirectToAction("ProductsManager", "Product");
            }
            catch { return View(); }
        }
        //Cập nhật sản phẩm
        public ActionResult UpdateProduct(string id)
        {
            return View();
        }
        //Thông sô kỹ thuật
        public ActionResult ThongSoKyThuat(string id, string name)
        {
            ViewBag.id = id;
            Session["id"] = id;
            Session["name"] = name;
            //ViewBag.
            try
            {
                Detail d = db.Details.Single(t => t.product_id == id);

                ViewBag.CPU = d.CPU;
                ViewBag.SoNhan = d.SoNhan;
                ViewBag.SoLuong = d.SoLuong;
                ViewBag.Speed = d.Speed;
                ViewBag.MaxSpeed = d.MaxSpeed;
                ViewBag.Cache = d.Cache;

                ViewBag.RAM = d.RAM;
                ViewBag.RAM_type = d.RAM_type;
                ViewBag.BusRAM = d.BusRAM;
                ViewBag.MaxRAM = d.MaxRAM;
                ViewBag.OCung = d.OCung;

                ViewBag.ManHinh = d.ManHinh;
                ViewBag.DoPhanGiai = d.DoPhanGiai;
                ViewBag.TanSoQuet = d.TanSoQuet;
                ViewBag.CongNgheManHinh = d.CongNgheManHinh;

                ViewBag.VGA = d.VGA;
                ViewBag.AmThanh = d.AmThanh;

                ViewBag.CongGiaoTiep = d.CongGiaoTiep;
                ViewBag.KetNoiKhongDay = d.KetNoiKhongDay;
                ViewBag.Webcam = d.Webcam;
                ViewBag.TinhNangKhac = d.TinhNangKhac;
                ViewBag.DenBanPhim = d.DenBanPhim;

                ViewBag.SizeAndWeight = d.SizeAndWeight;
                ViewBag.ChatLieu = d.ChatLieu;

                ViewBag.Pin = d.Pin;
                ViewBag.HeDieuHanh = d.HeDieuHanh;
                ViewBag.RaMat = d.RaMat;
            }
            catch (Exception)
            {
                return View();
            }


            return View();
        }

        [HttpPost]
        public ActionResult ThongSoKyThuat(FormCollection f)
        {
            try
            {
                string id ="";
                if(Session["id"]!=null)
                    id = Session["id"].ToString().Trim();
                Detail d = db.Details.Single(p => p.product_id == id);
                Product prod = db.Products.Single(t => t.id == id);
                prod.Name = f["txtName"].ToString().Trim();
                
                d.CPU = f["txtCPU"].ToString().Trim();
                d.SoNhan = f["txtNhan"].ToString().Trim();
                d.SoLuong = f["txtLuong"].ToString().Trim();
                d.Speed = f["txtSpeedCPU"].ToString().Trim();
                d.MaxSpeed = f["txtMaxSpeed"].ToString().Trim();
                d.Cache = f["txtCache"].ToString().Trim();

                d.RAM = f["txtRAM"].ToString().Trim();
                d.RAM_type = f["txtTypeRAM"].ToString().Trim();
                d.BusRAM = f["txtBusRAM"].ToString().Trim();
                d.MaxRAM = f["txtSuppMaxRam"].ToString().Trim();
                d.OCung = f["txtHardDriver"].ToString().Trim();

                d.ManHinh = f["txtMonitor"].ToString().Trim();
                d.DoPhanGiai = f["txtDoPhanGiai"].ToString().Trim();
                d.TanSoQuet = f["txtTanSoQuet"].ToString().Trim();
                d.CongNgheManHinh = f["txtCNManHinh"].ToString().Trim();

                d.VGA = f["txtVGA"].ToString().Trim();
                d.AmThanh = f["txtCNAmThanh"].ToString().Trim();

                d.CongGiaoTiep = f["txtCongGTiep"].ToString().Trim();
                d.KetNoiKhongDay = f["txtKNKG"].ToString().Trim();
                d.Webcam = f["txtWebcam"].ToString().Trim();
                d.TinhNangKhac = f["txtTNKhac"].ToString().Trim();
                d.DenBanPhim = f["txtDenBanPhim"].ToString().Trim();

                d.SizeAndWeight = f["txtKTTL"].ToString().Trim();
                d.ChatLieu = f["txtChatLieu"].ToString().Trim();

                d.Pin = f["txtPin"].ToString().Trim();
                d.HeDieuHanh = f["txtHDH"].ToString().Trim();
                d.RaMat = f["txtRaMat"].ToString().Trim();

                db.SaveChanges();

                ViewBag.tb = "Cập nhật thành công";
                return RedirectToAction("ProductsManager", "Product");
            }
            catch (Exception)
            {
                ViewBag.tb = "Thêm thất bại";
            }
            return View();
        }
        public ActionResult SearchProducts(string txt_search, int? page)
        {
            Session["search"] = "";
            if (page == null)
                page = 1;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            
            txt_search = txt_search.ToLower();
            Session["search"] = txt_search;
            var item = db.Details.Where(n => n.Product.Name.ToLower().Contains(txt_search)).ToList().ToPagedList(pageNumber, pageSize);
            if(item==null)
            {
                return View("Không tìm thấy kết quả");
            }    
            return View(item);
        }
        public ActionResult locProcduct()
        {
            var lst = db.Details.ToList();
            //return RedirectToAction("allListProduct",new {lst});
            return View(lst);
        }
        [HttpPost]
        public ActionResult locProcduct(FormCollection f)
        {
            try
            {
                string hang = f["txtHang"].ToString();
                string mh = f["txtManHinh"].ToString();
                string sn = f["txtSoNhan"].ToString();
                string ram = f["txtRam"].ToString();
                string rom = f["txtRom"].ToString();
                string gia = f["txtGia"].ToString();

                List<Detail> lst = new List<Detail>();
                List<string> lstHang = new List<string>();
                List<string> lstRam = new List<string>();
                List<string> lstRom = new List<string>();
                List<string> lstMH = new List<string>();
                List<string> lstSN = new List<string>();
                List<string> lstGia = new List<string>();
                Session["loc"] = "";
                string chuoi = "";
                List<Detail> lstLuu = db.Details.ToList();
                if (!hang.Equals(""))
                {
                    chuoi = chuoi + hang;
                    string[] ArrHang = hang.Split(',');

                    for (int i = 0; i < ArrHang.Count() - 1; i++)
                    {
                        lstHang.Add(ArrHang[i].ToString());
                    }
                    int t = 1;
                    foreach (string item in lstHang)
                    {

                        if (lst.Count() != 0 && t == 1)
                        {
                            lst = lst.Where(n => n.Product.Trademark.name.Equals(item.ToString())).ToList();
                        }
                        else if (t == 0 || lst.Count() == 0)
                        {
                            lst = lst.Union(lstLuu.Where(n => n.Product.Trademark.name.Equals(item.ToString()))).ToList();
                            t = 0;
                        }
                    }
                }
                if (!mh.Equals(""))
                {
                    chuoi = chuoi + mh;
                    string[] ArrMH = mh.Split(',');

                    for (int i = 0; i < ArrMH.Count() - 1; i++)
                    {
                        lstMH.Add(ArrMH[i].ToString());
                    }
                    int t = 1;
                    foreach (string item in lstMH)
                    {
                        if (lst.Count() != 0 && t == 1)
                        {
                            lst = lst.Where(n => n.ManHinh.Equals(item)).ToList();
                        }
                        else if (t == 0 || lst.Count() == 0)
                        {
                            lst = lst.Union(lstLuu.Where(n => n.ManHinh.Equals(item))).ToList();
                            t = 0;
                        }

                    }
                }
                if (!gia.Equals(""))
                {
                    chuoi = chuoi + gia;
                    string[] ArrGia = gia.Split(',');

                    for (int i = 0; i < ArrGia.Count() - 1; i++)
                    {
                        lstGia.Add(ArrGia[i].ToString());
                    }
                    int t = 1;
                    int t2 = 1;
                    foreach (string item in lstGia)
                    {
                        if (item.Equals("Dưới 15 triệu"))
                        {

                            if (lst.Count() != 0 && t == 1)
                            {
                                lst = lst.Where(n => n.Product.price < 15000000).ToList();
                            }
                            else if (t == 0 || lst.Count() == 0)
                            {
                                lst = lst.Union(lstLuu.Where(n => n.Product.price < 15000000)).ToList();
                                t = 0;
                            }
                        }
                        else if (item.Equals("Từ 15 - 20 triệu"))
                        {
                            if (lst.Count() != 0 && t == 1 || t2 == 1)
                            {
                                lst = lst.Where(n => n.Product.price >= 15000000 && n.Product.price < 20000000).ToList();
                            }
                            else if (t == 0 || lst.Count() == 0 || t2 != 1)
                            {
                                lst = lst.Union(lstLuu.Where(n => n.Product.price >= 15000000 && n.Product.price < 20000000)).ToList();
                                t = 0;
                            }
                        }
                        else if (item.Equals("Từ 20 - 30 triệu"))
                        {

                            if (lst.Count() != 0 && t == 1)
                            {
                                lst = lst.Where(n => n.Product.price >= 20000000 && n.Product.price < 30000000).ToList();
                            }
                            else if (t == 0 || lst.Count() == 0)
                            {
                                lst = lst.Union(lstLuu.Where(n => n.Product.price >= 20000000 && n.Product.price < 30000000)).ToList();
                                t = 0;
                            }
                        }
                        else if (item.Equals("Từ 30 - 40 triệu"))
                        {

                            if (lst.Count() != 0 && t == 1)
                            {
                                lst = lst.Where(n => n.Product.price >= 30000000 && n.Product.price <= 40000000).ToList();
                            }
                            else if (t == 0 || lst.Count() == 0)
                            {
                                lst = lst.Union(lstLuu.Where(n => n.Product.price >= 30000000 && n.Product.price <= 40000000)).ToList();
                                t = 0;
                            }
                        }
                        else
                        {

                            if (lst.Count() != 0 && t == 1)
                            {
                                lst = lst.Where(n => n.Product.price > 40000000).ToList();
                            }
                            else if (t == 0 || lst.Count() == 0)
                            {
                                lst = lst.Union(lstLuu.Where(n => n.Product.price > 40000000)).ToList();
                                t = 0;
                            }
                        }
                    }

                }
                if (!sn.Equals(""))
                {
                    chuoi = chuoi + sn;
                    string[] ArrSN = sn.Split(',');

                    for (int i = 0; i < ArrSN.Count() - 1; i++)
                    {
                        lstSN.Add(ArrSN[i].ToString());
                    }
                    int t = 1;
                    foreach (string item in lstSN)
                    {

                        if (lst.Count() != 0 && t == 1)
                        {
                            lst = lst.Where(n => n.SoNhan.Equals(item)).ToList();
                        }
                        else if (t == 0 || lst.Count() == 0)
                        {
                            lst = lst.Union(lstLuu.Where(n => n.SoNhan.Equals(item))).ToList();
                            t = 0;
                        }
                    }
                }
                if (!ram.Equals(""))
                {
                    chuoi = chuoi + ram;
                    string[] ArrRam = ram.Split(',');

                    for (int i = 0; i < ArrRam.Count() - 1; i++)
                    {
                        lstRam.Add(ArrRam[i].ToString());
                    }
                    int t = 1;
                    foreach (string item in lstRam)
                    {
                        if (lst.Count() != 0 && t == 1)
                        {
                            lst = lst.Where(n => n.RAM.Equals(item)).ToList();
                        }
                        else if (t == 0 || lst.Count() == 0)
                        {
                            lst = lst.Union(lstLuu.Where(n => n.RAM.Equals(item))).ToList();
                            t = 0;
                        }
                    }
                }
                if (!rom.Equals(""))
                {
                    chuoi = chuoi + rom;
                    string[] ArrRom = rom.Split(',');

                    for (int i = 0; i < ArrRom.Count() - 1; i++)
                    {
                        lstRom.Add(ArrRom[i].ToString());
                    }
                    int t = 1;
                    foreach (string item in lstRom)
                    {
                        if (lst.Count() != 0 && t == 1)
                        {
                            lst = lst.Where(n => n.OCung.Contains(item)).ToList();
                        }
                        else if (t == 0 || lst.Count() == 0)
                        {
                            lst = lst.Union(lstLuu.Where(n => n.OCung.Contains(item))).ToList();
                            t = 0;
                        }
                    }
                }
                foreach (var item in lst)
                {
                    lst.Distinct().ToList();
                }
                if (chuoi != null)
                {
                    if (chuoi[chuoi.Length - 1].Equals(","))
                    {
                        chuoi = chuoi.Substring(0, chuoi.Length - 2);
                    }
                    else
                    {
                        chuoi = chuoi.Substring(0, chuoi.Length - 1);
                    }
                }
                else
                {
                    chuoi = ",";
                }
                Session["loc"] = chuoi;
                string[] mang = chuoi.Split(',');
                List<ChonLoc> lstCL = new List<ChonLoc>();
                for (int i = 0; i < mang.Count(); i++)
                {
                    ChonLoc c = new ChonLoc(mang[i], true);
                    lstCL.Add(c);
                }
                Session["chonloc"] = lstCL;
                Session["ProductLoc"] = lst;
                return RedirectToAction("allListProduct");
            }
            catch
            {
                return RedirectToAction("allListProduct");
            }
           
        }
        public ActionResult allListProduct(int? page)
        {
            if (page == null)
                page = 1;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            List<Detail> lst = Session["ProductLoc"] as List<Detail>;
            if(lst.Count() == 0)
            {
                return RedirectToAction("allListProductEmpty");
            }    
            return View(lst.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult allListProductEmpty()
        {
            return View();
        }

        
    }
}
