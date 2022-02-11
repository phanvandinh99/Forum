using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Forum.Areas.BanQuanTri.Controllers
{
    public class ThongBaoController : Controller
    {
        public ActionResult BaiViet() // Thêm bài viết thành công
        {
            return View();
        } 
        public ActionResult ThatBai() // Thao tác thất bại
        {
            return View();
        }
    }
}