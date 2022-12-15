using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;
using PagedList;

namespace DoAnAdmin.Controllers
{
    public class CustomersController : Controller
    {
        //
        // GET: /Customers/
       QL_LaptopEntities db = new QL_LaptopEntities();
        public ActionResult Address()
        {
            return View();
        }
        public ActionResult UpdateAddress(string add)
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                Customer d = db.Customers.FirstOrDefault(n => n.cusID == info.cusID);
                d.cusAddress = add;
                db.SaveChanges();
                Session["user"] = d;
                return RedirectToAction("Profile");
            }
            return RedirectToAction("Profile");
        }
        public ActionResult DeleteAddress(int id)
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                CustomerAddress d = db.CustomerAddresses.FirstOrDefault(n => n.ID_address == id);
                db.CustomerAddresses.Remove(d);
                db.SaveChanges();
                return RedirectToAction("Address");
            }
            return RedirectToAction("Profile");
        }
        [HttpPost]
        public ActionResult Address(string txt)
        {
            var info = Session["user"] as DoAnAdmin.Models.Customer;
            if (info != null)
            {
                CustomerAddress d = new CustomerAddress();
                d.cusID = info.cusID;
                d.Name_Address = txt;
                db.CustomerAddresses.Add(d);
                db.SaveChanges();
                return View();
            }
            return View();
        }
        public ActionResult Profile()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult CustomersManager(int? page)
        {
            //1. Tham số int? dùng để thể hiện null và kiểu int
            //Nếu page == null thì gán là mặc định là trang 1
            if (page == null)
                page = 1;
            //Tạo kích thước cho trang (PageSize) hay là số lượng bài hát trên 1 trang
            int pageSize = 10;
            //Nếu page = null thì lấy giá trị 1 cho biến pageNumber
            int pageNumber = (page ?? 1);

            return View(db.Customers.OrderBy(t => t.cusID).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult CustomersManager(int? page, FormCollection f)
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
                return View(db.Customers.Where(i => i.cusID == iTH).OrderBy(t => t.cusID).ToPagedList(pageNumber, pageSize));

            return View(db.Customers.Where(i => i.cusID.ToString() == strS || i.cusName.Contains(strS)).OrderBy(t => t.cusID).ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult Login(string txt_email, string txt_password)
        {
            var item = db.Customers.Where(n => n.cusEmail.Equals(txt_email) && n.cusPassword.Equals(txt_password)).FirstOrDefault();
            if (txt_email.Equals("admin@gmail.com") && txt_password.Equals("123"))
            {
                return RedirectToAction("pageAdmin", "Admin");
            }
            else
            if (item == null)
            {
                ViewBag.ErrorUserPass = "Lỗi Username hoặc Password ! Vui lòng kiểm tra lại !";
                return View();
            }
            else
            {
                Session["user"] = new Customer()
                {
                    cusName = item.cusName,
                    cusEmail = item.cusEmail,
                    cusType = item.cusType,
                    cusPhone = item.cusPhone,
                    cusAddress = item.cusAddress,
                    cusID = item.cusID,
                    cusPassword = item.cusPassword,
                    cusStatus = item.cusStatus

                };

                return RedirectToAction("ShowAllProducts", "Product");
            }

        }
        //hàm random mã xác nhận 
        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());

        }
        public string ma = RandomString(6);
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(string firstname, string lastname, string email, string phone, string password, string passwordConfirmation)
        {
            if (password.Equals(passwordConfirmation) == false)
            {
                ViewBag.ErrorcomfirmPass = "Lỗi nhập password ! Vui lòng kiểm tra lại !";
                return View();
            }
            else
            {
                if (db.Customers.FirstOrDefault(n => n.cusEmail == email) != null)
                {
                    ViewBag.Erroracc = "Tên tài khoản đã tồn tại";
                    return View();
                }
                else
                {
                    Customer c = new Customer()
                    {
                        cusAddress = null,
                        cusStatus = 1,
                        cusType = 1,
                        cusName = firstname + "" + lastname,
                        cusEmail = email,
                        cusPhone = phone,
                        cusPassword = password
                    };
                    Session["regisInfo"] = c;
                    //db.Customers.Add(c);
                    //db.SaveChanges();
                    guimail("nguyennhutnam112@gmail.com", c.cusEmail, "Mã xác nhận", ma);
                    //SendMailGoogleSmtp("nguyennhutnam112@gmail.com", c.cusEmail, "Mã xác nhận", ma, "nguyennhutnam112@gmail.com", "nnnnnn16122001");
                    return RedirectToAction("RequestCodeMail");
                }
            }

        }

    //    public void SendMail(string _from, string _to, string _subject, string _body, SmtpClient client)
    //    {
    //        // Tạo nội dung Email
    //        MailMessage message = new MailMessage(
    //            from: _from,
    //            to: _to,
    //            subject: _subject,
    //            body: _body
    //        );
    //        message.BodyEncoding = System.Text.Encoding.UTF8;
    //        message.SubjectEncoding = System.Text.Encoding.UTF8;
    //        message.IsBodyHtml = true;
    //        message.ReplyToList.Add(new MailAddress(_from));
    //        message.Sender = new MailAddress(_from);
    //        client.SendMailAsync(message);

    //    }
    //public void SendMailGoogleSmtp(string _from, string _to, string _subject,
    //                                                        string _body, string _gmailsend, string _gmailpassword)
    //    {

    //        MailMessage message = new MailMessage(
    //            from: _from,
    //            to: _to,
    //            subject: _subject,
    //            body: _body
    //        );
    //        message.BodyEncoding = System.Text.Encoding.UTF8;
    //        message.SubjectEncoding = System.Text.Encoding.UTF8;
    //        message.IsBodyHtml = true;
    //        message.ReplyToList.Add(new MailAddress(_from));
    //        message.Sender = new MailAddress(_from);

    //        // Tạo SmtpClient kết nối đến smtp.gmail.com
    //        using (SmtpClient client = new SmtpClient("smtp.gmail.com"))
    //        {
    //            client.Port = 587;
    //            client.Credentials = new NetworkCredential(_gmailsend, _gmailpassword);
    //            client.EnableSsl = true;
    //            SendMail(_from, _to, _subject, _body, client);
    //        }

    //    }
        //hàm gửi mail
        public void guimail(string fr, string to, string sub, string nd)
        {
            MailMessage message = new MailMessage(fr, to, sub, nd);
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.Credentials = new NetworkCredential("nguyennhutnam112@gmail.com", "nnnnnn16122001");
            client.Send(message);
        }


        public ActionResult RequestCodeMail()
        {
            var registerInfo = Session["regisInfo"] as DoAnAdmin.Models.Customer;
            string maa = Session["maxacnhan"] as string;
            return View();
        }
        [HttpPost]
        public ActionResult RequestCodeMail(string mx1, string mx2, string mx3, string mx4, string mx5, string mx6)
        {
            string maxacnhan = mx1 + mx2 + mx3 + mx4 + mx5 + mx6;
            var registerInfo = Session["regisInfo"] as DoAnAdmin.Models.Customer;
            string count = ma.ToString();
            if (maxacnhan.Equals(count) == true)
            {
                db.Customers.Add(registerInfo);
                db.SaveChanges();
                return RedirectToAction("Login");
            }
            else
            {
                ViewBag.maxacnhan = "Mã xác nhận không chính xác !";
                return View();
            }

        }

    }
}
