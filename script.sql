USE [master]
GO
/****** Object:  Database [Minions]    Script Date: 05/18/2018 9:30:50 PM ******/
CREATE DATABASE [Minions]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'PoPoDoo1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PoPoDoo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'PoPoDoo1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PoPoDoo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Minions] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Minions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Minions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Minions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Minions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Minions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Minions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Minions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Minions] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Minions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Minions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Minions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Minions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Minions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Minions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Minions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Minions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Minions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Minions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Minions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Minions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Minions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Minions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Minions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Minions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Minions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Minions] SET  MULTI_USER 
GO
ALTER DATABASE [Minions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Minions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Minions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Minions] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Minions]
GO
/****** Object:  Table [dbo].[DoTuoi]    Script Date: 05/18/2018 9:31:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoTuoi](
	[DoTuoiID] [int] IDENTITY(1,1) NOT NULL,
	[KhoangDoTuoi] [nvarchar](max) NULL,
 CONSTRAINT [PK__DoTuoi__734356110527046F] PRIMARY KEY CLUSTERED 
(
	[DoTuoiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[GiaoVienID] [int] IDENTITY(1,1) NOT NULL,
	[TenGiaoVien] [nvarchar](max) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [numeric](18, 0) NULL,
	[Luong] [money] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK__GiaoVien__7D9E983863B115ED] PRIMARY KEY CLUSTERED 
(
	[GiaoVienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[HoaDonID] [int] IDENTITY(1,1) NOT NULL,
	[HocSinhID] [int] NOT NULL,
	[NhanVienID] [int] NULL,
	[NgayHoaDon] [date] NULL,
	[TinhTrang] [int] NULL,
	[SoTien] [money] NULL,
	[KhoaHocID] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[HoaDonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh](
	[HocSinhID] [int] IDENTITY(1,1) NOT NULL,
	[TenHocSinh] [nvarchar](max) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](10) NULL,
	[PhuHuynh] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](15) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK__HocSinh__CD0A97BF77138B84] PRIMARY KEY CLUSTERED 
(
	[HocSinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocTap]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocTap](
	[LopHocID] [int] NOT NULL,
	[HocSinhID] [int] NOT NULL,
	[NgayNghi] [int] NULL,
	[Diem] [float] NULL,
	[XepLoai] [nchar](10) NULL,
 CONSTRAINT [PK_Hoc] PRIMARY KEY CLUSTERED 
(
	[LopHocID] ASC,
	[HocSinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[KhoaHocID] [int] IDENTITY(1,1) NOT NULL,
	[DoTuoiID] [int] NULL,
	[TenKhoaHoc] [nvarchar](max) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[ThoiLuongKhoaHoc] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[SoLuongHS] [int] NULL,
	[HocPhi] [money] NULL,
	[TrangThai] [int] NULL,
	[ChiTiet] [nvarchar](max) NULL,
	[GiaoVienID] [int] NULL,
 CONSTRAINT [PK__KhoaHoc__AADD6C723E4AA2CC] PRIMARY KEY CLUSTERED 
(
	[KhoaHocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichKhaiGiang]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichKhaiGiang](
	[LichKhaiGiangID] [int] IDENTITY(1,1) NOT NULL,
	[TênLichKhaiGiang] [nvarchar](max) NULL,
	[NgayKhaiGiang] [date] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_LichKhaiGiang] PRIMARY KEY CLUSTERED 
(
	[LichKhaiGiangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[LopHocID] [int] IDENTITY(1,1) NOT NULL,
	[GiaoVienID] [int] NULL,
	[PhongHocID] [int] NULL,
	[TenLopHoc] [nvarchar](50) NULL,
	[SoLuongHS] [int] NULL,
	[LichThi] [date] NULL,
	[TrangThai] [int] NULL,
	[KhoaHocID] [int] NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[LopHocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[NhanVienID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhanVien] [nvarchar](max) NULL,
	[ChucVu] [nvarchar](max) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [numeric](18, 0) NULL,
	[Luong] [money] NULL,
 CONSTRAINT [PK__NhanVien__E27FD7EADA462BFF] PRIMARY KEY CLUSTERED 
(
	[NhanVienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongHoc]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongHoc](
	[PhongHocID] [int] IDENTITY(1,1) NOT NULL,
	[TenPhongHoc] [nvarchar](50) NULL,
	[TrangThietBi] [nvarchar](1) NULL,
 CONSTRAINT [PK__PhongHoc__0CA93AFB29AE84FE] PRIMARY KEY CLUSTERED 
(
	[PhongHocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoanID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWord] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TaiKhoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 05/18/2018 9:31:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[TinTucID] [int] NOT NULL,
	[NoiDung] [nvarchar](200) NULL,
	[HinhAnh] [nvarchar](200) NULL,
	[Ngay] [date] NULL,
	[MoTa] [nvarchar](200) NULL,
	[MoTaChiTiet] [nvarchar](max) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[TinTucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DoTuoi] ON 

INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (1, N'3-5 ')
INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (2, N'6-8')
INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (3, N'9-12')
INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (4, N'13-15')
INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (5, N'15-18')
INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (6, NULL)
INSERT [dbo].[DoTuoi] ([DoTuoiID], [KhoangDoTuoi]) VALUES (7, N'1-3')
SET IDENTITY_INSERT [dbo].[DoTuoi] OFF
SET IDENTITY_INSERT [dbo].[GiaoVien] ON 

INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (1, N'Anthony', CAST(0x051D0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(92828128 AS Numeric(18, 0)), 9000000.0000, 1)
INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (2, N'Adam', CAST(0x051D0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(92828128 AS Numeric(18, 0)), 8000000.0000, 1)
INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (3, N'Andrew', CAST(0x051D0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(92828128 AS Numeric(18, 0)), 7000000.0000, 1)
INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (4, N'Alexander', CAST(0x051D0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(92828128 AS Numeric(18, 0)), 9000000.0000, 1)
INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (5, N'Charlotte', CAST(0x051D0B00 AS Date), N'Nữ        ', N'Hà Nội', CAST(92828128 AS Numeric(18, 0)), 8000000.0000, 1)
INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (6, N'Anna', CAST(0xB6160B00 AS Date), N'Nữ        ', N'Hà Nội', CAST(968667988 AS Numeric(18, 0)), 10000000.0000, 1)
INSERT [dbo].[GiaoVien] ([GiaoVienID], [TenGiaoVien], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong], [TrangThai]) VALUES (7, N'aaa', CAST(0xC1160B00 AS Date), N'Nam       ', N'Hà Nội', CAST(909878880 AS Numeric(18, 0)), 4000000.0000, 0)
SET IDENTITY_INSERT [dbo].[GiaoVien] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([HoaDonID], [HocSinhID], [NhanVienID], [NgayHoaDon], [TinhTrang], [SoTien], [KhoaHocID]) VALUES (1, 1, 1, CAST(0x683C0B00 AS Date), 0, 8000000.0000, 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [HocSinhID], [NhanVienID], [NgayHoaDon], [TinhTrang], [SoTien], [KhoaHocID]) VALUES (2, 2, 1, CAST(0xC13C0B00 AS Date), 0, 7000000.0000, 1)
INSERT [dbo].[HoaDon] ([HoaDonID], [HocSinhID], [NhanVienID], [NgayHoaDon], [TinhTrang], [SoTien], [KhoaHocID]) VALUES (3, 3, 1, CAST(0x3C3D0B00 AS Date), 0, 9000000.0000, 2)
INSERT [dbo].[HoaDon] ([HoaDonID], [HocSinhID], [NhanVienID], [NgayHoaDon], [TinhTrang], [SoTien], [KhoaHocID]) VALUES (6, 4, 2, CAST(0x4B3C0B00 AS Date), 0, 9000000.0000, 3)
INSERT [dbo].[HoaDon] ([HoaDonID], [HocSinhID], [NhanVienID], [NgayHoaDon], [TinhTrang], [SoTien], [KhoaHocID]) VALUES (7, 5, 2, CAST(0x3C3D0B00 AS Date), 0, 10000000.0000, 4)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[HocSinh] ON 

INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (1, N'Nguyễn Thị An', CAST(0x72280B00 AS Date), N'Nữ        ', N'Vũ Thị Trang', N'Hà Nội', N'293483830      ', 0)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (2, N'Vũ Việt Anh', CAST(0xDE350B00 AS Date), N'Nam       ', N'Vũ Đình Long', N'Hà Nội', N'33829347       ', 0)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (3, N'Trần Thị Thanh', CAST(0xD3310B00 AS Date), N'Nữ        ', N'Nguyễn Thị Thảo', N'Hà Nội', N'927293839      ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (4, N'Phạm Tuấn Tú', CAST(0xE52B0B00 AS Date), N'Nam       ', N'Phạm Tuấn Tài', N'Hà Nội', N'928666788      ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (5, N'Nguyễn Văn Long', CAST(0x722D0B00 AS Date), N'Nam       ', N'Nguyễn Chí Cường', N'Hà Nội', N'82772272       ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (6, N'Nguyen Van H', CAST(0x081F0B00 AS Date), N'Nam       ', N'Nguyen Van B', N'Ha Noi', N'-21412         ', NULL)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (7, N'Nguyễn Văn A', CAST(0x0B1F0B00 AS Date), N'Nam       ', N'Nguyen Van B', N'Ha Noi', N'01232424       ', NULL)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (8, N'Nguyen Van H', CAST(0x081F0B00 AS Date), N'Nam       ', N'Nguyen Van B', N'Ha Noi', N'12345          ', NULL)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (9, N'nguyen c', CAST(0xF51B0B00 AS Date), N'Nam       ', N'Nguyen Van B', N'Ha Noi', N'12324          ', NULL)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (10, N'Nguyen Van H', CAST(0x081F0B00 AS Date), NULL, N'Nguyen Van B', N'Ha Noi', N'01232424       ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (11, N'Nguyen Van H', CAST(0x081F0B00 AS Date), NULL, N'Nguyen Van B', N'Ha Noi', N'01232424       ', 0)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (12, N'Nguyễn Văn X', CAST(0xF51B0B00 AS Date), NULL, N'Nguyen Van B', N'Ha Noi', N'1245           ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (13, N'Nguyễn Văn Cường', CAST(0x081F0B00 AS Date), NULL, N'Nguyen Van B', N'Ha Noi', N'0214124        ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (14, N'Nguyen Van H', CAST(0x081F0B00 AS Date), NULL, N'Nguyen Van B', N'Ha Noi', N'0214124        ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (16, N'Nguyễn Trọng Vinh', NULL, NULL, N'Thinh', N'Hà Nội', N'0987773211     ', 1)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (17, N'bé A', CAST(0x8C2D0B00 AS Date), NULL, N'Bà C', N'Hà Nội', N'0986855774     ', 0)
INSERT [dbo].[HocSinh] ([HocSinhID], [TenHocSinh], [NgaySinh], [GioiTinh], [PhuHuynh], [DiaChi], [SDT], [TrangThai]) VALUES (18, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[HocSinh] OFF
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (1, 10, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (1, 13, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (1, 14, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (1, 15, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (1, 18, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (2, 11, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (3, 16, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (3, 17, NULL, NULL, NULL)
INSERT [dbo].[HocTap] ([LopHocID], [HocSinhID], [NgayNghi], [Diem], [XepLoai]) VALUES (5, 12, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (1, 1, N'Tiếng Anh mầm non', CAST(0x693C0B00 AS Date), CAST(0x6C3C0B00 AS Date), N'3 tháng', N'&lt;p&gt;Đến với lớp học Tiếng Anh Tiểu học c&amp;aacute;c B&amp;eacute; sẽ được học đầy đủ c&amp;aacute;c kỹ năng: Nghe, N&amp;oacute;i, Đọc, Viết th&amp;ocirc;ng qua nhiều h&amp;igrave;nh thức học tập kh&amp;aacute;c nhau: học qua bảng điện tử It Board, ng&amp;ocirc;n ngữ cơ thể, thẻ tranh từ...gi&amp;uacute;p B&amp;eacute; học tập, l&amp;agrave;m quen với Tiếng Anh một c&amp;aacute;ch tự nhi&amp;ecirc;n, thoải m&amp;aacute;i, y&amp;ecirc;u th&amp;iacute;ch Tiếng Anh v&amp;agrave; đầy cảm hứng học Tiếng Anh.&lt;/p&gt;', N'/Content/HTML/resources/img/20170105104254_20161121151506_course1.png', 15, 5000000.0000, 1, N'Chương trình Tiếng Anh Mầm Non của Popodoo được xây dựng hoàn toàn mới với các video bài giảng hấp dẫn do giáo viên người Mỹ thực hiện. Chương trình gồm 20 bài học (Unit) với những chủ điểm gần gũi với đời sống hàng ngày. Mỗi bài học có các video học về Chữ cái (Letters), Chữ số (Numbers), Từ vựng (Words), Mẫu câu (Sentences) và phần trò chơi luyện tập (Games) giúp các bé đánh giá khả năng tiếp thu bài học của mình. Chương trình phù hợp với các bé mầm non từ 3 đến 6 tuổi và học sinh lớp 1, lớp 2 mới bắt đầu làm quen với tiếng Anh', 1)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (2, 2, N'Tiếng Anh tiểu học 1', CAST(0xC73C0B00 AS Date), CAST(0x423D0B00 AS Date), N'4 tháng', N'Đến với lớp học Tiếng Anh Tiểu học các Bé sẽ được học đầy đủ các kỹ năng: Nghe, Nói, Đọc, Viết thông qua nhiều hình thức học tập khác nhau: học qua bảng điện tử It Board, ngôn ngữ cơ thể, thẻ tranh từ...giúp Bé học tập, làm quen với Tiếng Anh một cách tự nhiên, thoải mái, yêu thích Tiếng Anh và đầy cảm hứng học Tiếng Anh.', N'/Content/HTML/resources/img/20170105105857_7-9.png', 16, 7000000.0000, 1, N'Chương trình Tiếng Anh lớp 1 của Popodoo được xây dựng với các video bài giảng hấp dẫn do giáo viên người Mỹ thực hiện. Chương trình gồm 20 bài học (Unit) với những chủ điểm gần gũi với đời sống hàng ngày. Mỗi bài học có các video học về Chữ cái & âm và âm (Letters & Phonics và Phonics), Chữ số (Numbers), Từ vựng (Words), Mẫu câu (Sentences) và phần trò chơi luyện tập (Games) giúp các bé đánh giá khả năng tiếp thu bài học của mình. Chương trình phù hợp với các bé học sinh lớp 1, lớp 2 mới bắt đầu làm quen với tiếng Anh', 2)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (3, 3, N'Tiếng Anh tiểu học 2&3', CAST(0x3E3D0B00 AS Date), CAST(0x9B3D0B00 AS Date), N'3 tháng', N'Đến với lớp học Tiếng Anh Tiểu học các Bé sẽ được học đầy đủ các kỹ năng: Nghe, Nói, Đọc, Viết thông qua nhiều hình thức học tập khác nhau: học qua bảng điện tử It Board, ngôn ngữ cơ thể, thẻ tranh từ...giúp Bé học tập, làm quen với Tiếng Anh một cách tự nhiên, thoải mái, yêu thích Tiếng Anh và đầy cảm hứng học Tiếng Anh.', N'/Content/HTML/resources/img/20170105123347_10-13.png', 17, 9000000.0000, 1, N'Chương trình tiếng Anh lớp 2 của Popodoo được xây dựng dựa trên bộ sách Tiếng Anh 2 của Nhà xuất bản Giáo dục. Chương trình được giảng dạy hoàn toàn bởi các giáo viên bản ngữ người Mỹ và giáo viên giỏi người Việt của Tiếng Anh 123 với những video hấp dẫn, bài tập sinh động giúp các em học và hiểu bài nhanh hơn.Chương trình học xoay quanh 4 chủ điểm giao tiếp gần gũi với học sinh, gồm: Bạn Bè, Trường Học, Gia Đình và Thế Giới Xung Quanh. Mỗi chủ điểm được chia thành 5 đơn vị bài học (Unit). Sau 5 đơn vị bài học là một bài ôn tập (Review) tập trung vào các kỹ năng giao tiếp (nghe, nói, đọc, viết) và kiến thức ngôn ngữ cơ bản (ngữ âm, từ vựng, ngữ pháp). Sau 10 đơn vị bài học là một bài Kiểm tra cuối kỳ (End-of-term test) giúp ôn tập và đánh giá kiến thức học sinh.
Trong mỗi đơn vị bài học gồm 3 phần: Vocabulary (Từ Vựng) gồm các video dạy các từ hoặc cụm từ cần thiết cho bài học; Lecture (Bài Giảng) gồm các video có cả giáo viên Việt Nam và nước ngoài dạy về các kiến thức ngữ pháp của bài học, ngoài ra có thể có thêm phần bài tập củng cố; Phonics (Học về Âm) gồm 2 video dạy về phát âm của chữ cái và 1 phần bài tập thực hành', 3)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (4, 4, N'Tiếng Anh Lớp Tiểu Học 4', CAST(0x883C0B00 AS Date), CAST(0x033D0B00 AS Date), N'4 tháng', N'Đến với lớp học Tiếng Anh Thiếu Niên các Bé sẽ được học đầy đủ các kỹ năng Nghe, Nói, Đọc, Viết thông qua nhiều hình thức học tập khác nhau giúp Bé học tập, làm quen với Tiếng Anh một cách tự nhiên, thoải mái, yêu thích Tiếng Anh và đầy cảm hứng học Tiếng Anh.', N'/Content/HTML/resources/img/20170105104254_20161121151506_course1.png', 20, 8000000.0000, 1, N'Chương trình tiếng Anh lớp 4 của Popodoo được xây dựng hoàn toàn mới và vượt trội với các Video bài giảng hấp dẫn, sinh động do đội ngũ các thầy cô giáo nước ngoài và trong nước thực hiện. Các bài giảng được dẫn dắt bởi các giáo viên. Nội dung chương trình bài giảng và bài tập tương đương với bộ sách Tiếng Anh lớp 4 của Nhà xuất bản Giáo dục Việt Nam. Gồm 4 chủ điểm gần gũi với học sinh tiểu học: Bạn bè, Trường học, Gia đình và Thế giới xung quanh. Trong mỗi chủ điểm, học sinh sẽ học 5 đơn vị bài học (Unit). Mỗi Unit có các video về Từ vựng (Vocabulary) Bài giảng (Lecture) và video hướng dẫn Phát âm (Phonics). Sau mỗi video đều có phần bài tập giúp học sinh thực hành 4 kỹ năng nghe, nói, đọc, viết và tự đánh giá khả năng tiếp thu bài học của mình.
Để củng cố kiến thức về mỗi chủ điểm được học, học sinh sẽ làm một bài ôn tập chung (Review). Khi học sinh học qua 2 chủ điểm, sau 10 Unit thì có thể làm Kiểm tra cuối học kỳ (End-of-term test). Tổng kết chương trình, sau 20 Unit, học sinh sẽ làm bài Kiểm tra cuối năm', 3)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (5, 5, N'Tiếng Anh Tiểu học 5', CAST(0x3E3D0B00 AS Date), CAST(0x9F3D0B00 AS Date), N'3 tháng', N'Đến với lớp học Tiếng Anh Thiếu Niên các Bé sẽ được học đầy đủ các kỹ năng Nghe, Nói, Đọc, Viết thông qua nhiều hình thức học tập khác nhau giúp Bé học tập, làm quen với Tiếng Anh một cách tự nhiên, thoải mái, yêu thích Tiếng Anh và đầy cảm hứng học Tiếng Anh.', N'/Content/HTML/resources/img/20170105105857_7-9.png', 19, 10000000.0000, 1, N'Chương trình tiếng Anh lớp 5 của Popodoo được xây dựng hoàn toàn mới và vượt trội với các Video bài giảng hấp dẫn, sinh động do đội ngũ các thầy cô giáo nước ngoài và trong nước thực hiện. Các bài giảng được dẫn dắt bởi các giáo viên. Nội dung chương trình bài giảng và bài tập tương đương với bộ sách Tiếng Anh lớp 4 của Nhà xuất bản Giáo dục Việt Nam. Gồm 4 chủ điểm gần gũi với học sinh tiểu học: Bạn bè, Trường học, Gia đình và Thế giới xung quanh. Trong mỗi chủ điểm, học sinh sẽ học 5 đơn vị bài học (Unit). Mỗi Unit có các video về Từ vựng (Vocabulary) Bài giảng (Lecture) và video hướng dẫn Phát âm (Phonics). Sau mỗi video đều có phần bài tập giúp học sinh thực hành 4 kỹ năng nghe, nói, đọc, viết và tự đánh giá khả năng tiếp thu bài học của mình.
Để củng cố kiến thức về mỗi chủ điểm được học, học sinh sẽ làm một bài ôn tập chung (Review). Khi học sinh học qua 2 chủ điểm, sau 10 Unit thì có thể làm Kiểm tra cuối học kỳ (End-of-term test). Tổng kết chương trình, sau 20 Unit, học sinh sẽ làm bài Kiểm tra cuối năm', 5)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (6, 1, N'Phát Triển Tư Duy', CAST(0xE43C0B00 AS Date), CAST(0x6D3D0B00 AS Date), N'4 tháng rưỡi', N'Đến với lớp học Tiếng Anh Mẫu Giáo các Bé sẽ được học trong môi trường "Học mà chơi, chơi mà học", thông qua nhiều hình thức học tập khác nhau: học qua bảng điện tử It Board, ngôn ngữ cơ thể, thẻ tranh từ, bài hát, trò chơi...giúp Bé học tập, làm quen với Tiếng Anh một cách tự nhiên, thoải mái, yêu thích Tiếng Anh và đầy cảm hứng học Tiếng Anh.', N'/Content/HTML/resources/img/20170105123347_10-13.png', 20, 40000000.0000, 1, N'Phát triển tư duy Logic - Mighty Brains

	
- Phát triển tư duy Logic - Mighty Brains là chương trình dành cho trẻ từ 4-6 tuổi với phương pháp giảng dạy ưu việt "cá nhân hóa chương trình học tập của từng học sinh", giáo viên của Phát triển tư duy Logic định hướng mục tiêu học tập và hướng dẫn phương pháp tư duy cho từng học sinh.

- Phát triển tư duy Logic - Mighty Brains là một chương trình mới và sáng tạo hướng dẫn trẻ các kỹ năng toán học cơ bản. Thông qua các buổi học (02 buổi/tuần), với sự định hướng và gợi mở của người hướng dẫn, các bạn nhỏ sẽ hiểu được khái niệm cơ bản về toán học, từ đó phát triển lối tư duy logic và giải quyết các vấn đề từ nhiều góc độ. Mighty Brains được thiết kế nhằm phát triển các kỹ năng cho trẻ đặc biệt như: xây dựng ý tưởng, tư duy logic, giải quyết vấn đề, tính toán...
1. PHƯƠNG PHÁP GIẢNG DẠY 

- Xây dựng nền móng: Khám phá các khái niệm cơ bản về toán học, tạo thói quen tự hỏi cho trẻ. Chúng tôi khuyến khích trẻ suy nghĩ và tiếp cận các khái niệm toán học bằng nhiều cách.

- Ứng dụng giải quyết các vấn đề trong cuộc sống: Áp dụng các khái niệm toán học trong cuộc sống, làm cho việc học tập trở nên thú vị và thiết thực hơn. Đứa trẻ sẽ được nâng cao tầm hiểu biết, biết cách xác định làm thế nào để áp dụng các khái niệm vào các tình huống mới, thách thức các bài toán và các kiến thức mới.

- Rèn luyện kỹ năng tính toán: Chúng tôi sẽ giúp con của bạn hiểu sâu và làm chủ trong việc tính toán, ngoài cách tính truyền thống học sinh còn biết nhiều cách tính khác. Chúng tôi cũng hướng dẫn học sinh từng bước làm chủ các kỹ năng tính toán, đồng thời giám sát và khen thưởng  những nỗ lực và tiến bộ của trẻ.

- Tăng cường hứng thú học tập: Toán học thường được dạy một cách rất nhàm chán, khô khan khiến trẻ chán và sợ học. Tuy nhiên ở Mighty Brains, các công cụ giảng dạy sáng tạo sẽ kích thích khả năng tư duy, nâng cao kinh nghiệm học tập của trẻ. Mighty Brains đã phát triển các công cụ giảng dạy tiên tiến này để nâng cao hiểu biết và khả năng của trẻ bằng cách sử dụng cả hai tay và 2 bán cầu não. Bộ công cụ bao gồm các trò chơi, các câu đố, các khối xây dựng và các thiết bị ba chiều tạo ra một "môi trường học tập" độc đáo để học sinh tiếp xúc với khái niệm toán học một cách mới mẻ và thú vị, giúp tăng thêm niềm vui và hiệu quả học tập.

2. TRANG BỊ NỀN TẢNG TƯ DUY VỮNG CHẮC

 Nhận biết thứ tự số tự nhiên: sắp xếp theo thứ tự tăng dần hoặc giảm dần - tiêu đề của kỹ năng tính toán

 

 Đếm và viết số: Làm quen với các con số ngay từ những buổi học đầu tiên

 

 Thuộc tính vật thể: Nhận biết đặc điểm của vật thể, so sánh điểm giống và khác nhau

 

 Hình khối: Nhận biết hình khối cơ bản liên tưởng và mô tả vật thể

 

 Phân loại so sánh: bồi dưỡng khả năng quan sát, phân tích đặc điểm nhằm kích thích sự sáng tạo

 

 Dãy quy luật: Tìm hiểu quy luật phát triển khả năng tư duy logic, trau dồi kỹ năng giải quyết vấn đề

 

 Tính toán: Làm quen với các phép tính: phép "+", phép "-"

 

 Phân số, khái niệm về tỉ lệ : Làm quen về phân số, tỉ lệ. Học tư duy, suy luận và giải quyết vấn đề

 

 Mối quan hệ trong không gian: Vun đắp kỹ năng quan sát, miêu tả, định hướng vị trí vật thể

 

 

3. BƯỚC ĐẾN THÀNH CÔNG:  Giáo dục chính là bồi dưỡng khả năng cạnh tranh của trẻ - Trọng tâm của giáo dục Toán học nằm ở "rèn luyện tư duy" và "năng lực giải quyết vấn đề", ý nghĩa sâu xa của chương trình Phát triển tư duy logic Mighty Brains mang đến cho trẻ (Thế giới phẳng - Thomas L. Friedman)

- Coi trọng bồi dưỡng năng lực "Hỏi" của trẻ. Dẫn dắt trẻ miêu tả lại cái mà các con "không biết", chính là hỗi trợ trẻ dần dần giải quyết vấn đề

- Không rèn luyện tư duy theo kiểu đưa ra "Đáp án tiêu chuẩn", bồi dưỡng trẻ năng lực suy nghĩ thấu đáo một vấn đề gặp phải

- Thông qua việc hướng dẫn thích hợp để hỗ trợ trẻ biết cách giải quyết vấn đề

- Trong quá trình làm bài, đưa thêm các bước nhiều trình tự, rèn luyện tố chất tư duy "sâu"

- Có một số khái niệm sẽ có thể tự nhiên được hình thành thông qua ấn tượng của trẻ khi thao tác giải quyết các bài tập, đó chính là ý nghĩa "học trong thực hành".

4. ĐIỂM KHÁC BIỆT GIỮA MIGHTY BRAINS VỚI CÁC CHƯƠNG TRÌNH TOÁN HỌC TƯ DUY KHÁC TRÊN THỊ TRƯỜNG

- Mighty Brains được thiết kế chuyên biệt theo yêu cầu của Hội đồng Giáo dục California với giáo trình sinh động đầy màu sắc cùng công cụ lôi cuốn vui nhộn góp phần thu hút trẻ em. Chương trình hoàn hảo của chúng tôi không chỉ dạy cho học sinh cách tính toán tốc độ và chính xác, mà còn dạy cho học sinh hiểu các khái niệm đằng sau những chức năng toán học này. Mighty Brains cũng dạy trẻ suy nghĩ độc lập, xây dựng kỹ năng lập luận không gian và phát triển kỹ năng phân tích.
 ', 4)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (8, 1, N'Tieng anh giao tiep', NULL, NULL, N'3 thang', N'abc', NULL, NULL, 3500000.0000, 1, NULL, NULL)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (9, 3, N'Tieng anh giao tiep', NULL, NULL, N'3 thang', N'abc', NULL, NULL, 3500000.0000, 1, NULL, NULL)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (10, 3, N'Tieng anh giao tiep', CAST(0xC63C0B00 AS Date), CAST(0x243D0B00 AS Date), N'2', N'abc', NULL, NULL, 3500000.0000, 1, NULL, NULL)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (11, 5, N'PHÁT TRIỂN NÂNG CAO', CAST(0xF23D0B00 AS Date), CAST(0xF33D0B00 AS Date), N'53', N'Đến lớp học Tiếng Anh Phát triển nâng cao các Bé sẽ được học trong môi trường "Học mà chơi, chơi mà học", thông qua nhiều hình thức học tập khác nhau: học qua bảng điện tử It Board, ngôn ngữ cơ thể, thẻ tranh từ, bài hát,trò chơi.giúp Bé học tập, làm quen với Tiếng Anh một cách tự nhiên, yêu thích Tiếng Anh và đầy cảm hứng học Tiếng Anh.', N'/Content/HTML/resources/img/20170105104254_20161121151506_course1.png', 35, 2000000.0000, 0, NULL, NULL)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (12, 3, N'Phát triển nâng cao 2', CAST(0xC73E0B00 AS Date), CAST(0xC83E0B00 AS Date), N'30 buổi', N'cvjxvxjvjdfsdg', N'/Content/HTML/resources/img/20170105104254_20161121151506_course1.png', 34, 30000000.0000, 0, NULL, NULL)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (13, 1, N'PHÁT TRIỂN NÂNG CAO 3', CAST(0xC83E0B00 AS Date), CAST(0xF53D0B00 AS Date), N'50', N'&lt;p&gt;&lt;em&gt;&lt;strong&gt;this is page&lt;/strong&gt;&lt;/em&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;s&gt;&lt;strong&gt;this is page&lt;/strong&gt;&lt;/s&gt;&lt;/p&gt;
', N'/Content/HTML/resources/img/20170105104254_20161121151506_course1.png', 50, 500000000.0000, 1, NULL, NULL)
INSERT [dbo].[KhoaHoc] ([KhoaHocID], [DoTuoiID], [TenKhoaHoc], [NgayBatDau], [NgayKetThuc], [ThoiLuongKhoaHoc], [MoTa], [HinhAnh], [SoLuongHS], [HocPhi], [TrangThai], [ChiTiet], [GiaoVienID]) VALUES (14, 1, N'PHÁT TRIỂN NÂNG CAO 4', CAST(0xC83E0B00 AS Date), CAST(0x35400B00 AS Date), N'30', NULL, N'/Content/HTML/resources/img/20170105104254_20161121151506_course1.png', 13, 4000000.0000, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
SET IDENTITY_INSERT [dbo].[LichKhaiGiang] ON 

INSERT [dbo].[LichKhaiGiang] ([LichKhaiGiangID], [TênLichKhaiGiang], [NgayKhaiGiang], [HinhAnh], [MoTa], [MoTaChiTiet]) VALUES (1, N'Lịch khai giảng tháng 4', CAST(0xCA3E0B00 AS Date), N'~/Content/HTML/resources/img/20170105105857_7-9.png', N'Lịch khai giảng tháng 5/2018', N'Trung tâm Anh ngữ PoPoDoo thông báo khai giảng các lớp học Tiếng anh trẻ em trong tháng 5/2018 với lịch cụ thể như sau:')
INSERT [dbo].[LichKhaiGiang] ([LichKhaiGiangID], [TênLichKhaiGiang], [NgayKhaiGiang], [HinhAnh], [MoTa], [MoTaChiTiet]) VALUES (2, N'Lịch khai giảng tháng 5', CAST(0x083F0B00 AS Date), N'~/Content/HTML/resources/img/20170105105857_7-9.png', N'Lịch khai giảng tháng 5', N'Trung tâm Anh ngữ PoPoDoo thông báo khai giảng các lớp học Tiếng anh trẻ em trong tháng 5/2018 với lịch cụ thể như sau:')
SET IDENTITY_INSERT [dbo].[LichKhaiGiang] OFF
SET IDENTITY_INSERT [dbo].[LopHoc] ON 

INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (1, 2, 1, N'TA01', NULL, CAST(0xD03E0B00 AS Date), 1, 1)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (2, 1, 2, N'TA02', NULL, NULL, 1, 2)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (3, 3, 3, N'TA03', NULL, NULL, 1, 3)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (4, 3, 3, N'TA04', NULL, NULL, 1, 4)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (5, 4, 4, N'TA05', NULL, NULL, 1, 5)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (6, 5, 1, N'TA06', NULL, NULL, 1, 6)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (10, 4, 3, N'TA07', NULL, NULL, 1, 8)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (11, 5, 2, N'TA08', NULL, NULL, 1, 9)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (12, 2, 4, N'TA09', NULL, NULL, 1, 10)
INSERT [dbo].[LopHoc] ([LopHocID], [GiaoVienID], [PhongHocID], [TenLopHoc], [SoLuongHS], [LichThi], [TrangThai], [KhoaHocID]) VALUES (13, 3, 2, N'fdgfd', 44, CAST(0xF13D0B00 AS Date), 1, 2)
SET IDENTITY_INSERT [dbo].[LopHoc] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([NhanVienID], [TenNhanVien], [ChucVu], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong]) VALUES (1, N'Hoàng Đình Cường', N'nhân viên', CAST(0x101F0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(92273932 AS Numeric(18, 0)), 5000000.0000)
INSERT [dbo].[NhanVien] ([NhanVienID], [TenNhanVien], [ChucVu], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong]) VALUES (2, N'Vũ Thị Thúy', N'nhân viên', CAST(0x191D0B00 AS Date), N'Nữ        ', N'Hà Nội', CAST(927274832 AS Numeric(18, 0)), 10000000.0000)
INSERT [dbo].[NhanVien] ([NhanVienID], [TenNhanVien], [ChucVu], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong]) VALUES (3, N'Nguyễn Mạnh Hiệp', N'nhân viên', CAST(0x581E0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(729472927 AS Numeric(18, 0)), 8000000.0000)
INSERT [dbo].[NhanVien] ([NhanVienID], [TenNhanVien], [ChucVu], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong]) VALUES (4, N'Vũ Văn Đông', N'nhân viên', CAST(0xC81E0B00 AS Date), N'Nam       ', N'Hà Nội', CAST(783826384 AS Numeric(18, 0)), 9000000.0000)
INSERT [dbo].[NhanVien] ([NhanVienID], [TenNhanVien], [ChucVu], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Luong]) VALUES (5, N'Trần Thị Thùy Dung', N'Nhân viên', CAST(0x951E0B00 AS Date), N'Nữ        ', N'Hà Nội', CAST(273729282 AS Numeric(18, 0)), 9000000.0000)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[PhongHoc] ON 

INSERT [dbo].[PhongHoc] ([PhongHocID], [TenPhongHoc], [TrangThietBi]) VALUES (1, N'H5201', N'A')
INSERT [dbo].[PhongHoc] ([PhongHocID], [TenPhongHoc], [TrangThietBi]) VALUES (2, N'H5202', N'A')
INSERT [dbo].[PhongHoc] ([PhongHocID], [TenPhongHoc], [TrangThietBi]) VALUES (3, N'H5203', NULL)
INSERT [dbo].[PhongHoc] ([PhongHocID], [TenPhongHoc], [TrangThietBi]) VALUES (4, N'H5204', NULL)
INSERT [dbo].[PhongHoc] ([PhongHocID], [TenPhongHoc], [TrangThietBi]) VALUES (5, NULL, NULL)
INSERT [dbo].[PhongHoc] ([PhongHocID], [TenPhongHoc], [TrangThietBi]) VALUES (6, N'H601', N'B')
SET IDENTITY_INSERT [dbo].[PhongHoc] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [UserName], [PassWord]) VALUES (1, N'Admin1', N'123')
INSERT [dbo].[TaiKhoan] ([TaiKhoanID], [UserName], [PassWord]) VALUES (2, N'Admin2', N'123')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__HocSinhI__1B0907CE] FOREIGN KEY([HocSinhID])
REFERENCES [dbo].[HocSinh] ([HocSinhID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__HocSinhI__1B0907CE]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhoaHoc] FOREIGN KEY([KhoaHocID])
REFERENCES [dbo].[KhoaHoc] ([KhoaHocID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhoaHoc]
GO
ALTER TABLE [dbo].[HocTap]  WITH CHECK ADD  CONSTRAINT [FK_Hoc_HocSinh] FOREIGN KEY([HocSinhID])
REFERENCES [dbo].[HocSinh] ([HocSinhID])
GO
ALTER TABLE [dbo].[HocTap] CHECK CONSTRAINT [FK_Hoc_HocSinh]
GO
ALTER TABLE [dbo].[HocTap]  WITH CHECK ADD  CONSTRAINT [FK_Hoc_LopHoc] FOREIGN KEY([LopHocID])
REFERENCES [dbo].[LopHoc] ([LopHocID])
GO
ALTER TABLE [dbo].[HocTap] CHECK CONSTRAINT [FK_Hoc_LopHoc]
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK__KhoaHoc__DoTuoiI__145C0A3F] FOREIGN KEY([DoTuoiID])
REFERENCES [dbo].[DoTuoi] ([DoTuoiID])
GO
ALTER TABLE [dbo].[KhoaHoc] CHECK CONSTRAINT [FK__KhoaHoc__DoTuoiI__145C0A3F]
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_KhoaHoc_GiaoVien] FOREIGN KEY([GiaoVienID])
REFERENCES [dbo].[GiaoVien] ([GiaoVienID])
GO
ALTER TABLE [dbo].[KhoaHoc] CHECK CONSTRAINT [FK_KhoaHoc_GiaoVien]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_GiaoVien] FOREIGN KEY([GiaoVienID])
REFERENCES [dbo].[GiaoVien] ([GiaoVienID])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_GiaoVien]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_KhoaHoc] FOREIGN KEY([KhoaHocID])
REFERENCES [dbo].[KhoaHoc] ([KhoaHocID])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_KhoaHoc]
GO
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_PhongHoc] FOREIGN KEY([PhongHocID])
REFERENCES [dbo].[PhongHoc] ([PhongHocID])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_PhongHoc]
GO
USE [master]
GO
ALTER DATABASE [Minions] SET  READ_WRITE 
GO
