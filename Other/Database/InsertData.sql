use DataForum
go
-- Nhập dữ liệu danh mục
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Lập Trình', 5);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Đời Sống', 5);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Thể Thao', 5);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Linh Tinh', 5);
go
-- nhập dữ liệu chủ đề
go
--Lập Trình
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Lập Trình DOT NET', 2, 0, 1);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Lập Trình JAVA', 0, 0, 1);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Lập Trình PHP', 0, 0, 1);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Cơ Sở Dữ Liệu SQL Server', 0, 0, 1);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Khác', 0, 0,  1);

-- Đời Sống
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Đầu Tư Kiếm Tiền', 0, 0, 2);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Tư Vấn & Hỏi Đáp', 0, 0, 2);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Bảng Tin Trong Nước', 0, 0, 2);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Bảng Tin Thế Giới', 0, 0, 2);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Khác', 0, 0,  2);

-- Thể Thao
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Đầu Tư Kiếm Tiền', 0, 0, 3);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Tư Vấn & Hỏi Đáp', 0, 0, 3);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Bảng Tin Trong Nước', 0, 0, 3);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Bảng Tin Thế Giới', 0, 0, 3);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Khác', 0, 0, 3);

-- Linh Tinh
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Trò Chuyện Linh Tinh', 0, 0,  4);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Quảng Cáo Rao Vặt', 0, 0,  4);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Tin Tuyển Dụng', 0, 0,  4);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Giá Vàng', 0, 0,  4);
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Khác', 0, 0,  4);

-- Nhập dữ liệu quyền
go
insert into Quyen(TenQuyen) values (N'Ban Quản Trị');
insert into Quyen(TenQuyen) values (N'Người Dùng');
go
-- Người dùng ban quản trị (admin)
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('admin', 'admin', N'Ban Quản', N'Trị', 0, '02/05/1999', 0, default, 0, 0, 1);
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('quantri', 'quantri', N'Quản', N'Trị', 0, '02/01/1995', 0, default, 0, 0, 1);
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('Nhi', 'Nhi', N'Thanh', N'Nhi', 0, '09/12/1994', 0, default, 0, 0, 1);

-- Người dùng thành viên
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('thang', 'thang', N'Cao', N'Thắng', 0, '07/07/2000', 0,default, 0, 0, 2);
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('nhung', 'nhung', N'Thùy', N'Nhung', 1, '12/11/1995', 0,default, 0, 0, 2);
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('trang', 'trang', N'Kiều', N'Trang', 1, '12/12/1982', 0,default, 0, 0, 2);
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('AnhThang', 'AnhThang', N'Anh', N'Thắng', 0, '11/11/1979', 0,default, 0, 0, 2);
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('minh', 'minh', N'Trần Ngọc', N'Minh', 0, '05/05/1992', 0,default, 0, 0, 2);
go
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Đăng bài viết sai chủ đề', 'minh');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Bình luận bêu xấu admin', 'minh');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Không hoạt động đóng góp ý kiến cho diễn đàn', 'thang');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Đăng bài viết dùng từ genz, teencode', 'nhi');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Bình luận ảnh không liên quan đến chủ đề bài viết lập trình c', 'nhung');
go
-- Nhập dữ liệu cho bài viết
--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'Mình code chức năng thêm mới bài viết nhưng bị lỗi không thêm được? Anh chị nào giúp em với ạ! ', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'Minh')

go
insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
values (N'Mình code chức năng thêm mới bài viết nhưng bị lỗi không thêm được? Anh chị nào giúp em với ạ! ', N'<p>&nbsp;// Th&ecirc;m mới b&agrave;i viết<br />
&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult ThemMoiBaiViet(int iMaChuDe)<br />
&nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var chuDe = db.ChuDes.SingleOrDefault(n =&gt; n.MaChuDe == iMaChuDe);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return View(chuDe);<br />
&nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; [HttpPost, ValidateInput(false)]<br />
&nbsp; &nbsp; &nbsp; &nbsp; [ValidateAntiForgeryToken()]<br />
&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult ThemMoiBaiViet(BaiViet model, FormCollection f)<br />
&nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; try<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (Session[&quot;TaiKhoan&quot;] == null)<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return RedirectToAction(&quot;TrangDangNhap&quot;, &quot;DangNhap&quot;);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NguoiDung tk = (NguoiDung)Session[&quot;TaiKhoan&quot;];<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int maChuDe = int.Parse(f[&quot;txtMaChuDe&quot;.ToString()]);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BaiViet bv = new BaiViet();<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.TenBaiViet = model.TenBaiViet;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.NoiDungBaiViet = model.NoiDungBaiViet;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.NgayDang = DateTime.Now;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.NgayCapNhat = DateTime.Now;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (tk.MaQuyen == 1) // admin<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.TrangThai = 0;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // cộng số lượng trong chủ đề<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var chude = db.ChuDes.SingleOrDefault(n =&gt; n.MaChuDe == maChuDe);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; chude.SoBaiViet++;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.TrangThai = 1; // Kiểm duyệt<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.LuotThich = 0;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.BinhLuan = 0;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.LuotXem = 0;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.MaChuDe = maChuDe;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bv.TaiKhoan = tk.TaiKhoan;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // cộng điểm th&agrave;nh t&iacute;ch<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var diem = db.NguoiDungs.SingleOrDefault(n =&gt; n.TaiKhoan == tk.TaiKhoan);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diem.DiemThanhTich = diem.DiemThanhTich + 5;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; diem.SoBaiViet = diem.SoBaiViet + 1;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; db.BaiViets.Add(bv);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; db.SaveChanges();<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Session[&quot;TaiKhoan&quot;] = diem;<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return RedirectToAction(&quot;BaiViet&quot;, &quot;ThongBao&quot;);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; catch<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return RedirectToAction(&quot;ThatBai&quot;, &quot;ThongBao&quot;);<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br />
&nbsp; &nbsp; &nbsp; &nbsp; }</p>
', '01/01/2021', '01/01/2021', 0, 5, 3, 20, 1, 'minh')
go
insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
values (N'Viết chương trình C đầu tiên, và chạy chương trình C', N'<p>&nbsp;</p>

<ol>
	<li><strong>&nbsp;Chương tr&igrave;nh C đầu ti&ecirc;n</strong></li>
</ol>

<p>Trước ti&ecirc;n h&atilde;y tham khảo một chương tr&igrave;nh dưới đ&acirc;y. Tạm thời bạn đừng quan t&acirc;m đến &yacute; nghĩa của n&oacute;, h&atilde;y xem code, copy n&oacute; v&agrave;o chương tr&igrave;nh của bạn v&agrave; chạy xem kết quả, sau đ&oacute; xem phần giải th&iacute;ch nh&eacute;.</p>

<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p>1</p>

			<p>2</p>

			<p>3</p>

			<p>4</p>

			<p>5</p>

			<p>6</p>

			<p>7</p>

			<p>8</p>

			<p>9</p>

			<p>10</p>

			<p>11</p>

			<p>12</p>

			<p>13</p>

			<p>14</p>

			<p>15</p>

			<p>16</p>

			<p>17</p>
			</td>
			<td>
			<p><code>/* Demo được viết bởi Chaitanya tr&ecirc;n BeginnersBook.com*/</code></p>

			<p><code>#include&lt;stdio.h&gt;</code></p>

			<p><code>int</code> <code>main()</code></p>

			<p><code>{</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>int</code> <code>num;</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>printf</code><code>(</code><code>&quot;Nhap tuoi cua ban: &quot;</code><code>);</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>scanf</code><code>(</code><code>&quot;%d&quot;</code><code>, &amp;num);</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>if</code> <code>(num &lt;18)</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>printf</code><code>(</code><code>&quot;Ban khong du dieu kien bo phieu&quot;</code><code>);</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>else</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>{</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>printf</code><code>(</code><code>&quot;Ban co the bo phieu!!&quot;</code><code>);</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>}</code></p>

			<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>return</code> <code>0;</code></p>

			<p><code>}</code></p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>Đầu ra:</p>

<pre style="margin-left:40px">
Nhap tuoi cua ban:25
Ban co the bo phieu!!</pre>

<p>&nbsp;</p>
', '01/01/2021', '01/01/2021', 0, 5, 3, 20, 1, 'minh');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

go
-- Nhập phần bình luận
insert into BinhLuan (NoiDungBinhLuan, NgayBinhLuan, MaBaiViet, TaiKhoan) values (N'Sai căn bản rồi. Đọc thêm tài liệu về aspnet httpget, httppost để hiểu hơn cơ chế mvc', '11/01/2022', 1, 'nhung');
insert into BinhLuan (NoiDungBinhLuan, NgayBinhLuan, MaBaiViet, TaiKhoan) values (N'Thiếu dấu chấm phẩy dòng 20 nha bạn', '11/01/2022', 1, 'trang');
insert into BinhLuan (NoiDungBinhLuan, NgayBinhLuan, MaBaiViet, TaiKhoan) values (N'Mình thấy code vậy là đúng rồi, bạn chạy debug để xem lỗi ở dòng nào cho chắc ăn', '11/01/2022', 1, 'thang');
insert into BinhLuan (NoiDungBinhLuan, NgayBinhLuan, MaBaiViet, TaiKhoan) values (N'Bài viết rất hay', '11/01/2022', 2, 'nhung');
insert into BinhLuan (NoiDungBinhLuan, NgayBinhLuan, MaBaiViet, TaiKhoan) values (N'Cảm ơn bạn. Đúng phần mình sắp học môn này trên trường', '11/01/2022', 2, 'trang');
insert into BinhLuan (NoiDungBinhLuan, NgayBinhLuan, MaBaiViet, TaiKhoan) values (N'Bài viết hữu ích', '11/01/2022', 2, 'thang');