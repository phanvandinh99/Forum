﻿using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class ChuDeController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult ChuDe_Par()
        {
            var chuDe = db.ChuDes.ToList();
            return PartialView(chuDe);
        }
        // Bài viết mới theo chủ đề
        public ActionResult BaiVietMoiTheoChuDe(int iMaChuDe)
        {
            ViewBag.BaiViet = db.BaiViets.Where(n=>n.MaChuDe==iMaChuDe & n.TrangThai==0).ToList().OrderByDescending(n => n.NgayDang);
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            // Cộng lượt xem khi xem chi tiết
            chuDe.LuotXem++;
            db.SaveChanges();
            return View(chuDe);
        }
        // Hiển thị chủ đề
        public ActionResult ChuDe()
        {
            var chuDe = db.ChuDes.ToList();
            return View(chuDe);
        }
        public ActionResult ThemMoi()
        {
            ViewBag.DanhMuc = db.DanhMucs.ToList();
            return View();
        } 
        [HttpPost]
        public ActionResult ThemMoi(ChuDe model)
        {
            try
            {
                ChuDe cd = new ChuDe();
                cd.TenChuDe = model.TenChuDe;
                cd.MaDanhMuc = model.MaDanhMuc;
                cd.SoBaiViet = 0;
                db.ChuDes.Add(cd);
                var danhMuc = db.DanhMucs.SingleOrDefault(n => n.MaDanhMuc == model.MaDanhMuc);
                danhMuc.SoChuDe = danhMuc.SoChuDe++;
                db.SaveChanges();
                return RedirectToAction("ThanhCong", "ThongBao");
            }
            catch
            {
                return RedirectToAction("ThatBai", "ThongBao");

            }
        }
        // Cập nhật chủ đề
        public ActionResult CapNhat(int iMaChuDe)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            ViewBag.DanhMuc = db.DanhMucs.ToList();
            return View(chuDe);
        } 
        [HttpPost]
        public ActionResult CapNhat(ChuDe model)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == model.MaChuDe);
            chuDe.TenChuDe = model.TenChuDe;
            chuDe.MaDanhMuc = model.MaDanhMuc;
            db.SaveChanges();
            return RedirectToAction("ThanhCong", "ThongBao");
        }
        // xem chi tiết
        public ActionResult XemChiTiet(int iMaChuDe)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            return View(chuDe);
        }
        // Xóa chủ đề
        public ActionResult Xoa(int iMaChuDe)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            return View(chuDe);
        }  
        public ActionResult Xoas(int iMaChuDe)
        {
            try
            {
                var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
                db.ChuDes.Remove(chuDe);
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