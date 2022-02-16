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
            ViewBag.BaiVietMoi = db.BaiViets.Where(n => n.TrangThai == 0).ToList().OrderByDescending(n => n.MaBaiViet).Take(5);

            #region Thống kê
            ViewBag.DanhMuc = db.DanhMucs.Count();
            ViewBag.ChuDe = db.ChuDes.Count();
            ViewBag.BaiViet = db.BaiViets.Count();
            ViewBag.ThanhVien = db.NguoiDungs.Where(n => n.MaQuyen == 2).Count();
            ViewBag.BanQuanTri = db.NguoiDungs.Where(n => n.MaQuyen == 1).Count();
            #endregion

            return View();
        }
        public ActionResult DanhMuc_Par()
        {
            var listDanhMuc = db.DanhMucs.ToList();
            return PartialView(listDanhMuc);
        }
        // Hiển thị chủ đề danh mục
        public ActionResult DanhMucChuDe(int iMaDanhMuc)
        {
            var danhMuc = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc == iMaDanhMuc);
            ViewBag.ChuDe = db.ChuDes.Where(n => n.MaDanhMuc == iMaDanhMuc).ToList();

            ViewBag.BaiVietMoi = db.BaiViets.Where(n => n.TrangThai == 0).ToList().OrderByDescending(n => n.MaBaiViet).Take(5);
            #region Thống kê
            ViewBag.DanhMuc = db.DanhMucs.Count();
            ViewBag.ChuDes = db.ChuDes.Count();
            ViewBag.BaiViet = db.BaiViets.Count();
            ViewBag.ThanhVien = db.NguoiDungs.Where(n => n.MaQuyen == 2).Count();
            ViewBag.BanQuanTri = db.NguoiDungs.Where(n => n.MaQuyen == 1).Count();
            #endregion
            return View(danhMuc);
        }
        // Hiển thị bài viết mới
        public ActionResult BaiVietMoi()
        {
            var baiViet = db.BaiViets.ToList().OrderByDescending(n => n.NgayDang);
            return View(baiViet);
        }
    }
}