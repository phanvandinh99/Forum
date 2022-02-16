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
create table Quyen
(
	MaQuyen int identity(1,1) primary key,
	TenQuyen nvarchar(100) not null,
)
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

	Foreign key(MaBaiViet) references BaiViet(MaBaiViet) on delete cascade,
	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)
go
create table LuotThich
(
	MaBaiViet int,
	TaiKhoan varchar(50),
	primary key(MaBaiViet, TaiKhoan),
	NgayThich datetime default(getdate()),
	Foreign key(MaBaiViet) references BaiViet(MaBaiViet) on delete cascade,
	Foreign key(TaiKhoan) references NguoiDung(TaiKhoan),
)