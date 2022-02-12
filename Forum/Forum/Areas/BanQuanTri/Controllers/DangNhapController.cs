using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class DangNhapController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult TrangDangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TrangDangNhap(FormCollection f)
        {

            // Kiểm tra tên đăng nhập và mật khẩu
            string sTaiKhoan = f["txtTaiKhoan"].ToString();
            string sMatKhau = f["txtMatKhau"].ToString();
            if (sTaiKhoan == "" & sMatKhau == "")
            {
                ModelState.AddModelError("", "Vui loàng nhập tên đăng nhập và mật khẩu của bạn !");
            }
            else if (sTaiKhoan == "")
            {
                ModelState.AddModelError("", "Bạn không được bỏ trống tên đăng nhập !");
            }
            else if (sMatKhau == "")
            {
                ModelState.AddModelError("", "Bạn không được bỏ trống mật khẩu !");
            }
            else
            {
                var tk = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan & n.MatKhau == sMatKhau);

                if (tk == null)
                {
                    ModelState.AddModelError("", "Không hợp lệ, vui lòng nhập lại!");
                    return View();
                }
                else if (tk.TrangThai == 1)
                {
                    ModelState.AddModelError("", "Tài khoản của bạn đã bị khóa !");
                    return View();
                }
                else
                {
                    Session["TaiKhoan"] = tk;
                    return Redirect("/BanQuanTri/Home/Index");
                }
            }

            return View();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("TrangDangNhap", "DangNhap");
        }  
        // Đăng ký tài khoản
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(NguoiDung model)
        {
            try
            {
                NguoiDung nd = new NguoiDung();
                nd.TaiKhoan = model.TaiKhoan;
                nd.MatKhau = model.MatKhau;
                nd.Ho = model.Ho;
                nd.Ten = model.Ten;
                nd.NgaySinh = model.NgaySinh;
                nd.GioiTinh = model.GioiTinh;
                nd.TrangThai = 0;
                nd.HinhAnh = "AnhMacDinh.png";
                nd.DiemThanhTich = 0;
                nd.SoBaiViet = 0;
                nd.MaQuyen = 2;
                db.NguoiDungs.Add(nd);
                db.SaveChanges();
                return RedirectToAction("ThanhCong", "ThongBao");
            }
            catch
            {
                return RedirectToAction("ThatBai", "ThongBao");
            }
        }
        // Cập nhật thông tin cá nhân
        public ActionResult CapNhat(string staiKhoan)
        {
            var nguoiDung = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == staiKhoan);
            return View(nguoiDung);
        } 
        [HttpPost]
        public ActionResult CapNhat(NguoiDung model)
        {
            var nguoiDung = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == model.TaiKhoan);
            nguoiDung.MatKhau = model.MatKhau;
            nguoiDung.Ho = model.Ho;
            nguoiDung.Ten = model.Ten;
            nguoiDung.NgaySinh = model.NgaySinh;
            nguoiDung.GioiTinh = model.GioiTinh;
            Session["TaiKhoan"] = nguoiDung;
            db.SaveChanges();
            return RedirectToAction("ThanhCong", "ThongBao");
        }
    }
}