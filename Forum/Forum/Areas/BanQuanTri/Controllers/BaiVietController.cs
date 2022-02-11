using Forum.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class BaiVietController : Controller
    {
        DatabaseForum db = new DatabaseForum();
        public ActionResult DanhSachBaiViet()
        {
            return View();
        }
        public ActionResult BaiVietChuDe(int iMaChuDe)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            ViewBag.BaiViet = db.BaiViets.Where(n => n.MaChuDe == iMaChuDe).OrderByDescending(n => n.MaBaiViet).ToList();
            return View(chuDe);
        }

        // Thêm mới bài viết
        public ActionResult ThemMoiBaiViet(int iMaChuDe)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            return View(chuDe);
        }
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken()]
        public ActionResult ThemMoiBaiViet(BaiViet model, FormCollection f)
        {
            try
            {
                if (Session["TaiKhoan"] == null)
                {
                    return RedirectToAction("TrangDangNhap", "DangNhap");
                }
                NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
                int maChuDe = int.Parse(f["txtMaChuDe".ToString()]);
                BaiViet bv = new BaiViet();
                bv.TenBaiViet = model.TenBaiViet;
                bv.NoiDungBaiViet = model.NoiDungBaiViet;
                bv.NgayDang = DateTime.Now;
                bv.NgayCapNhat = DateTime.Now;
                if (tk.MaQuyen == 1) // admin
                {
                    bv.TrangThai = 0;
                }
                else
                {
                    bv.TrangThai = 1; // Kiểm duyệt
                }
                bv.LuotThich = 0;
                bv.BinhLuan = 0;
                bv.LuotXem = 0;
                bv.MaChuDe = maChuDe;
                bv.TaiKhoan = tk.TaiKhoan;

                // cộng điểm thành tích
                var diem = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == tk.TaiKhoan);
                diem.DiemThanhTich = diem.DiemThanhTich + 5;
                diem.SoBaiViet = diem.SoBaiViet + 1;

                // cộng số lượng trong chủ đề
                var chude = db.ChuDes.SingleOrDefault(n => n.MaChuDe == maChuDe);
                chude.SoBaiViet++;

                db.BaiViets.Add(bv);
                db.SaveChanges();
                Session["TaiKhoan"] = diem;
                return RedirectToAction("BaiViet", "ThongBao");
            }
            catch
            {
                return RedirectToAction("ThatBai", "ThongBao");
            }
        }
        // Xem chi tiết bài viết
        public ActionResult BaiViet(int iMaBaiviet)
        {
            var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == iMaBaiviet);
            baiViet.LuotXem += 1;
            db.SaveChanges();
            // Hiển thị bình luận
            ViewBag.BinhLuan = db.BinhLuans.Where(n => n.MaBaiViet == iMaBaiviet).OrderBy(n => n.MaBinhLuan).ToList();
            return View(baiViet);
        }
    }
}