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
        public ActionResult ThemMoi()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemMoi(DanhMuc model)
        {
            try
            {
                DanhMuc dm = new DanhMuc();
                dm.TenDanhMuc = model.TenDanhMuc;
                dm.SoChuDe = 0;
                db.DanhMucs.Add(dm);
                db.SaveChanges();
                return RedirectToAction("ThanhCong", "ThongBao");
            }
            catch
            {
                return RedirectToAction("ThatBai", "ThongBao");

            }
        }
        // Cập nhật chủ đề
        public ActionResult CapNhat(int iMaDanhMuc)
        {
            var danhMuc = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc== iMaDanhMuc);
            return View(danhMuc);
        }
        [HttpPost]
        public ActionResult CapNhat(DanhMuc model)
        {
            var danhMuc = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc == model.MaDanhMuc);
            danhMuc.TenDanhMuc = model.TenDanhMuc;
            db.SaveChanges();
            return RedirectToAction("ThanhCong", "ThongBao");
        }
        // xem chi tiết
        public ActionResult XemChiTiet(int iMaDanhMuc)
        {
            var danhMuc = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc == iMaDanhMuc);
            return View(danhMuc);
        }
        // Xóa danh mục
        public ActionResult Xoa(int iMaDanhMuc)
        {
            var chuDe = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc == iMaDanhMuc);
            return View(chuDe);
        }
        public ActionResult Xoas(int iMaDanhMuc)
        {
            try
            {
                var danhMuc = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc == iMaDanhMuc);
                db.DanhMucs.Remove(danhMuc);
                db.SaveChanges();
                return RedirectToAction("ThanhCong", "ThongBao");
            }
            catch
            {
                return RedirectToAction("XoaKhongThanhCong", "ThongBao");
            }

        }
    }
}