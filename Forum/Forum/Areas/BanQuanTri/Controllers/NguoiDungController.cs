using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class NguoiDungController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult ThanhVien(int iMaQuyen)
        {
            var nguoiDung = db.NguoiDungs.Where(n => n.MaQuyen == iMaQuyen).ToList(); // Thành viên
            return View(nguoiDung);
        }
        // xem chi tiết
        public ActionResult XemChiTiet(string sTaiKhoan)
        {
            var nguoiDung = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan); // Thành viên
            return View(nguoiDung);
        }
        // Xóa Người Dùng
        public ActionResult XoaNguoiDung(string sTaiKhoan)
        {
            var nguoiDung = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan); // Thành viên
            return View(nguoiDung);
        }
        public ActionResult XoaNguoiDungs(string sTaiKhoan)
        {
            try
            {
                var nguoiDung = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan); // Thành viên
                db.NguoiDungs.Remove(nguoiDung);
                db.SaveChanges();
                return RedirectToAction("ThanhCong", "ThongBao");
            }
            catch
            {
                return RedirectToAction("XoaKhongThanhCong", "ThongBao");

            }
        }
        // Cập Nhật Người Dùng
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
            nguoiDung.TrangThai = model.TrangThai;
            // nếu đóng thì đăng xuất đi
            if (model.TrangThai == 1)
            {
                if (Session["TaiKhoan"] == null)
                {
                    return RedirectToAction("TrangDangNhap", "DangNhap");
                }
                NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
                if (tk.TaiKhoan == model.TaiKhoan)
                {
                    Session["TaiKhoan"] = null;
                    return RedirectToAction("TrangDangNhap", "DangNhap");
                }
            }
            Session["TaiKhoan"] = nguoiDung;
            db.SaveChanges();
            return RedirectToAction("ThanhCong", "ThongBao");
        }
        //Bài viết đã Like
        public ActionResult BaiVietDaLike()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
            var like = db.LuotThiches.Where(n => n.TaiKhoan == tk.TaiKhoan).ToList().OrderByDescending(n=>n.NgayThich); // Thành viên
            return View(like);
        } 
        // Bình luận gần đây
        public ActionResult BinhLuanGanDay()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
            var binhLuan = db.BinhLuans.Where(n => n.TaiKhoan == tk.TaiKhoan).ToList().OrderByDescending(n=>n.NgayBinhLuan); // Thành viên
            return View(binhLuan);
        }
    }
}