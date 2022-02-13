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
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Lập Trình', 0);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Đời Sống', 0);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Thể Thao', 0);
insert into DanhMuc(TenDanhMuc, SoChuDe) values (N'Linh Tinh', 0);
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
insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('admin', 'abc123', N'Ban Quản', N'Trị', 0, '02/05/1999', 0,default, 0, 0, 1);

insert into NguoiDung(TaiKhoan, MatKhau, Ho, Ten, GioiTinh, NgaySinh, TrangThai, HinhAnh, DiemThanhTich, SoBaiViet, MaQuyen) 
values ('minh', 'minh', N'Phạm Nhật', N'Minh', 0, '02/05/1999', 0,default, 0, 0, 2);
go
create table ViPham
(
	MaViPham int identity(1,1) primary key,
	NoiDungViPham nvarchar(100) not null,
	TaiKhoan varchar(50),

	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
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

	Foreign key(MaBaiViet) references BaiViet(MaBaiViet),
	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
