using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class HomeController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult Index()
        {
            ViewBag.LapTrinh = db.ChuDes.Where(n => n.MaDanhMuc == 1).ToList();
            ViewBag.DoiSong = db.ChuDes.Where(n => n.MaDanhMuc == 2).ToList();
            ViewBag.TheThao = db.ChuDes.Where(n => n.MaDanhMuc == 3).ToList();
            ViewBag.LinhTinh = db.ChuDes.Where(n => n.MaDanhMuc == 4).ToList();
            return View();
        }  
    }
}