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
    }
}