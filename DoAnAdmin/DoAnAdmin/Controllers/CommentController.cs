using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAnAdmin.Models;
using PagedList;

namespace DoAnAdmin.Controllers
{
    public class CommentController : Controller
    {
        //
        // GET: /Comment/
        QL_LaptopEntities mydb = new QL_LaptopEntities();
        public ActionResult Index(string id, int? page)
        {
            if (id.Equals(""))
                return PartialView();
                
            if (page == null)
                page = 1;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            var item = mydb.Comments.Where(n => n.proID == id).ToList().ToPagedList(pageNumber, pageSize);
            return PartialView(item);
        }
        public ActionResult Index()
        {

            return PartialView();
        }
        public ActionResult LoadComment(string id, int page = 1, int size = 4)
        {
            
            var item = mydb.Comments.Where(n => n.proID == id).ToList().ToPagedList(page, size);
            return PartialView(item);
        }
        [HttpPost]
        public ActionResult LoadComment(string id, string msg, int page = 1, int size = 4)
        {
            var cs = HttpContext.Session["user"] as DoAnAdmin.Models.Customer;
            var item = mydb.Comments.Where(n => n.proID == id).ToList().ToPagedList(page, size);
                if (msg != ""&& cs!= null)
                {
                Comment c = new Comment();
                c.cusID = cs.cusID;
                c.proID = id;
                c.comMessage = msg;
                c.comDate = DateTime.Now;
                c.cusemail = cs.cusEmail;
                c.cusName = cs.cusName;
                mydb.Comments.Add(c);
                Session["cm"] = c;
                mydb.SaveChanges();
                return PartialView(item);
                }
            return PartialView(item);
        }

    }
}
