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
', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'minh')
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
', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'minh');

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

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');