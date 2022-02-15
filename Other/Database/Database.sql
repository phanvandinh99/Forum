Create database DataForum
go
use DataForum
go
create table DanhMuc
(
	MaDanhMuc int identity(1,1) primary key,
	TenDanhMuc nvarchar(100) not null,
	SoChuDe int default(0),
)
go
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Lập Trình', 5);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Đời Sống', 5);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Thể Thao', 5);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Linh Tinh', 5);
go
create table ChuDe
(
	MaChuDe int identity(1,1) primary key,
	TenChuDe nvarchar(100) not null,
	SoBaiViet int default(0),
	LuotXem int default(0),
	MaDanhMuc int,

	Foreign key(MaDanhMuc) references DanhMuc(MaDanhMuc),
)
go
--Lập Trình
insert into ChuDe(TenChuDe, SoBaiViet, LuotXem, MaDanhMuc) values (N'Lập Trình DOT NET', 0, 0, 1);
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
go 
create table Quyen
(
	MaQuyen int identity(1,1) primary key,
	TenQuyen nvarchar(100) not null,
)
go
insert into Quyen(TenQuyen) values (N'Ban Quản Trị');
insert into Quyen(TenQuyen) values (N'Người Dùng');
go
create table NguoiDung
(
	TaiKhoan varchar(50) primary key,
	MatKhau varchar(50) not null,
	Ho nvarchar(100) not null,
	Ten nvarchar(50) not null,
	GioiTinh int default(0), --0: nam, 1 nu
	NgaySinh Date not null,
	TrangThai int default(0),
	HinhAnh nvarchar(200) default(N'AnhMacDinh.png'),
	DiemThanhTich int default(0),
	SoBaiViet int default(0),
	MaQuyen int,

	Foreign key(MaQuyen) references Quyen(MaQuyen),
)
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
create table ViPham
(
	MaViPham int identity(1,1) primary key,
	NoiDungViPham nvarchar(100) not null,
	TaiKhoan varchar(50),

	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
go
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Đăng bài viết sai chủ đề', 'minh');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Bình luận bêu xấu admin', 'minh');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Không hoạt động đóng góp ý kiến cho diễn đàn', 'thang');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Đăng bài viết dùng từ genz, teencode', 'nhi');
insert into ViPham(NoiDungViPham, TaiKhoan) values (N'Bình luận ảnh không liên quan đến chủ đề bài viết lập trình c', 'nhung');
go
create table BaiViet
(
	MaBaiViet int identity(1,1) primary key,
	TenBaiViet nvarchar(200) not null,
	NoiDungBaiViet nvarchar(max) not null,
	NgayDang datetime default(getdate()),
	NgayCapNhat datetime null,
	TrangThai int default(0), --0: đã duyệt, 1 chưa duyệt
	LuotThich int default(0),
	BinhLuan int default(0),
	LuotXem int default(0),
	MaChuDe int,
	TaiKhoan varchar(50),

	Foreign key(MaChuDe) references ChuDe(MaChuDe),
	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
go
--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'TenBaiViet', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'taikhoan');

--insert into BaiViet (TenBaiViet, NoiDungBaiViet, NgayDang, NgayCapNhat, TrangThai, LuotThich, BinhLuan, LuotXem, MaChuDe, TaiKhoan)
--values (N'Mình code chức năng thêm mới bài viết nhưng bị lỗi không thêm được? Anh chị nào giúp em với ạ! ', N'NoiDung', '01/01/2021', '01/01/2021', 0, 5, 5, 20, 1, 'Minh')


go
create table BinhLuan
(
	MaBinhLuan int identity(1,1) primary key,
	--TenBinhLuan nvarchar(200) not null, -- Không cần thiết
	NoiDungBinhLuan nvarchar(max) not null,
	NgayBinhLuan datetime default(getdate()),
	MaBaiViet int,
	TaiKhoan varchar(50),

	Foreign key(MaBaiViet) references BaiViet(MaBaiViet),
	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
--go
--create table TraLoiBinhLuan
--(
--	MaTraLoi int identity(1,1) primary key,
--	TenTraloi nvarchar(200) not null,
--	NoiDungTraloi nvarchar(max) not null,
--	NgayTraLoi datetime default(getdate()),
--	MaBinhLuan int,
--	TaiKhoan varchar(50),

--	Foreign key(MaBinhLuan) references BinhLuan(MaBinhLuan),
--	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
--)
go
create table LuotThich
(
	MaBaiViet int,
	TaiKhoan varchar(50),
	primary key(MaBaiViet, TaiKhoan),
	NgayThich datetime default(getdate()),
	Foreign key(MaBaiViet) references BaiViet(MaBaiViet),
	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
select * from LuotThich