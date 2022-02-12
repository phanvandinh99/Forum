using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class DanhMucController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult DanhMuc()
        {
            var danhMuc = db.DanhMucs.ToList();
            return View(danhMuc);
        }
    }
}