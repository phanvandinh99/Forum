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
        // Xem danh sách bài viết theo chủ đề
        public ActionResult BaiVietChuDe(int iMaChuDe)
        {
            var chuDe = db.ChuDes.SingleOrDefault(n => n.MaChuDe == iMaChuDe);
            chuDe.LuotXem++;
            ViewBag.BaiViet = db.BaiViets.Where(n => n.MaChuDe == iMaChuDe & n.TrangThai == 0).OrderByDescending(n => n.MaBaiViet).ToList();
            db.SaveChanges();
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
                    // cộng số lượng trong chủ đề
                    var chude = db.ChuDes.SingleOrDefault(n => n.MaChuDe == maChuDe);
                    chude.SoBaiViet++;
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
            // hiển thị danh sách người like
            ViewBag.Like = db.LuotThiches.Where(n => n.MaBaiViet == iMaBaiviet).ToList();
            return View(baiViet);
        }
        // Thêm mới bình luận trong bài viết
        [ValidateInput(false)]
        public ActionResult ThemBinhLuan(BinhLuan model, FormCollection f, string strURL)
        {
            int mabaiviet = int.Parse(f["txtMaBaiViet"].ToString());
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
            BinhLuan bl = new BinhLuan();
            bl.NoiDungBinhLuan = model.NoiDungBinhLuan;
            bl.NgayBinhLuan = DateTime.Now;
            bl.TaiKhoan = tk.TaiKhoan;
            bl.MaBaiViet = mabaiviet;
            db.BinhLuans.Add(bl);
            // cập nhật lại số lượng bình luận bài viếts
            var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == mabaiviet);
            baiViet.BinhLuan++;
            db.SaveChanges();
            return Redirect(strURL);
        }
        // xóa bình luận
        public ActionResult XoaBinhLuan(int iMaBinhLuan, string strURL)
        {
            var binhLuan = db.BinhLuans.SingleOrDefault(n => n.MaBinhLuan == iMaBinhLuan);
            // cập nhật lại số lượng bình luận bài viếts
            var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == binhLuan.MaBaiViet);
            baiViet.BinhLuan--;
            db.BinhLuans.Remove(binhLuan);
            db.SaveChanges();
            return Redirect(strURL);
        }
        // Cập nhật bình luận
        public ActionResult CapNhatBinhLuan(int iMaBinhLuan)
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            var binhLuan = db.BinhLuans.SingleOrDefault(n => n.MaBinhLuan == iMaBinhLuan);
            return View(binhLuan);
        }
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken()]
        public ActionResult CapNhatBinhLuan(BinhLuan model)
        {
            try
            {
                var binhLuan = db.BinhLuans.SingleOrDefault(n => n.MaBinhLuan == model.MaBinhLuan);
                binhLuan.NoiDungBinhLuan = model.NoiDungBinhLuan;
                db.SaveChanges();
                ViewBag.ThongBao = "Cập Nhật Bình Luận Thành Công";
                return View(binhLuan);
            }
            catch
            {
                ViewBag.ThongBao = "Cập Nhật Bình Luận Thất Bại";
                var binhLuan = db.BinhLuans.SingleOrDefault(n => n.MaBinhLuan == model.MaBinhLuan);
                return View(binhLuan);
            }
        }
        // Bài Viết Của Bạn
        public ActionResult BaiVietCuaBan()
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
            var baiViet = db.BaiViets.Where(n => n.TaiKhoan == tk.TaiKhoan).ToList().OrderByDescending(n => n.MaBaiViet);
            return View(baiViet);
        }
        // Hiển thị bài viết mới
        public ActionResult BaiVietMoi()
        {
            var baiViet = db.BaiViets.ToList().OrderByDescending(n => n.NgayDang);
            return View(baiViet);
        }
        // Bài viết cần duyệt
        public ActionResult BaiVietCanDuyet()
        {
            var baiViet = db.BaiViets.Where(n => n.TrangThai == 1).ToList().OrderByDescending(n => n.NgayDang);
            return View(baiViet);
        }
        // Xem chi tiết
        public ActionResult ChiTietBaiVietCanDuyet(int iMaBaiViet)
        {
            var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == iMaBaiViet);
            return View(baiViet);
        }
        // Duyệt bài viết
        public ActionResult DuyetBaiViet(int iMaBaiViet)
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
            var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == iMaBaiViet);
            baiViet.TrangThai = 0;

            if (baiViet.NguoiDung.MaQuyen==2) // thành viên
            {
                // cộng số lượng trong chủ đề
                var chude = db.ChuDes.SingleOrDefault(n => n.MaChuDe == baiViet.MaChuDe);
                chude.SoBaiViet++;
            }
            db.SaveChanges();
            return RedirectToAction("ThanhCong", "ThongBao");
        }
        // Xóa bài viết
        public ActionResult XoaBaiViet(int iMaBaiViet)
        {
            var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == iMaBaiViet);
            db.BaiViets.Remove(baiViet);
            db.SaveChanges();
            return RedirectToAction("ThanhCong", "ThongBao");
        }
        // Like bài viết
        public ActionResult Like(int iMaBaiViet)
        {
            if (Session["TaiKhoan"] == null)
            {
                return RedirectToAction("TrangDangNhap", "DangNhap");
            }
            NguoiDung tk = (NguoiDung)Session["TaiKhoan"];
            // 1 người chỉ like 1 lượt
            // Kiểm tra tài khoản đã like bài viết này hay chưa
            var kiemTra = db.LuotThiches.SingleOrDefault(n=>n.MaBaiViet==iMaBaiViet &n.TaiKhoan==tk.TaiKhoan);
            if(kiemTra==null) // chưa like bài viết này
            {
                LuotThich lt = new LuotThich();
                lt.MaBaiViet = iMaBaiViet;
                lt.TaiKhoan = tk.TaiKhoan;
                lt.NgayThich = DateTime.Now;
                db.LuotThiches.Add(lt);
                // cộng thêm lượt thích trong bài viết
                var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == iMaBaiViet);
                baiViet.LuotThich++;
                db.SaveChanges();
            }    
            else // đã like bài viết này => hủy like
            {
                db.LuotThiches.Remove(kiemTra);
                // cộng thêm lượt thích trong bài viết
                var baiViet = db.BaiViets.SingleOrDefault(n => n.MaBaiViet == iMaBaiViet);
                baiViet.LuotThich--;
                db.SaveChanges();
            }
            // hiển thị danh sách người like
            ViewBag.Like = db.LuotThiches.Where(n => n.MaBaiViet == iMaBaiViet).ToList();

            return RedirectToAction("BaiViet", "BaiViet", new { iMaBaiviet = iMaBaiViet});

            
        }
    }
}