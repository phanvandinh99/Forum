using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class BaoCaoController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult DanhSachViPham(string sTaiKhoan)
        {
            var viPham = db.ViPhams.Where(n => n.TaiKhoan == sTaiKhoan).ToList();
            return View(viPham);
        }
        public ActionResult ThemMoi(string sTaiKhoan)
        {
            ViewBag.TaiKhoan = sTaiKhoan;
            return View();
        }
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken()]
        public ActionResult ThemMoi(ViPham model)
        {
            try
            {
                if (Session["TaiKhoan"] == null)
                {
                    return RedirectToAction("TrangDangNhap", "DangNhap");
                }
                NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
               
                ViPham vp = new ViPham();
                vp.NoiDungViPham = model.NoiDungViPham;
                vp.TaiKhoan = model.TaiKhoan;
                db.ViPhams.Add(vp);
                db.SaveChanges();
                return RedirectToAction("ThanhCong", "ThongBao");
            }
            catch
            {
                return RedirectToAction("ThatBai", "ThongBao");
            }
        }
    }
}