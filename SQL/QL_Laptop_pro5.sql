USE [master]
GO
/****** Object:  Database [QL_Laptop]    Script Date: 1/5/2023 6:30:11 PM ******/
CREATE DATABASE [QL_Laptop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_Laptop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYCHU\MSSQL\DATA\QL_Laptop.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QL_Laptop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYCHU\MSSQL\DATA\QL_Laptop_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QL_Laptop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_Laptop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_Laptop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_Laptop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_Laptop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_Laptop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_Laptop] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_Laptop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_Laptop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_Laptop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_Laptop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_Laptop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_Laptop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_Laptop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_Laptop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_Laptop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_Laptop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QL_Laptop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_Laptop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_Laptop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_Laptop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_Laptop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_Laptop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_Laptop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_Laptop] SET RECOVERY FULL 
GO
ALTER DATABASE [QL_Laptop] SET  MULTI_USER 
GO
ALTER DATABASE [QL_Laptop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_Laptop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_Laptop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_Laptop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QL_Laptop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QL_Laptop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_Laptop', N'ON'
GO
ALTER DATABASE [QL_Laptop] SET QUERY_STORE = ON
GO
ALTER DATABASE [QL_Laptop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QL_Laptop]
GO
/****** Object:  UserDefinedFunction [dbo].[auto_idProducts2]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[auto_idProducts2]()
RETURNS VARCHAR(16)
AS
BEGIN
	DECLARE @id VARCHAR(16)
	IF (SELECT COUNT(id) FROM Products) = 0
		SET @id = '0'
	ELSE
		SELECT @id = MAX(RIGHT(id, 5)) FROM Products
		SELECT @id = CASE
			WHEN @id = 99999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00001'
			WHEN @id >= 0 and @id < 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 99 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
		END
	RETURN @id
END
--Cập nhật số lượng đã bán bên bảng product
GO
/****** Object:  Table [dbo].[accessory]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accessory](
	[ac_ID] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [char](9) NULL,
	[para_id] [int] NULL,
	[content] [nvarchar](200) NULL,
 CONSTRAINT [pk_ac] PRIMARY KEY CLUSTERED 
(
	[ac_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_] [nvarchar](1000) NULL,
	[active] [bit] NULL,
	[dateUpdate] [datetime] NULL,
	[BannerType] [nvarchar](100) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CancelOrder]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NULL,
	[reason] [nvarchar](500) NULL,
 CONSTRAINT [pk_Co] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [char](9) NULL,
	[proPrice] [int] NULL,
	[CartQuantity] [int] NULL,
	[CartMoney] [int] NULL,
	[cusID] [int] NULL,
	[tt] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[PhieuNhap_id] [char](16) NOT NULL,
	[product_id] [char](9) NOT NULL,
	[quanlity] [int] NULL,
	[price_Import] [bigint] NULL,
	[ratio] [decimal](32, 0) NULL,
 CONSTRAINT [PK_CTPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[PhieuNhap_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [char](9) NULL,
	[cusID] [int] NULL,
	[comMessage] [nvarchar](max) NULL,
	[comDate] [datetime] NULL,
	[cusemail] [nchar](500) NULL,
	[cusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[comID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[ID_address] [int] IDENTITY(1,1) NOT NULL,
	[cusID] [int] NULL,
	[Name_Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[ID_address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[cusID] [int] IDENTITY(1,1) NOT NULL,
	[cusName] [nvarchar](max) NULL,
	[cusGender] [nvarchar](100) NULL,
	[cusEmail] [nvarchar](100) NULL,
	[cusPhone] [nchar](11) NULL,
	[cusPassword] [nchar](10) NULL,
	[cusAddress] [nvarchar](max) NULL,
	[cusType] [int] NULL,
	[cusTotal] [int] NULL,
	[cusQuantityBuy] [int] NULL,
	[cusStatus] [int] NULL,
	[cusPhoto] [char](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customertype]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customertype](
	[CusType] [int] NOT NULL,
	[CusTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customertype] PRIMARY KEY CLUSTERED 
(
	[CusType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Description]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Description](
	[product_id] [char](9) NOT NULL,
	[title] [nvarchar](1000) NULL,
	[content] [nvarchar](4000) NULL,
	[image_] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [char](9) NULL,
	[CPU] [nvarchar](1000) NULL,
	[SoNhan] [nvarchar](100) NULL,
	[SoLuong] [nvarchar](100) NULL,
	[Speed] [nvarchar](1000) NULL,
	[MaxSpeed] [nvarchar](1000) NULL,
	[Cache] [nvarchar](1000) NULL,
	[RAM] [nvarchar](1000) NULL,
	[RAM_type] [nvarchar](1000) NULL,
	[BusRAM] [nvarchar](1000) NULL,
	[MaxRAM] [nvarchar](1000) NULL,
	[OCung] [nvarchar](1000) NULL,
	[ManHinh] [nvarchar](1000) NULL,
	[DoPhanGiai] [nvarchar](1000) NULL,
	[TanSoQuet] [nvarchar](1000) NULL,
	[CongNgheManHinh] [nvarchar](1000) NULL,
	[VGA] [nvarchar](1000) NULL,
	[AmThanh] [nvarchar](1000) NULL,
	[CongGiaoTiep] [nvarchar](1000) NULL,
	[KetNoiKhongDay] [nvarchar](1000) NULL,
	[Webcam] [nvarchar](1000) NULL,
	[TinhNangKhac] [nvarchar](1000) NULL,
	[DenBanPhim] [nvarchar](1000) NULL,
	[SizeAndWeight] [nvarchar](1000) NULL,
	[ChatLieu] [nvarchar](1000) NULL,
	[Pin] [nvarchar](1000) NULL,
	[HeDieuHanh] [nvarchar](1000) NULL,
	[RaMat] [nvarchar](1000) NULL,
 CONSTRAINT [PK_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailsOrders]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailsOrders](
	[DeOrderID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[proID] [char](9) NULL,
	[orderAddress] [nvarchar](max) NULL,
	[proPrice] [int] NULL,
	[orderQuantity] [int] NULL,
	[orderMoney] [int] NULL,
	[cusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[empID] [int] IDENTITY(1,1) NOT NULL,
	[empName] [nvarchar](50) NULL,
	[empDate] [date] NULL,
	[empPhoto] [char](100) NULL,
	[empAddress] [nvarchar](max) NULL,
	[empSalary] [int] NULL,
	[empBonus] [int] NULL,
	[empStartTime] [date] NULL,
	[empEmail] [char](100) NULL,
	[empPhone] [char](10) NULL,
	[empPassword] [nchar](100) NULL,
	[empRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesRole]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesRole](
	[empRole] [int] IDENTITY(1,1) NOT NULL,
	[empRoleName] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[empRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[product_id] [char](9) NOT NULL,
	[image_] [nvarchar](1000) NOT NULL,
	[active] [bit] NULL,
	[dateUpdate] [datetime] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[image_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameOrderStatus]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameOrderStatus](
	[IDStatus] [int] NOT NULL,
	[NameOrderStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_NameOrderStatus] PRIMARY KEY CLUSTERED 
(
	[IDStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [datetime] NULL,
	[orderStatus] [nvarchar](50) NULL,
	[empID] [int] NULL,
	[cusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parameter]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parameter](
	[paraID] [int] IDENTITY(1,1) NOT NULL,
	[paraName] [nvarchar](200) NULL,
	[tt_id] [int] NULL,
 CONSTRAINT [pk_para] PRIMARY KEY CLUSTERED 
(
	[paraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[id] [char](16) NOT NULL,
	[employee_id] [int] NULL,
	[date_] [datetime] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [char](9) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[quanlity] [int] NULL,
	[purchase] [int] NULL,
	[price] [decimal](32, 0) NULL,
	[trademark_id] [int] NULL,
	[avatar] [nvarchar](1000) NULL,
	[productType_id] [int] NULL,
	[view_] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[productType_id] [int] NOT NULL,
	[Name_ProductType] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[productType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotions]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotions](
	[product_id] [char](9) NOT NULL,
	[date_start] [date] NOT NULL,
	[date_end] [date] NULL,
	[price] [decimal](32, 0) NULL,
	[price_after] [decimal](32, 0) NULL,
 CONSTRAINT [PK_promotions] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[date_start] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionsGift]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionsGift](
	[product_id] [char](9) NOT NULL,
	[gift1] [nvarchar](1000) NULL,
	[gift2] [nvarchar](1000) NULL,
	[gift3] [nvarchar](1000) NULL,
	[gift4] [nvarchar](1000) NULL,
	[priceSum] [decimal](32, 0) NULL,
	[date_start] [date] NULL,
	[date_end] [date] NULL,
 CONSTRAINT [PK_PromotionsGift] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleDetailAccessory]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleDetailAccessory](
	[tt_id] [int] IDENTITY(1,1) NOT NULL,
	[ttName] [nvarchar](200) NULL,
 CONSTRAINT [pk_tt] PRIMARY KEY CLUSTERED 
(
	[tt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trademark]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trademark](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_trademark] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accessory] ON 

INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (2, N'PKC000041', 13, N'USB Type-C')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (3, N'PKC000041', 14, N'USB Type-C')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (4, N'PKC000041', 15, N'1 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (5, N'PKC000041', 16, N'20 W')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (6, N'PKC000041', 17, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (7, N'PKC000041', 18, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (15, N'PKC000042', 12, N'Sạc Truyền dữ liệu')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (16, N'PKC000042', 13, N'USB Type-C')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (19, N'PKC000042', 16, N'Hãng không công bố')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (22, N'PKC000042', 14, N'USB Type-C')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (24, N'PKC000042', 19, N'Hỗ trợ sạc nhanh')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (25, N'PKC000042', 15, N'1 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (27, N'PKC000042', 18, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (28, N'PKC000042', 17, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (29, N'PKC000043', 20, N'MacOS (MacBook, iMac)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (30, N'PKC000043', 21, N'1500 DPI')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (31, N'PKC000043', 22, N'10M')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (32, N'PKC000043', 10, N'Bluetooth')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (33, N'PKC000043', 23, N'Không có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (34, N'PKC000043', 24, N'Không có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (35, N'PKC000043', 25, N'Pin sạc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (36, N'PKC000043', 26, N'Dùng 2 tháng - Sạc 2 giờ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (37, N'PKC000043', 27, N'Lightning')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (38, N'PKC000043', 28, N'80 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (39, N'PKC000043', 2, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (40, N'PKC000043', 3, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (41, N'PKC000044', 2, N' Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (42, N'PKC000044', 3, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (43, N'PKC000044', 4, N'Dài 41.87 cm - Rộng 11.49 cm - Dày 1.09 cm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (44, N'PKC000044', 5, N'390 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (45, N'PKC000044', 6, N' Hãng không công bố')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (46, N'PKC000044', 7, N'Khoảng 1 tháng')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (47, N'PKC000044', 8, N'macOS 11.4 trở lên')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (48, N'PKC000044', 9, N' Có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (49, N'PKC000044', 11, N'Không có WiFi')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (50, N'PKC000044', 10, N'Sạc qua cổng Lightning')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (51, N'PKC000047', 8, N'MacOS (MacBook, iMac)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (52, N'PKC000047', 21, N'1500 DPI')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (53, N'PKC000047', 10, N'Bluetooth')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (54, N'PKC000047', 22, N'10m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (56, N'PKC000047', 23, N'Không có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (57, N'PKC000047', 24, N'Không có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (58, N'PKC000047', 25, N'Pin sạc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (59, N'PKC000047', 26, N'Dùng 2 tháng - Sạc 2 giờ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (60, N'PKC000047', 27, N'Lightning')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (61, N'PKC000047', 28, N'80 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (62, N'PKC000047', 18, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (63, N'PKC000047', 2, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (64, N'PKC000045', 2, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (65, N'PKC000045', 3, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (66, N'PKC000046', 2, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (67, N'PKC000046', 3, N'Mỹ')
SET IDENTITY_INSERT [dbo].[accessory] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (1, N'header1.png', 1, CAST(N'2021-11-16T20:21:22.813' AS DateTime), N'Top')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (2, N'header2.png', 1, CAST(N'2021-11-16T20:21:22.813' AS DateTime), N'Top')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (3, N'header3.png', 1, CAST(N'2021-11-16T20:21:22.813' AS DateTime), N'Top')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (4, N'banner1.jpg', 1, CAST(N'2021-11-16T20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (5, N'banner2.jpg', 1, CAST(N'2021-11-16T20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (6, N'banner3.jpg', 1, CAST(N'2021-11-16T20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (7, N'banner4.jpg', 1, CAST(N'2021-11-16T20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (8, N'banner5.jpg', 1, CAST(N'2021-11-16T20:21:25.887' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (9, N'banner6.jpg', 1, CAST(N'2021-11-16T20:21:25.887' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (10, N'banner7.jpg', 1, CAST(N'2021-11-16T20:21:25.887' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (11, N'QC1.jpg', 1, CAST(N'2021-11-16T20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (12, N'QC2.jpg', 1, CAST(N'2021-11-16T20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (13, N'QC3.jpg', 1, CAST(N'2021-11-16T20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (14, N'QC4.jpg', 1, CAST(N'2021-11-16T20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (16, N'Logo.png', 1, CAST(N'2021-11-16T21:57:54.017' AS DateTime), N'Logo')
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[CancelOrder] ON 

INSERT [dbo].[CancelOrder] ([id], [id_order], [reason]) VALUES (1, 1012, N'Không muốn nữa')
SET IDENTITY_INSERT [dbo].[CancelOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID], [tt]) VALUES (1036, N'LAP000004', 40250000, 2, 80500000, 1003, 1)
INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID], [tt]) VALUES (1037, N'LAP000048', 20177700, 2, 40355400, 1003, 1)
INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID], [tt]) VALUES (1038, N'LAP000031', 55650000, 2, 111300000, 1003, 1)
INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID], [tt]) VALUES (1039, N'LAP000057', 27529800, 2, 55059600, 1003, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000001', N'PKC000042', 20, 500000, CAST(10 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000002', N'PKC000043', 50, 2540000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000003', N'PKC000044', 100, 3740000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000004', N'PKC000045', 100, 3900000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000005', N'PKC000046', 100, 295000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000006', N'LAP000031', 100, 53000000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000007', N'LAP000032', 100, 32990000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000008', N'LAP000033', 100, 35990000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000009', N'LAP000034', 100, 33000000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000010', N'LAP000035', 100, 41000000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11242022PN000011', N'LAP000036', 100, 23990000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11242022PN000012', N'LAP000037', 19, 13790000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11242022PN000013', N'LAP000038', 90, 12890000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11242022PN000014', N'LAP000039', 20, 23990000, CAST(3 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11242022PN000015', N'LAP000040', 120, 23090000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11262022PN000017', N'PKC000041', 100, 500000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000018', N'LAP000047', 10, 12090000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000019', N'LAP000047', 20, 12090000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000020', N'LAP000048', 35, 19590000, CAST(3 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000021', N'LAP000049', 50, 27490000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000022', N'LAP000050', 20, 19090000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000023', N'LAP000051', 30, 14590000, CAST(3 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000024', N'PKC000047', 10, 2115000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11272022PN000025', N'LAP000052', 10, 14590000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1252022PN000026 ', N'LAP000053', 10, 9990000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1252022PN000027 ', N'LAP000054', 20, 26990000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1252022PN000028 ', N'LAP000055', 15, 6290000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1252022PN000030 ', N'LAP000056', 25, 35490000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1252022PN000031 ', N'LAP000057', 30, 26990000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1282022PN000032 ', N'LAP000058', 20, 49790000, CAST(2 AS Decimal(32, 0)))
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (1, N'LAP000000', 1003, N'hh', CAST(N'2022-12-16T15:47:45.300' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (2, N'LAP000000', 1003, N'hh', CAST(N'2022-12-16T15:47:49.733' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (3, N'LAP000000', 1003, N'hh', CAST(N'2022-12-16T15:47:56.147' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (4, N'LAP000000', 1003, N'hh', CAST(N'2022-12-16T15:48:15.057' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (5, N'LAP000000', 1003, N'hh', CAST(N'2022-12-16T15:48:28.267' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 

INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (4, 1003, N'Số 438A ,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (5, 1003, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (7, 1004, N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (8, 1004, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (9, 1004, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (10, 1004, N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1003, N'Nguyễn Nam', N'Nam', N'nguyennhutnam@gmail.com', N'0339906489 ', N'123       ', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 1, 577189300, 23, 1, N'admin.jpg                                                                                           ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1004, N'Bùi Thị KimQuyên', N'Nữ', N'quin.12177@gmail.com', N'0397495029 ', N'123       ', N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre', 1, 0, 0, 1, N'beQuin.jpg                                                                                          ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1005, N'QuyênBùi', N'Nữ', N'quyen.12177@gmail.com', N'0397495029 ', N'123       ', NULL, 1, 0, 0, 1, N'beQuin.jpg                                                                                          ')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (1, N'Khách hàng thường')
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (2, N'Khách hàng thân thiết')
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (3, N'Khách VIP')
GO
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000000', N'Macbook 12 inch - Hoàn hảo hơn với vỏ nhôm nguyên khối sang trọng, siêu mỏng và siêu nhẹ', N'Nhiều lúc, mọi người không biết họ muốn gì cho tới khi bạn chỉ cho họ” - Nhà sáng lập Apple Steve Jobs đã từng nói và làm như vậy. Kết quả là Apple luôn mang lại những sản phẩm đỉnh cao nhưng cũng cực kỳ tinh tế khiến người dùng không thể rời mắt. Macbook 12 inch là một minh chứng. Thiết kế khó có thể hoàn hảo hơn với vỏ nhôm nguyên khối sang trọng, siêu mỏng và siêu nhẹ, một màn hình với độ phân giải khủng cùng nhiều tính năng đặc trưng của dòng Macbook đầy thành công của Apple.', N'lap000000.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000001', N'Chắc chắn hơn bao giờ hết nhờ độ bền chuẩn quân đội, laptop Asus Zenbook UX325EA (KG363T) sở hữu kiểu dáng tinh tế cùng hiệu năng tối ưu nhờ CPU Intel thế hệ 11, giúp bạn xử lý nhanh gọn và chính xác mọi tác vụ.', N'Laptop được trang bị chip Intel Core i5 Tiger Lake 1135G7 giúp bạn hoàn thành công việc nhanh chóng, từ các tác vụ văn phòng như word, excel,... đến các công việc sáng tạo, đồ họa khác với tốc độ CPU 2.40 GHz và đạt tối đa đến 4.2 GHz nhờ Turbo Boost.Đem đến khả năng xử lý hình ảnh sắc nét lên đến chuẩn 8K nhờ card đồ họa tích hợp Intel Iris Xe Graphics, đáp ứng mọi nhu cầu của người dùng với những trải nghiệm chân thật cùng các tựa game hấp dẫn hay thỏa sức sáng tạo với các ứng dụng đồ họa như Photoshop, Ai, Lightroom,...RAM 8 GB LPDDR4X (On board) với tốc độ bus RAM 4267 MHz cho bạn sự đa nhiệm khi có thể mở nhiều ứng dụng cùng lúc và chuyển đổi qua lại một cách mượt mà.', N'lap000001.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000031', N'Nội dung về tính năng', N'MacBook Pro mới mang đến hiệu năng cao ấn tượng cho người dùng pro. Lựa chọn M1 Pro mạnh mẽ hay M1 Max còn mạnh hơn thế để tăng tốc xử lý các luồng công việc đẳng cấp pro cùng thời lượng pin đáng kinh ngạc.1 Với màn hình Liquid Retina XDR 14 inch sống động và nhiều cổng kết nối chuyên nghiệp, bạn có thể làm được nhiều việc hơn bao giờ hết với MacBook Pro.', N'mac_pro_m1_2021_4.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000032', N'Nội dung về tính năng', N'Siêu mạnh mẽ với chip M2 thế hệ tiếp theo, MacBook Air được thiết kế mới, kết hợp giữa hiệu năng đáng kinh ngạc và thời lượng pin lên đến 18 giờ trong vỏ nhôm mỏng ấn tượng.', N'macbook-air-m2-2022-8-core-gpu-xám-650x650 - Copy.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000033', N'Nội dung về tính năng', N'MacBook Pro 13 inch nay đa năng hơn bao giờ hết. Siêu mạnh mẽ với chip M2 thế hệ tiếp theo, đây là chiếc máy tính xách tay chuyên nghiệp nhỏ gọn nhất của Apple, cùng thời lượng pin lên đến 20 giờ.', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000034', N'Nội dung về tính năng', N'Chip Apple M1 định nghĩa lại MacBook Pro 13 inch. Sở hữu CPU 8 lõi xử lý siêu tốc các luồng công việc phức hợp trong lĩnh vực hình ảnh, mã hóa, biên tập video cùng nhiều việc khác. GPU 8 lõi siêu mạnh xử lý gọn các tác vụ đồ họa khủng và chạy game siêu mượt. Neural Engine 16 lõi tiên tiến tăng cường sức mạnh công nghệ máy học tích hợp trong các ứng dụng yêu thích của bạn. Bộ nhớ thống nhất siêu nhanh cho mọi hoạt động mượt mà. Và thời lượng pin dài nhất từng có trên máy Mac, lên đến 20 giờ.2 Đây chính là chiếc máy tính xách tay chuyên nghiệp thịnh hành nhất của Apple. Hiệu năng cao hơn hẳn, pro hơn hẳn.', N'macbook-pro-13-spgry-m1-thumb-650x650.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000035', N'Nội dung về tính năng', N'MacBook Pro 13 inch nay đa năng hơn bao giờ hết. Siêu mạnh mẽ với chip M2 thế hệ tiếp theo, đây là chiếc máy tính xách tay chuyên nghiệp nhỏ gọn nhất của Apple, cùng thời lượng pin lên đến 20 giờ.', N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000036', N'Laptop HP VICTUS 16 d0292TX i5 (5Z9R3PA) sẽ là một người bạn đồng hành đắc lực trên mọi chiến trường ảo của game thủ nhờ ngoại hình sang trọng, hiện đại cùng những thông số kỹ thuật mạnh mẽ. ', N'Trang bị chip Intel Core i5 11400H cùng card rời NVIDIA GeForce RTX3050Ti 4 GB, laptop HP Victus sẵn sàng cùng bạn chiến mọi tựa game đình đám như LOL, PUBG, CS:GO,... hay thỏa mãn đam mê sáng tạo với các ứng dụng đồ họa của nhà Adobe. 

Vừa chiến game vừa nghe nhạc giải trí vẫn rất mượt mà, không giật lag nhờ bộ nhớ RAM 8 GB, ổ cứng 512 GB SSD (có thể tháo và lắp thanh khác tối đa 1 TB) mang đến không gian lưu trữ ổn định cùng tốc độ mở máy nhanh chóng hơn.  

• Quan sát di chuyển của đối thủ ở mọi góc cạnh nhờ kích thước màn hình 16.1 inch cùng tấm nền IPS tạo góc nhìn rộng rãi, độ phân giải Full HD cùng công nghệ Wled-backlit mang đến những khung ảnh chất lượng, sắc nét hơn. 

• Tần số quét 144 Hz cho mọi chuyển động có tốc độ nhanh được mượt mà hơn đáng kể, đồng thời vẫn bảo vệ thị giác của người dùng trước ánh sáng xanh của máy nhờ màn hình chống chói Anti Glare. 

• Công nghệ Audio by B&O kết hợp với Realtek High Definition Audio đắm chìm người dùng vào chính khung cảnh của trận chiến với chất âm sống động, chân thực.

• Chiếc laptop này được bao bọc bởi lớp vỏ nhựa cùng chiếc áo đen toát lên vẻ sang chảnh, mạnh mẽ. Cân nặng 2.46 kg vẫn có thể chấp nhận được trong phân khúc laptop gaming và sẵn sàng cùng bạn chiến đấu khắp mọi nơi.

• Laptop có bàn phím số giúp các thao tác nhập liệu chữ số được tiện lợi hơn rất nhiều, ngoài ra còn có thêm đèn nền phím giúp bạn thoải mái làm việc ở những nơi thiếu sáng.

• Laptop HP được trang bị các cổng kết nối bao gồm USB 3.1, Jack tai nghe 3.5 mm, HDMI, LAN (RJ45) và USB Type-C giúp kết nối với các thiết bị ngoại vi khác nhanh chóng hơn.', N'lap36_6.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000037', N'Sẵn sàng đồng hành cùng bạn đến trường học cùng laptop HP 240 G8 i3 (617K6PA) với thiết kế gọn nhẹ, cấu hình tốt trong tầm giá, khả năng xử lý các tác vụ học tập lẫn công việc, hứa hẹn sẽ là một chiếc laptop học tập - văn phòng mà các bạn không thể bỏ qua.', N' Trang bị công nghệ CPU Intel Core i3 1005G1 cùng card Intel UHD Graphics giúp laptop này có khả năng chơi mượt mà các tựa game online nhẹ như Liên Minh Huyền Thoại, Fifa Online 4 ở mức cài đặt thấp đồng thời xử lý các tác vụ học tập, làm việc hay lướt web giải trí đều mượt mà.
 Laptop HP trang bị màn hình kích thước 14 inch, độ phân giải Full HD cho khả năng hiển thị hình ảnh sắc nét, thỏa thích xem phim với màn hình lớn. Giải trí đỉnh cao bằng công nghệ Realtek High Definition Audio với khả năng khuếch đại âm thanh giúp bạn có những trải nghiệm nghe nhạc tuyệt vời nhất.

• Công nghệ chống chói Anti Glare cùng độ sáng 250 nits tiện lợi cho người dùng sử dụng laptop ở bất kỳ đâu, dưới bất kỳ ánh sáng mà không sợ hiện tượng chói.

• Máy có RAM 4 GB cho phép đa nhiệm ở mức ổn, thoải mái vừa làm bài tập vừa nghe nhạc trên YouTube hoặc vừa xem phim Netflix vừa học online trên Microsoft Teams. Nếu cần thêm sức mạnh đa nhiệm hoặc có nhu cầu chơi game, có thể nâng cấp thêm RAM tối đa 32 GB.

• SSD 512 GB giúp máy lưu trữ tốt các dữ liệu cá nhân mà không sợ hết dung lượng, công nghệ ổ đĩa SSD giúp máy truy xuất dữ liệu nhanh chóng, khởi động ứng dụng chỉ trong vòng vài giây.

• Các công nghệ khác đáng chú ý như HD webcam tiện lợi cho các buổi học online, TPM 2.0 giúp tăng cường bảo mật bằng cách mã hóa dữ liệu trên ổ cứng.

• Laptop HP cơ bản trang bị nhiều cổng kết nối để người dùng xử lý công việc tiện lợi hơn như SuperSpeed USB A, Jack tai nghe 3.5 mm, HDMI, LAN, USB Type-C. Máy được cài sẵn Windows 11 Home SL mượt mà, hiện đại, bảo mật. ', N'lap37_2.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000038', N'Laptop HP 15s fq2662TU i3 (6K795PA) sẽ là sự lựa chọn phù hợp cho học sinh, sinh viên muốn tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình ổn định, đáp ứng tốt mọi nhu cầu cơ bản cùng một mức giá lý tưởng, dễ dàng tiếp cận.', N'Laptop HP cơ bản được bao bọc bởi lớp vỏ nhựa màu bạc, mang đến vẻ đẹp tối giản nhưng cũng không kém phần thanh lịch, tao nhã. Khối lượng 1.7 kg hỗ trợ bạn bỏ vào balo dễ dàng và mang đến khắp mọi nơi để học tập, làm việc.

• Các cổng kết nối như USB Type-C, USB A, HDMI, khe đọc thẻ nhớ SD và Jack tai nghe 3.5 mm được trang bị xung quanh laptop cho phép bạn kết nối với các thiết bị ngoại vi khác như loa, chuột, máy chiếu,... nhanh chóng hơn mà không cần đến dây cáp rườm rà.

• Laptop HP trang bị bộ vi xử lý Intel Core i3 1115G4 và card Intel UHD Graphics giải quyết nhẹ nhàng các tác vụ học tập, làm việc trên Word, Excel, PowerPoint,... hay chỉnh sửa ảnh, thiết kế cơ bản trên Figma, Canva,... một cách mượt mà.

• RAM 4 GB cho phép bạn vừa soạn thảo văn bản trên Word vừa nghe nhạc giải trí mà vẫn trơn tru, suôn sẻ. Không gian lưu trữ ổn định nhờ ổ cứng SSD 256 GB, nó có thể tháo ra và lắp thanh khác tối đa 1 TB.

• Màn hình 15.6 inch cho không gian hiển thị rộng rãi cùng độ sáng 250 nits giúp bạn quan sát rõ mọi nội dung được hiển thị trên màn hình ở điều kiện văn phòng mát mẻ. 

• Công nghệ âm thanh Stereo speakers mang đến chất lượng âm thanh tốt, ro rõ, đắm chìm bạn vào những phút giây thư giãn tuyệt vời. ', N'Laptop HP 15s fq2662TU i3 1115G44GB256GBWin11 (6K795PA).jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000039', N'Laptop Lenovo Yoga Slim 7 14ITL05 i7 (82A300DQVN) hướng đến sự toàn vẹn về thiết kế tạo nên một phiên bản laptop cao cấp - sang trọng hiện đại kết hợp cùng cấu hình mạnh mẽ, tự tin đồng hành cùng bạn trên mọi phương diện làm việc và giải trí.', N'Laptop Lenovo được chế tác với lớp vỏ ngoài bằng kim loại cứng cáp, tạo sự bền bỉ trong quá trình sử dụng. Thiết kế bản lề có khả năng mở góc lên đến 180 độ cho phép mình chỉnh góc nhìn cũng như chia sẻ hình ảnh, dữ liệu với bạn bè, đồng nghiệp mà không cần di chuyển máy phức tạp.
Nắp lưng có thiết kế quen thuộc với logo “YOGA” và “Lenovo” được bố trí ở hai phía góc máy. Khối lượng nhẹ chỉ 1.36 kg cùng độ dày khiêm tốn 14.9 mm thuận tiện để mình di chuyển, không tốn quá nhiều không gian trong balo, cùng mình đi khắp mọi nơi từ công ty cho đến quán cà phê.
Cảm biến vân tay được tích hợp trên nút nguồn nằm ở cạnh bên của máy cho phép mình mở khóa nhanh chóng, thực hiện thanh toán trực tuyến cũng như thay cho mật khẩu truy cập vào dữ liệu, ứng dụng chỉ với một chạm đơn giản. Bạn cũng có thể kích hoạt tính năng mở khóa khuôn mặt trên máy nhờ trang bị camera IR, đáp ứng trọn vẹn nhu cầu bảo mật.
Laptop được trang bị chip bảo mật TPM 2.0 giúp bảo mật dữ liệu cá nhân khỏi các cuộc xâm nhập trái phép, đây là một tính năng quan trọng đối với những người dùng là doanh nhân luôn cần bảo mật các số liệu lưu trữ trên máy. Đồng thời chip TPM 2.0 cũng là trang bị quan trọng để mình có thể nâng cấp máy lên Windows 11.

Bàn phím của máy có hành trình sâu, độ nảy tốt, khoảng cách giữa các phím rộng rãi tạo cho mình cảm giác thoải mái khi gõ. Bàn phím cũng có đèn nền hỗ trợ mình soạn thảo văn bản ở những nơi tối, rất hữu ích để chạy deadline.', N'lap39_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000040', N'Bộ hiệu năng gây ấn tượng đến từ con chip AMD mạnh mẽ cùng thiết kế cá tính, nổi bật, laptop Dell Gaming G15 5515 R5 (P105F004DGR) sẽ đáp ứng tối ưu mọi nhu cầu từ các tác vụ văn phòng cơ bản đến những ứng dụng đồ họa, chơi game giải trí chuyên nghiệp.', N'Laptop Dell Gaming hoàn thiện từ chất liệu nhựa cao cấp, bền bỉ, phủ gam màu xám thời thượng, thu hút bạn từ cái nhìn đầu tiên, thích hợp với đa dạng đối tượng người dùng bởi phong cách gaming hiện đại, không quá hầm hố.

& Khối lượng 2.8 kg và độ dày 26.9 mm tạo cảm giác cứng cáp hơn cho máy, nhưng vẫn vừa vặn nằm gọn trong balo, tiện lợi cùng bạn di chuyển mọi lúc mọi nơi để học tập, làm việc cũng như chơi game giải trí hoàn hảo.
Bàn phím có khoảng cách rộng rãi, hợp lý với hành trình phím sâu, nút bấm êm, độ nảy tốt tạo cảm giác nhạy bén, chuẩn xác, thoải mái khi nhập liệu, soạn thảo. Đặc biệt, trang bị đèn nền đơn sắc nổi bật tích hợp dưới bàn phím tạo thêm điểm nhấn cho chiếc laptop này vừa giúp người dùng thuận tiện làm việc hay chiến game ở những nơi thiếu sáng.
& Laptop Dell trang bị đa dạng các cổng kết nối thông dụng bao gồm: 2 x USB 2.0, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 3.2, USB Type-C giúp liên kết dễ dàng và truyền tải dữ liệu nhanh chóng đến các thiết bị ngoại vi tương thích như màn hình rời, máy chiếu, loa, chuột, máy in,... 
& Hai chuẩn kết nối không dây Bluetooth 5.2, Wi-Fi 6 (802.11ax) cho tốc độ truyền tệp nhanh, giảm độ trễ giảm, đảm bảo cho đường truyền internet của bạn luôn trong trạng thái ổn định, hạn chế xảy ra hiện tượng ngắt quãng giữa chừng.
& Dell Gaming G15 mang hiệu suất cao nhờ sở hữu bộ vi xử lý AMD Ryzen 5 5600H có cấu trúc 6 nhân 12 luồng cho tốc độ xung nhịp cơ bản 3.30 GHz và đạt tối đa lên đến Turbo Boost 4.2 GHz, giúp giải quyết trơn tru các công việc văn phòng cơ bản như Word, Excel, Powerpoint,... đến thiết kế đồ họa, kỹ thuật chuyên dụng trên công cụ Photoshop, Illustrator, Figma, AutoCAD,... 

& Laptop RAM 16 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB) tốc độ bus RAM 3200 MHz, hỗ trợ nâng cấp tối đa 32 GB, đa nhiệm siêu mượt mà, bạn hoàn toàn có thể mở hàng chục cửa sổ vừa làm việc, vừa nghe nhạc thư giãn mà không lo giật lag, đứng máy.', N'lap40_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000047', N'Laptop Dell Inspiron 15 3511 i3 (P112F001CBL) sở hữu thiết kế sang trọng, thanh lịch với sức mạnh hiệu năng đến từ dòng chip Intel thế hệ thứ 11 đáp ứng tốt các tác vụ học tập, văn phòng và giải trí cơ bản của người dùng học sinh, sinh viên.', N'Dell Inspiron 15 có lớp vỏ nhựa nhám màu đen trơn điểm thêm logo hãng đơn giản mà tinh tế cùng các cạnh bo cong mềm mại tạo nên tổng thể thanh lịch, sang trọng, phù hợp với mọi không gian. Trải nghiệm của mình trên tay thì chiếc máy có độ hoàn thiện cao, không ọp ẹp vì bản lề chắc chắn. Laptop có khối lượng 1.7 kg, độ dày máy 18.9 mm tương đối mỏng nhẹ, tính di động cao, dễ dàng bỏ gọn gàng vào balo để mang theo bên người.

& Chiếc máy nổi bật với phần bản lề kép. Khi mình mở máy, phần bản lề tạo độ nâng nhẹ để thao tác bàn phím tốt hơn, đồng thời gia tăng khả năng tản nhiệt cho máy, ổn định hiệu suất sử dụng.

& Hệ bàn phím với khoảng cách phím vừa phải, độ nảy và độ nhạy tốt, phím nhấn êm, chuẩn xác, thiết kế fullsize tiện cho cả nhu cầu soạn thảo văn bản và các tác vụ kế toán,... Mình chỉ mất ít thời gian để thuộc vị trí phím và mọi thao thác gõ nhập văn bản dễ dàng, hạn chế tình trạng nhập sai.
Laptop Dell Inspiron này hỗ trợ bạn đầy đủ các kết nối thông dụng phục vụ học tập, làm việc, giải trí, bao gồm kết nối không dây Bluetooth và Wi-Fi 802.11 a/b/g/n/ac, cổng USB 3.2, HDMI, jack tai nghe 3.5 mm, cổng USB 2.0 và khe cắm thẻ SD.

& Ngoài ra, HD webcam sẽ hữu ích cho nhu cầu giao tiếp video của bạn, tiện học tập, làm việc trực tuyến qua Zoom, Google Meet, Microsoft Teams,…
& Dell Inspiron được cung cấp sức mạnh hiệu năng từ bộ xử lý Intel Core i3 1115G4 cùng card đồ hoạ Intel UHD Graphics. Cá nhân mình cảm nhận laptop chạy tốt các ứng dụng Office kể cả chơi tựa game nhẹ như Liên Minh Huyền Thoại. Máy xử lý mượt trung bình khoảng 60 FPS. Con số mình nghĩ là tạm chấp nhận được để mua chiếc máy khi nhu cầu chơi game chỉ là thứ yếu.', N'lap47_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000048', N'Laptop Dell Vostro 3510 i5 (P112F002BBL) sở hữu cấu hình mạnh mẽ, đa nhiệm mượt mà trên sức mạnh của bộ vi xử lý Intel thế hệ 11, cùng một thiết kế đơn giản mà sang đẹp, sẽ là lựa chọn đắt giá đáp ứng nhu cầu học tập, làm việc hay giải trí của bạn.', N'Được trang bị dòng chip Intel Core i5 Tiger Lake 1135G7 mạnh mẽ, hoạt động trên xung nhịp cơ bản 2.4 GHz và ép xung lên đến 4.2 GHz ở chế độ Turbo Boost, Dell Vostro 3510 dễ dàng giải quyết mượt mà các tác vụ như soạn thảo hợp đồng trên Word, nhập liệu và thống kê qua Excel, tạo bảng thuyết trình cùng PowerPoint,... hay thiết kế đồ hoạ cơ bản trên các ứng dụng nhà Adobe cũng hiệu quả không kém.

& Sự hỗ trợ của bộ nhớ RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời) với tốc độ Bus RAM lên đến 3200 MHz cho quá trình đa nhiệm trên laptop càng trơn tru, ổn định hơn, không gặp tình trạng giật lag máy, đơ màn hình. Máy cho phép nâng cấp RAM lên đến 16 GB để tăng sức mạnh cấu hình cho những tác vụ nặng.

& Bên cạnh đó, sức mạnh đồ họa từ card đồ họa rời NVIDIA GeForce MX350 2 GB cải tiến khả năng xử lý đồ họa thiết kế sản phẩm poster, banner,... ấn tượng cũng hiệu render video ngắn hiệu quả, từ đó giúp tăng trải nghiệm của người dùng, bạn cũng dễ dàng thử các tựa game nhẹ nhàng thịnh hành một cách mượt mà.

& Laptop SSD 512 GB NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230)) cho phép lưu trữ khá thoải mái dữ liệu cá nhân cho công việc, giải trí, hỗ trợ khởi động máy nhanh chóng, truy xuất dữ liệu ổn định. Khi cần mở rộng không gian lưu trữ, bạn cũng có thể dùng khe cắm HDD SATA (nâng cấp tối đa 2 TB).
& Laptop Dell Vostro có lớp vỏ ngoài bằng nhựa màu đen hiện đại, tổng thể thiết kế toát lên sự chắc chắn, sang trọng mà rất thanh lịch, các chi tiết tinh tế, đẹp mắt. Máy có khối lượng 1.69 kg, độ dày 18.9 mm dễ dàng để mang theo trong hành trang thường nhật cho học tập, làm việc.
Cảm biến vân tay tích hợp hỗ trợ truy cập màn hình nhanh chỉ với 1 chạm, khả năng bảo mật tốt trên thiết bị cá nhân của bạn.

& Laptop Dell có đầy đủ các cổng kết nối thông dụng gồm cổng USB 3.2 x 2, cổng HDMI, jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0 và khe đọc thẻ SD, kết nối thuận tiện với nhiều thiết bị ngoại vi để phục vụ công việc. Bên cạnh đó còn có kết nối không dây Bluetooth và Wi-Fi 802.11 a/b/g/n/ac độ nhạy cao, đảm bảo hiệu suất sử dụng máy của bạn.', N'lap48_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000049', N'Không những mang đến cho người dùng hiệu năng ấn tượng nhờ con chip Intel thế hệ 11 tân tiến, laptop Dell Gaming G15 5511 i5 11400H (70266676) còn sở hữu thiết kế thời thượng, lôi cuốn, hứa hẹn sẽ là người cộng sự lý tưởng cùng bạn chinh phục mọi chiến trường.', N'Đến với chiếc laptop, ngôn ngữ thiết kế đã được thay đổi so với các phiên bản tiền nhiệm, hầm hố hơn, các đường nét cắt xẻ tăng thêm phần gaming cho chiếc máy. Lớp vỏ nhựa màu xám bao bọc bên ngoài chiếc laptop Dell Gaming này mang đến sự bền bỉ hoàn mỹ cùng khối lượng 2.81 kg và dày 25 mm, với mình đây là một con số vừa đủ để có thể mang theo bên người, phục vụ cho nhu cầu làm việc cũng như giải trí cho bản thân. 
& Đèn nền tiện lợi cùng các phím gõ sâu, độ nảy tốt được trang bị ở chiếc laptop Dell này hỗ trợ người dùng tối đa trong quá trình học tập, làm việc cũng như chơi các tựa game mà không lo nhầm lẫn, nâng cao hiệu suất làm việc dù ở bất kỳ điều kiện ánh sáng nào.
& Phiên bản laptop này còn được trang bị hàng loạt những cổng giao tiếp thông dụng dọc hai bên máy như USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45) và USB Type-C, cho phép bạn kết nối hay truyền xuất dữ liệu đến nhiều loại thiết bị ngoại vi tương thích một cách dễ dàng hơn. Nhà Dell đã tâm lý khi mang những cổng kết nối về phía sau máy, giúp mình không bị vướng víu khi vừa làm việc trên máy vừa phải cắm sạc.
& Bộ vi xử lý Intel Core i5 Tiger Lake đã mang lại hiệu năng tốt, tuy nhiên chiếc máy khi trải nghiệm tựa game Cyberpunk thì đã hơi “đuối” nếu để mức cài đặt cao nhất. Mình khuyến khích các bạn hãy hạ mức đồ hoạ của game xuống thấp để có trải nghiệm tốt hơn nhé. 
& Đến với tựa game CS:GO, máy đã ổn định hơn với mức FPS là 90. Qua trải nghiệm chơi game, các thao tác như di chuột, qua lại đều rất trơn tru, cảm giác chơi game vẫn phấn khích, ấn tượng trong khi mức cài đặt của mình luôn để cao hoặc tối đa.
& Cho phép bạn mở cùng lúc nhiều ứng dụng, hàng loạt tab và chuyển đổi qua lại mà không lo giật lag nhờ sự đa nhiệm đến từ laptop RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời). Tuy nhiên các tác vụ dó chỉ dừng lại ở mức cơ bản, nên để có thể khai thác tốt sức mạnh của CPU và GPU thì mình khuyên các bạn hãy nâng cấp thêm RAM nhé.
& Cùng bạn tạo nên những tác phẩm ấn tượng với chất lượng đồ họa vượt trội, hình ảnh chân thật nhờ card đồ họa rời NVIDIA GeForce RTX 3050 4 GB, cho bạn thỏa sức chỉnh sửa hình ảnh, render video,... chuyên nghiệp trên Photoshop, AI,... đồng thời mang đến trải nghiệm các tựa game một cách trơn tru ở cả mức đồ họa thấp hay cao như PUBG: Battlegrounds, LOL,...', N'lap49_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000050', N'Phá cách với diện mạo mạnh mẽ đến từ laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) mang đến cho người dùng hiệu năng ổn định, hỗ trợ bạn trong mọi tác vụ hằng ngày hay chiến những trận game cực căng một cách mượt mà.', N'Laptop Acer Nitro với tính bền bỉ vượt bậc khi được trang bị lớp vỏ nhựa chắc chắn cùng khối lượng không quá nặng cho một chiếc laptop gaming 2.2 kg và dày 23.9 mm, sẵn sàng cùng bạn đi đến bất kỳ đâu, phục vụ tốt cho cả nhu cầu công việc hay giải trí, cho phép bạn chiến game ở khắp mọi nơi trong cuộc hành trình.
& Bàn phím Fullsize được thiết kế đèn nền chuyển màu RGB của laptop Acer được thiết kế tinh tế nhưng vẫn tôn lên nét mạnh mẽ của một chiếc gaming mạnh mẽ, với các phím có độ nảy tốt, cho bạn thoải mái sử dụng cả trong điều kiện ánh sáng kém mà không lo nhầm lẫn.
& Dọc hai bên laptop được trang bị các cổng giao tiếp thông dụng hỗ trợ tốt cho nhu cầu truyền xuất dữ liệu hay chia sẻ thông tin đến các thiết bị ngoại vi tương thích như 3 cổng USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45) và USB Type-C.
& Laptop AMD Ryzen 5 5600H với 6 nhân 12 luồng mang đến tốc độ cơ bản 3.30 GHz và đạt tối đa lên đến 4.2 GHz nhờ Turbo Boost, cùng bộ nhớ đệm 16 MB mang đến hiệu suất công việc bất ngờ khi hỗ trợ trong mọi công việc văn phòng từ cơ bản đến nâng cao một cách hoàn mỹ với Word, Excel,... hay thậm chí còn xử lý các nhu cầu thiết kế đồ hoạ, thiết kế posters, banners,... ấn tượng.

& Đem đến cho bạn một phiên bản laptop đa nhiệm hơn khi sở hữu RAM 8 GB chuẩn DDR4 2 khe (1 khe 8 GB + 1 khe rời) sở hữu tốc độ Bus RAM 3200 MHz cùng khả năng nâng cấp tối đa đến 32 GB, hỗ trợ bạn tối ưu trong việc mở nhiều ứng dụng cùng lúc và chuyển đổi qua lại một cách trơn tru, mang đến hiệu quả cho công việc tốt hơn.
& Không những hỗ trợ bạn tối đa trong việc chiến những trận game LOL, Total War: Warhammer,... đầy kịch tính một cách mượt mà với hình ảnh chuẩn xác, card đồ họa rời NVIDIA GeForce GTX 1650 4 GB còn cho phép đồ họa hiển thị một cách rõ nét cùng sắc màu chân thật, hỗ trợ bạn làm công việc sáng tạo một cách hiệu quả hơn với các phần mềm thiết kế Lightroom, AI, Photoshop,...
& Ổ cứng SSD 512 GB NVMe PCle, cùng khả năng tháo ra và lắp thanh khác tối đa 1 TB, vừa cung cấp không gian lưu trữ rộng lớn cho mọi loại dữ liệu yêu thích, vừa hỗ trợ mở máy hay vận hành các ứng dụng một cách nhanh chóng chỉ trong vài giây.

& Tối ưu hơn khi thiết bị này còn được trang bị thêm khe cắm HDD SATA nâng cấp tối đa 2 TB và khe cắm SSD M.2 PCIe mở rộng nâng cấp tối đa 1 TB, đáp ứng tốt hơn cho mọi nhu cầu từ bạn, cho bạn thỏa thích tải mọi ứng dụng hay hàng loạt tựa game thịnh hành.', N'lap50_6.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000051', N'Laptop Aspire 7 Gaming A715 42G R4XX R5 (NH.QAYSV.008) sở hữu hiệu năng khoẻ cùng thiết kế mạnh mẽ, là bạn đồng hành lý tưởng trong mọi cuộc hành trình.', N'Laptop AMD Ryzen 5 5500U cùng card rời NVIDIA GeForce GTX 1650 4 GB, mang đến khả năng thiết kế 2D, render video ngắn,... ổn định trên các phần mềm Adobe hay giải trí với các tựa game kịch tính trên thị trường hiện nay một cách mượt mà.

• Chiếc laptop Acer Aspire còn sở hữu RAM 8 GB và SSD 256 GB đáp ứng tốt nhu cầu đa nhiệm, hỗ trợ bạn thao tác mọi việc nhanh chóng và hiệu quả hơn.

• Phiên bản laptop này với khối lượng 2.1 kg và dày 22.9 mm, được chế tác từ chất liệu nhựa bền bỉ, dễ dàng để bạn mang đi khắp mọi nơi.

• Bản lề mở 180 độ giúp chia sẻ thông tin nhanh chóng, tiện lợi. Cùng đèn nền đơn sắc được trang bị hỗ trợ bạn gõ phím chuẩn xác trong bóng tối.

• Laptop Acer này có 2 cổng USB 3.2, HDMI, LAN (RJ45), USB 2.0 và USB Type-C cho phép bạn truyền tải dữ liệu nhanh chóng.

• Công nghệ Acer ComfyView, chống chói Anti Glare và tấm nền IPS được trang bị trên màn hình 15.6 inch, mang đến những trải nghiệm rõ nét, góc nhìn mở rộng, hạn chế hiện tượng chói loá, bóng gương, bảo vệ thị giác của bạn.

• Chiếc laptop gaming này cho bạn cảm nhận chân thật âm nhạc sống động, ít bị biến dạng nhờ công nghệ âm thanh Acer TrueHarmony.', N'lap51_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000052', N'Laptop Acer Aspire 3 A315 58 52KT i5 (NX.AM0SV.006) có cấu hình khỏe, thiết kế cao cấp, màn hình lớn đủ để phục vụ các nhu cầu làm việc văn phòng và giải trí cơ bản của mọi người dùng.', N'Laptop Acer Aspire được hoàn thiện bởi lớp vỏ nhựa cứng cáp, chắc chắn cùng khối lượng 1.7 kg giúp bạn có thể di chuyển và đem máy đi bất cứ nơi đâu mà không sợ quá cồng kềnh.

• Laptop Acer có màn hình 15.6 inch Full HD trên tấm nền TFT giúp hình ảnh, nội dung hiển thị sắc nét, màu sắc chính xác, độ tương phản rõ ràng. Tần số quét 60 Hz vừa đủ để bạn trải nghiệm những chuyển động hình ảnh mượt mà khi chơi game phổ thông hay xem phim thư giãn.

• Được trang bị bộ vi xử lý Intel Core i5 1135G7 cùng card đồ họa tích hợp Intel Iris Xe Graphics nên máy có thể thoải mái chạy được các ứng dụng từ văn phòng cơ bản hay các phần mềm thiết kế đơn giản và các tựa game phổ thông hiện nay.

• Là chiếc laptop học tập, văn phòng tối ưu cho người dùng với RAM 8 GB chuẩn DDR4 (hỗ trợ nâng cấp tối đa đến 12 GB) giúp thao tác đa nhiệm mượt mà hơn. Bên cạnh đó, tốc độ khởi động máy cũng như các ứng dụng cũng nhanh chóng chỉ trong vài giây nhờ ổ cứng SSD 512 GB PCIe NVMe.

• Sở hữu đa dạng các cổng kết nối như HDMI, USB, jack tai nghe 3.5 mm và LAN (RJ45) giúp laptop dễ dàng kết nối với các thiết bị khác. Máy cũng được trang bị chuẩn Wi-Fi 802.11 a/b/g/n/ac kết nối mạng nhanh và trải nghiệm mượt mà.', N'lap52_6.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000053', N'Laptop Acer Aspire A315 56 32TP i3 1005G1 (NX.HS5SV.00K) là sản phẩm laptop laptop mỏng nhẹ, có cấu hình ổn định phù hợp với các nhu cầu sử dụng Office hay lướt web, xem phim giải trí,... của các bạn học sinh, sinh viên.', N'Được bao bọc bởi lớp vỏ nhựa bền chắc và gam màu đen hiện đại, laptop Acer Aspire có khối lượng 1.7 kg dễ dàng cất gọn vào balo mang theo. ​

• Laptop Acer trang bị màn hình 15.6 inch và công nghệ Acer ComfyView, LED Backlit, TFT cung cấp màu sắc trong trẻo với độ tương phản cao, kiểm soát tốt chất lượng hiển thị, giảm thiểu hiện tượng bị chói sáng, bảo vệ mắt trước các ánh sáng xanh độc hại.

• Bản lề mở 180 độ độc đáo giúp bạn dễ dàng tuỳ chỉnh, chia sẻ màn hình với mọi người trong các buổi họp nhóm.

• Đáp ứng tốt các tác vụ cơ bản trên Word, Excel,... nhu cầu giải trí, lướt web nhẹ nhàng nhờ CPU Intel Core i3 Ice Lake 1005G1 cùng card tích hợp Intel UHD Graphics.

• RAM 4 GB cho khả năng đa nhiệm ổn định. Bộ nhớ trong SSD 256 GB rút ngắn thời gian phản hồi tác vụ, tăng tốc độ khởi động máy, ứng dụng.

• Các cổng kết nối 2 x USB 2.0, HDMI, LAN (RJ45), USB 3.1 giúp bạn dễ dàng kết nối với các thiết bị ngoại vi khác.

• Loa laptop sở hữu công nghệ Stereo speakers tái tạo âm thanh tốt, mang đến trải nghiệm âm thanh như đang ở trong một nhà hát giao hưởng sang trọng cho người dùng.', N'lap53_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000054', N'Thanh lịch hơn cùng màu vàng đồng của chiếc laptop HP Envy 13 ba1535TU i7 1165G7 (4U6M4PA) với hệ điều hành Windows 11 được lập trình sẵn, phát huy tối đa năng lượng, sẵn sàng cùng bạn hoàn thành mọi tác vụ khó nhằn.', N'Sở hữu 4 nhân 8 luồng, bộ vi xử lý Intel Core i7 Tiger Lake 1165G7 mang đến tốc độ cơ bản 2.80 GHz và đạt tối đa lên đến 4.7 GHz nhờ Turbo Boost đáp ứng bạn tối ưu hơn trong mọi thao tác công việc, từ các tác vụ văn phòng cơ bản với Word, Excel,... đến việc sáng tạo chuyên nghiệp đều có thể được xử lý nhanh gọn và hiệu quả.

& Card đồ họa tích hợp Intel Iris Xe Graphics cung cấp cho bạn hình ảnh rõ nét, chân thật, cho phép bạn thỏa sức sáng tạo với các ứng dụng Photoshop, AI,... biến những ý tưởng thành sự thật hay tận hưởng những tựa game thịnh hành nhẹ nhàng một cách mượt mà, trơn tru.

& Đa nhiệm hơn cùng laptop RAM 8 GB chuẩn DDR4 (On board) sở hữu tốc độ Bus RAM 2666 MHz, hỗ trợ người dùng mở nhiều ứng dụng hay nhiều tab cùng lúc và chuyển đổi qua lại mà không lo xảy ra tình trạng giật, lag, cho bạn thoải mái vừa nghe nhạc vừa soạn thảo văn bản, nâng cao năng suất làm việc.
& Mang đến không gian lưu trữ rộng lớn có thể chứa hàng loạt các loại dữ liệu cùng khả năng mở máy và vận hành các ứng dụng nhanh chóng chỉ trong vài giây, ổ cứng SSD 512 GB NVMe PCle hỗ trợ tối ưu hơn cho người dùng cả trong công việc và giải trí, nâng cao hiệu quả của người dùng.
& Đặc biệt hơn khi phiên bản này được tích hợp sẵn hệ điều hành Windows 11 Home SL tân tiến, mang đến cho người dùng sự mới mẻ trong giao diện cùng các tính năng tiện ích như Windows Clipboard, Windows Store,... đáp ứng mọi nhu cầu của bạn được tốt hơn.', N'lap54_6.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000055', N'Laptop Lenovo Ideapad 1 11IGL05 N5030 (81VT006FVN) là chiếc laptop mỏng nhẹ và một mức giá lý tưởng mà phụ huynh có thể mua cho học sinh, con em. Đáp ứng tốt các tác vụ học tập trên các phần mềm Office, học trực tuyến hay giải trí cơ bản.', N'Laptop Lenovo Ideapad mang trong mình CPU Intel Pentium N5030 cùng card màn hình tích hợp Intel UHD Graphics 605. Cá nhân mình thấy chiếc máy phục vụ tốt các nhu cầu nhẹ nhàng như lướt web, xem Youtube, đọc báo, học online, Office,... Hiệu năng chiếc máy được tinh chỉnh phù hợp với đối tượng là học sinh với giá thành hợp lý, chi phí tiết kiệm.
& Theo sự trải nghiệm của mình, laptop RAM 4 GB thật sự không đủ để xử lý đa tác vụ và không có khả năng nâng cấp RAM, tuy nhiên với mức giá này điều đó có thể chấp nhận được. Để hạn chế được điều đó, mình khuyên các bạn chỉ nên mở 2 - 3 tab cùng lúc như: vừa soạn thảo văn bản, vừa nghe nhạc giải trí và tắt khi không sử dụng nữa, ngoài ra tắt các phần mềm chạy nền cũng là biện pháp hiệu quả để giải phóng dung lượng RAM. 
& SSD 256 GB cho tốc độ đọc, ghi dữ liệu, khởi động máy và ứng dụng nhanh chóng. Với những trang bị đó, quá trình làm việc trên các ứng dụng học tập cơ bản sẽ hạn chế được hiện tượng lag hay đứng máy.
& Với laptop màn hình 11.6 inch có độ phân giải HD (1366 x 768), màu sắc sẽ bị thay đổi khi góc nhìn thay đổi vì chiếc máy chỉ trang bị tấm nền TN. Tuy nhiên mình nghĩ đây là sản phẩm có chất lượng hiển thị tốt nếu bạn nhìn trực diện. Công nghệ chống chói Anti Glare giúp hạn chế tình trạng bóng gương xuất hiện.', N'lap55_5.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000056', N'Laptop Lenovo Yoga Duet 7 13ITL6 i7 (82MA003UVN) là sự kết hợp hoàn hảo giữa một chiếc máy tính Windows và Tablet từ đó mang đến một siêu phẩm có thiết kế cơ động, nhỏ gọn cùng hiệu năng mạnh mẽ, phù hợp cho mọi tác vụ giải trí, sáng tạo nội dung với bút cảm ứng Digital Pen tặng kèm.', N'Laptop Lenovo Yoga cho phép người dùng có thể tháo rời bàn phím và màn hình để sử dụng laptop như một chiếc máy tính bảng. Chiếc máy được hoàn thiện bằng chất liệu vỏ kim loại sang trọng - cao cấp cùng mức khối lượng khi chưa kèm bàn phím chỉ 0.799 kg, tổng khối lượng màn hình và bàn phím là 1.168 kg và độ mỏng 9.19 mm, giúp mình dễ dàng mang theo đi làm hay cầm trên tay mà không bị mỏi sau thời gian dài sử dụng.
& Tổng thể chiếc máy có viền màn hình mỏng ở 2 bên, mặt lưng có màu bạc nhám giúp bám tay hơn. Phần mặt sau bàn phím được bao bọc bởi lớp vải màu xám mang đến sự đồng nhất cho tổng thể chiếc máy, tạo nên sự đẹp mắt, đồng thời là một chiếc bao da bảo vệ máy tốt hơn.
& Chiếc máy đi kèm bút cảm ứng Digital Pen tiện lợi nên laptop Lenovo gần như có thể thay thế chiếc sổ tay truyền thống của mình cho việc học hằng ngày. Digital Pen sử dụng viên pin để thay thế lúc hết năng lượng.

& Bút cảm ứng được hoàn thiện từ kim loại tạo nên sự đồng bộ cho tổng thể thiết kế, tăng thêm phần cuốn hút, sang trọng cho người dùng khi cầm trên tay. Tuy nhiên, trên máy không có chỗ để cắm bút vào nên các bạn cần lưu ý khi sử dụng để tránh bị thất lạc.
& Trải qua bài đánh giá màn hình bằng phần mềm Spyder 5 Pro, kết quả cho ra khá ấn tượng với độ bao phủ màu ấn tượng là 100% sRGB, 76% Adobe RGB, 76% DCI-P3. Cùng với đó là độ sáng 450 nits giúp mình làm việc ngoài trời tốt hơn, màu sắc nịnh mắt, chuẩn xác.

& Từ những số liệu đo được càng củng cố cho ý kiến của mình khi chiếc máy là sự lựa chọn hợp lý dành cho các bạn sáng tạo nội dung, thiết kế, chỉnh sửa ảnh.', N'lap56_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000057', N'Mang phong cách thiết kế thanh lịch quen thuộc của dòng laptop học tập - văn phòng, laptop Lenovo IdeaPad 5 Pro 16IHU6 i5 11300H (82L9004XVN) nay còn được trang bị màn hình lên đến 16 inch hỗ trợ bạn thao tác xử lý công việc trên một màn hình tiện lợi hơn bao giờ hết. ', N'Laptop Lenovo Ideapad được hoàn thiện tinh tế từ lớp vỏ kim loại bền bỉ, có khối lượng 1.9 kg cho cảm giác vô cùng chắc chắn khi cầm nắm, di chuyển. 

• Màn hình có kích thước 16 inch cho không gian hiển thị vô cùng rộng rãi, độ phân giải WQXGA (2560 x 1600) cùng tần số quét 120 Hz mang lại trải nghiệm hình ảnh khi lướt web, cuộn trang vô cùng sắc nét, mượt mà.  

• Độ phủ màu chuẩn xác 100% sRGB cùng độ sáng 350 nits cho chất lượng hiển thị rực rỡ, sống động, độ tương phản cao. Công nghệ chống chói Anti Glare và chống ánh sáng xanh Low Blue Light bảo vệ tối ưu cho thị giác người dùng.

• Sở hữu con chip mạnh mẽ Intel Core i5 11300H và card rời MX 450 2 GB, laptop có khả năng xử lý nhanh chóng mọi tác vụ trên Office hay thiết kế 2D, chỉnh sửa hình ảnh trên Photoshop, Canva,...

• RAM 16 GB cho khả năng đa nhiệm siêu trơn tru. Ổ cứng SSD 512 GB rút ngắn thời gian phản hồi tác vụ, cung cấp không gian lưu trữ đủ dùng.

• Đăng nhập không cần nhập mật khẩu nhờ camera IR cho phép mở khóa bằng khuôn mặt nhanh chóng. Laptop Lenovo còn nâng cao độ an toàn cho dữ liệu cá nhân hơn với chip TPM 2.0 tiên tiến.

• Đa dạng các cổng kết nối hiện đại như USB 3.2, USB 3.2 (Always on), HDMI, Thunderbolt 4 USB-C, USB Type-C và khe thẻ SD hỗ trợ truyền, xuất dữ liệu dễ dàng. Đèn nền bàn phím tiện lợi cũng được tích hợp.

• Công nghệ âm vòm Dolby Atmos cho chất âm sống động từ mọi hướng và Stereo speakers giúp bạn cảm giác được không gian, vị trí của từng âm thanh, đắm chìm trong những giai điệu chân thật, sống động.', N'lap57.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000058', N'Laptop LG gram 2022 i7 1260P (17Z90Q-G.AX78A5) sẽ là một siêu phẩm laptop cao cấp - sang trọng đáng để bạn sở hữu bởi ngoại hình mỏng nhẹ, thời thượng cùng hiệu năng vượt bậc từ con chip Intel Gen 12, hứa hẹn mang đến những trải nghiệm làm việc và giải trí trọn vẹn nhất cho người dùng là sinh viên, nhân viên hay doanh nhân.', N'Sự xuất hiện của con chip Intel Core i7 1260P cùng card đồ họa Intel Iris Xe Graphics đã mang đến cho chiếc laptop LG này hiệu năng xử lý vượt trội không chỉ những tác vụ học tập, văn phòng cơ bản mà còn đáp ứng tốt những công việc liên quan đến chỉnh ảnh, thiết kế trên Canva, Lightroom, Photoshop,...  

• Laptop RAM 16 GB cho phép người dùng làm việc cùng lúc trên nhiều cửa sổ ứng dụng khác nhau nhưng vẫn đảm bảo chuyển động mượt mà, hạn chế giật lag. Ổ cứng SSD 1 TB cùng khe cắm SSD M.2 PCIe mở rộng mang đến không gian lưu trữ thoải mái, bên cạnh đó gia tăng tốc độ mở máy và truy cập các ứng dụng nhanh hơn chỉ trong vài giây.

• Chinh phục mọi ánh nhìn của những người xung quanh nhờ lớp vỏ kim loại sang trọng, thời thượng, cùng với đó là khối lượng 1.435 kg cho độ linh hoạt cao giúp bạn dễ dàng mang máy theo bên mình mà không lo cồng kềnh, nặng nhọc.   

• Camera IR hồng ngoại kết hợp với tính năng mở khóa khuôn mặt cho phép người dùng mở máy nhanh hơn so với các kiểu nhập mật khẩu thông thường, hạn chế tối đa việc bị mất dữ liệu cá nhân.  

• Gia tăng độ bền bỉ, hạn chế trầy xước máy do các va đập không mong muốn hằng ngày nhờ độ bền chuẩn quân đội MIL STD 810G. Laptop có đèn bàn phím giúp bạn làm việc trong môi trường thiếu sáng tốt hơn.   

• Các cổng kết nối như USB 3.2, Jack tai nghe, USB Type C, khe Micro SD và HDMI được trang bị trên laptop vừa mang đến sự tối giản, đẹp mắt cho máy vừa hỗ trợ truyền tải và kết xuất dữ liệu được nhanh chóng hơn. 

• Kích thước màn hình 17 inch cùng tấm nền IPS giúp bạn quan sát bao quát toàn bộ nội dung được hiển thị trên máy mà không lo bỏ lỡ chi tiết nào. Độ phân giải WQXGA (2560 x 1600) cho các gam màu sắc được tươi tắn, rõ nét hơn.

• Làm việc hay học tập tốt hơn dù ở môi trường có cường độ ánh sáng cao nhờ độ sáng 350 nits, độ phủ màu 99% DCI-P3 tái tạo không gian màu sống động, có chiều sâu, giúp bạn hòa mình vào những thước phim bom tấn kịch tính. 

• Công nghệ âm thanh High Definition (HD) kết hợp với DTS X:Ultra mang đến chất lượng âm thanh to rõ, độ khuếch đại lớn, các thanh âm trầm bổng được hiển thị rõ ràng, chân thực, cho những phút giây giải trí trọn vẹn nhất.', N'lap58_1.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000041', N'Vẻ ngoài đơn giản, màu sắc sang trọng', N'Cáp sạc Apple này sở hữu thiết kế khá gọn nhẹ, đầu cáp và lõi dây được chế tác từ vật liệu chất lượng, đảm bảo độ an toàn khi sử dụng. Phần vỏ bọc được phủ màu trắng trang nhã, chất liệu bền bỉ, mềm mại, sử dụng lâu dài.', N'mt_use_c_1m_white.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000042', N'Sạc pin nhanh chóng, truyền dữ liệu tiện lợi', N'Cáp sạc USB-C 1m MM093 sở hữu đầu nối USB-C ở cả hai đầu, lý tưởng để sạc, đồng bộ hóa và truyền dữ liệu giữa các thiết bị USB-C. Ghép nối cáp sạc USB-C với Adapter USB-C tương thích để sạc thiết bị của bạn một cách thuận tiện và tận dụng khả năng sạc nhanh.', N'cap-sac-usb-c-1m-mm093.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000043', N'Thiết kế mỏng nhẹ, vừa tay', N'Với khối lượng chỉ khoảng 80 g, bề mặt nhẵn mịn, chuột Apple này cho bạn cảm giác cầm cực kỳ nhẹ nhàng và êm ái. Phần đáy chuột được thiết kế tối ưu, cho phép di chuột dễ dàng trên mặt phẳng.

Khi lấy chuột ra, nó sẽ tự động ghép nối qua Bluetooth với chiếc iMac hoặc MacBook đã được kết nối trước đó.', N'mt-chuot-bluetooth-apple-mmmq3.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000044', N'Nội dung', N'Magic Keyboard nay có Touch ID, giúp xác thực nhanh chóng, dễ dàng và bảo mật mỗi lần đăng nhập và mua hàng. Magic Keyboard với Touch ID và Numeric Keypad đem lại trải nghiệm gõ phím thoải mái và chính xác ấn tượng. Bàn phím đặc biệt có cách bố trí mở rộng, với các nút điều khiển điều hướng tài liệu để kéo nhanh và các phím mũi tên kích thước chuẩn, cực kỳ phù hợp để chơi game. Numeric Keypad cũng rất hữu dụng khi thực hiện các bảng tính và sử dụng những ứng dụng tài chính. Bàn phím còn có thể kết nối không dây và sạc lại được, với thời lượng pin dài và bàn phím hoạt động trong một tháng hoặc lâu hơn sau mỗi lần sạc.1 Bàn phím tự động kết nối với Mac, để bạn có thể làm việc ngay lập tức. Ngoài ra, bàn phím còn có cáp chuyển đổi từ USB-C sang Lightning để bạn kết nối với cổng USB-C trên MacBook để sạc.', N'banphim-mk2c3.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000045', N'Nâng tầm trải nghiệm với chất lượng âm thanh sống động, chân thực', N'Tai nghe chống ồn WH-XB910N nâng cao chất lượng các âm ở tần số thấp để mang đến âm trầm vượt trội. Đường dẫn âm trầm riêng trên vỏ tai nghe cùng độ kín khí tốt hơn giữa bộ củ loa và màng nhĩ giúp tạo nên nhịp điệu chính xác và mạnh mẽ để mọi bản nhạc đều hay hơn.

Tai nghe không dây này còn giữ được độ rõ của giọng hát để mang lại cho bạn trải nghiệm nghe trọn vẹn, đong đầy cảm xúc. ', N'chup-tai-bluetooth-sony-wh.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000046', N'Nội dung', N'• Túi chống sốc được thiết kế tối giản, ôm trọn thiết bị cần bảo vệ.

• Có thể sử dụng túi cho laptop, máy tính bảng có kích thước 14 inch.

• Chất liệu bền bỉ, lớp lót với độ dày vừa phải giúp người dùng vừa không bị cấn khi mang đi vừa có độ đàn hồi tốt.

• Siêu nhẹ, siêu bền, túi chống sốc này chắc chắn có thể đồng hành cùng thiết bị của bạn một khoảng thời gian khá dài.', N'tui_chong_soc.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000047', N'Thiết kế chuột Apple nhỏ gọn, kích thước vừa vặn lòng bàn tay, dễ dàng sử dụng.', N'Phần đế chuột được thiết kế tối ưu giúp di chuyển dễ dàng trên mặt bàn. Bề mặt Multi-Touch cho phép bạn thực hiện các thao tác đơn giản như vuốt giữa các trang web và cuộn qua lại giữa các tài liệu. 
& Thời lượng pin dài ấn tượng giúp Magic Mouse hoạt động trong khoảng thời gian một tháng. Magic Mouse có thể kết nối không dây và sạc lại được khi sử dụng hết pin.

& Bạn có thể sử dụng ngay khi vừa khui khỏi hộp và chuột sẽ tự động kết nối với Mac. Magic Mouse có cáp bện chuyển đổi từ USB-C sang Lightning để bạn kết nối với cổng USB-C trên Mac để sạc.
& Tóm lại, Magic Mouse sẽ là món phụ kiện tuyệt vời với thiết kế gọn nhẹ, hoàn toàn tương thích với các dòng Mac đến từ Apple.', N'PK47_5.jpg')
GO
SET IDENTITY_INSERT [dbo].[Detail] ON 

INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (20, N'LAP000000', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'2424 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)|Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng|512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Acer ComfyView|LED Backlit|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'Acer TrueHarmony, DTS X:Ultra Audio', N'3 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|USB Type-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg', N'Vỏ nhựa', N'4-cell Li-ion, 57 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (21, N'LAP000001', N'Intel Core i5 Tiger Lake - 1135G7', N'4', N'8', N'2.40 GHz', N'Turbo Boost 4.2 GHz', N' 8 MB', N' 8 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)', N'13.3 inch', N'Full HD (1920 x 1080) OLED', N'60 Hz', N'100% DCI-P3|400 nits|OLED', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI', N'Bluetooth 5.0, Wi-Fi 6 (802.11ax)', N'Camera IR, HD webcam', N'Mở khóa khuôn mặt, Độ bền chuẩn quân đội MLT STD 810G', N'  Có', N'Dài 304.2 mm - Rộng 203 mm - Dày 13.9 mm - Nặng 1.14 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (22, N'LAP000002', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N' 8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB), 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)', N'15.6 inch', N' Full HD (1920 x 1080)', N'144 Hz', N'250 nits|Adaptive-Sync|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS Audio', N'3 x USB 3.2| HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'Có', N'', N' Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (23, N'LAP000003', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N' 3200 MHz', N'32 GB', N'SSD 512 GB NVMe PCIe, Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N' 17.3 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|250 nits', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'DTS Audio', N'Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C|3 x USB 3.2 |HDMI|LAN (RJ45)', N' Bluetooth 5.2, Wi-Fi 6 (802.11ax)', N'HD webcam', N' Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (24, N'LAP000004', N'AMD Ryzen 9 - 5900HS', N'6', N'16', N'3.00 GHz', N'Turbo Boost 4.6 GHz', N'16 MB', N'16 GB', N'DDR4 2 khe (8GB onboard+ 1 khe 8GB)', N'3200 MHz', N'24 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe 3.0 mở rộng (nâng cấp dung lượng không giới hạn), 1 TB SSD M.2 PCIe 3.0 (Có thể tháo ra, lắp thanh khác dung lượng không giới hạn)', N'14 inch', N'QHD (2560 x 1440)', N'120 Hz', N'100% DCI-P3|Chống chói Anti Glare|Công nghệ IPS|Độ sáng 300 nits', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'Công nghệ Smart AMP, Dolby Atmos', N'1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC|2 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|USB Type-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'Bảo mật vân tay', N'Có', N'Dài 324 mm - Rộng 220 mm - Dày 19.9 mm - Nặng 1.7 kg', N' Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N' 2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (25, N'LAP000005', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSD M.2 PCIe', N'13.3 inch', N'4K/UHD (3840 x 2160), OLED', N'', N'100% DCI-P3|400 nits|OLED|Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR', N'Mở khóa khuôn mặt|Tiêu chuẩn Nền Intel Evo|Độ bền chuẩn quân đội MLT STD 810G', N'Có', N'Dài 305 mm - Rộng 211 mm - Dày 13.9 mm - Nặng 1.2 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL + Office Home & Student 2019 vĩnh viễn', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (26, N'LAP000006', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSD M.2 PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'100% sRGB|400 nits|Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI|Jack tai nghe 3.5 mm', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Mở khóa khuôn mặt|ScreenPad Plus 12.65 inch (1920 x 515 IPS Panel)|Độ bền chuẩn quân đội MLT STD 810H', N'Có', N'Dài 324 mm - Rộng 222 mm - Dày 17.3 mm - Nặng 1.62 kg', N'Vỏ kim loại', N'4-cell Li-ion, 70 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (27, N'LAP000007', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)1 TB SSD M.2 PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'100% sRGB|400 nits|Chống chói Anti Glare|LED Backlit|Màn hình Wide View', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI|Jack tai nghe 3.5 mm|Micro HDMI', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Bản lề mở 180 độ|Bảo mật vân tay|Mở khóa khuôn mặt|Numberpad|TPM 2.0|Độ bền chuẩn quân đội MLT STD 810H', N'Có', N'Dài 320 mm - Rộng 203 mm - Dày 14.9 mm - Nặng 1.01 kg', N'Hợp kim Lithium-Magie', N'không công bố', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (28, N'LAP000008', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'13.3 inch', N'Full HD (1920 x 1080) OLED', N'60 Hz', N'100% DCI-P3|400 nits|OLED', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon,SonicMaster audio', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Mở khóa khuôn mặt|Numberpad|Độ bền chuẩn quân đội MLT STD 810G', N'Có', N'Dài 305 mm - Rộng 211 mm - Dày 11.9 mm - Nặng 1.3 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (30, N'LAP000010', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N'16 GB', N'DDR4 2 khe (8GB onboard+ 1 khe 8GB)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng,SSD 512 GB NVMe PCIe', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Adaptive-Sync|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX 3060, 6 GB', N'DTS Audio', N'3 x USB 3.2|HDMI 2.0|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.1,Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'', N'Có', N'Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (31, N'LAP000011', N'Intel Core i5 Tiger Lake - 1135G7', N'4', N'8', N'2.40 GHz', N'Turbo Boost 4.2 GHz', N'8 MB', N'8 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'100% sRGB|400 nits|Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI |Jack tai nghe 3.5 mm', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Mở khóa khuôn mặt|ScreenPad Plus 12.65 inch (1920 x 515 IPS Panel)|Độ bền chuẩn quân đội MLT STD 810H', N'Có', N'Dài 324 mm - Rộng 222 mm - Dày 17.3 mm - Nặng 1.62 kg', N'Vỏ kim loại', N'4-cell Li-ion, 70 Wh', N'Windows 10 Home SL', N'Windows 10 Home SL')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (33, N'LAP000013', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB) Màn hình', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Adaptive-Sync|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX 3060, 6 GB', N'DTS Audio', N'3 x USB 3.2|HDMI 2.0|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.1,Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'', N'Có', N'Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (34, N'LAP000014', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Tấm nền IPS|Chống chói Anti Glare|LED Backlit|100% sRGB|400 nits', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'2 x Thunderbolt 4 USB-C|1 x USB 3.2|HDMI', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'HD webcam,Camera IR', N'Độ bền chuẩn quân đội MLT STD 810G,Mở khóa khuôn mặt', N'Có', N'Dài 319 mm - Rộng 208 mm - Dày 13.9 mm - Nặng 1.17 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL', N'2020')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (35, N'LAP000015', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'32 GB', N'SSD 512 GB NVMe PCIe,Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|Adaptive-Sync|250 nits', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'Stereo speakers,DTS X:Ultra Audio', N'Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C|3 x USB 3.2|HDMI|LAN (RJ45)', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'', N'Có', N'Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (38, N'LAP000018', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB),Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)', N'17.3 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'250 nits|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS Audio', N'3 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (39, N'LAP000019', N'AMD Ryzen 7 - 5800HS', N'8', N'16', N'3.00 GHz', N'Turbo Boost 4.3 GHz', N'16 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'24 GB', N'SSD 512 GB NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|100% sRGB|Độ sáng 300 nits', N'Card rời - NVIDIA GeForce GTX 1650 4 GB', N'Dolby Atmos', N'Jack tai nghe 3.5 mm|1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC|2 x USB 3.2|HDMI|USB Type-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'Bảo mật vân tay', N'Có', N'Dài 324 mm - Rộng 220 mm - Dày 17.9 mm - Nặng 1.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (40, N'LAP000020', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB),SSD 512 GB NVMe PCIe', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS X:Ultra Audio', N'3 x USB 3.0|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|USB Type-C', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (41, N'LAP000021', N'Intel Core i5 Tiger Lake - 11400H', N'6', N'12', N'2.70 GHz', N'Turbo Boost 4.5 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'SSD 512 GB NVMe PCIe,Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'17.3 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|250 nits', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS Audio', N'Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C|3 x USB 3.0|HDMI|LAN (RJ45)', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (42, N'LAP000022', N'Intel Core i5 Tiger Lake - 11400H', N'6', N'12', N'2.70 GHz', N'Turbo Boost 4.5 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB), SSD 512 GB NVMe PCIe', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS X:Ultra Audio', N'3 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|USB Type-C', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (43, N'LAP000023', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'8 GB', N'LPDDR4X (On board)', N'2933 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'13.3 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'400 nits|Tấm nền IPS|Wled-backlit', N'Card tích hợp - Intel Iris Xe Graphics', N'Bang & Olufsen audio', N'2 x USB 3.1|Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Bảo mật vân tay|Công tắc khóa camera|Tiêu chuẩn Nền Intel Evo', N'Có', N'Dài 306.5 mm - Rộng 194.6 mm - Dày 16.9 mm - Nặng 1.236 kg', N'Vỏ kim loại nguyên khối', N'3-cell Li-ion', N'Windows 10 Home SL + Office Home & Student 2019 vĩnh viễn', N'2020')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (54, N'LAP000031', N'Apple M1 Pro', N'8', N'Hãng không công bố', N'200GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'16 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 512 GB', N'14.2 inch', N'Liquid Retina XDR display (3024 x 1964)', N'up to 120Hz', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 14 core-GPU', N'Wide stereo sound Hệ thống âm thanh 6 loa Dolby Atmos', N'3 x Thunderbolt 4 USB-C Jack tai nghe 3.5 mm HDMI', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 312.6 mm - Rộng 221.2 mm - Dày 15.5 mm - Nặng 1.6 kg', N'Vỏ kim loại nguyên khối', N'Khoảng 10 tiếng', N'Mac OS', N'10/2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (55, N'LAP000032', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 256 GB', N'13.6 inch', N'2560 x 1664', N'Hãng không công bố', N'Wide color (P3) Độ sáng 500 nits Công nghệ True Tone 1 billion colors', N'Card tích hợp - 8 nhân GPU', N'Spatial Audio 3 microphones 4 Loa Dolby Atmos', N'2 x Thunderbolt 3 Jack tai nghe 3.5 mm MagSafe 3', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (56, N'LAP000033', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 256 GB', N'13.3 inch', N'Retina (2560 x 1600)', N'Hãng không công bố', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 10 nhân GPU', N'Wide stereo sound 3 microphones Loa kép (2 kênh) Dolby Atmos', N'2 x Thunderbolt 3 Jack tai nghe 3.5 mm', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'720p FaceTime Camera', N'Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (58, N'LAP000035', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 512 GB', N'13.3 inch', N'Retina (2560 x 1600)', N'Hãng không công bố', N'Wide color (P3) Độ sáng 500 nits Công nghệ True Tone 1 billion colors', N'Card tích hợp - 14 core-GPU', N'Wide stereo sound 3 microphones Loa kép (2 kênh) Dolby Atmos', N'3 x Thunderbolt 4 USB-C Jack tai nghe 3.5 mm HDMI', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (60, N'LAP000036', N'Intel Core i5 Tiger Lake - 11400H', N'6', N'12', N'2.70 GHz', N'Turbo Boost 4.5 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 4 GB + 1 khe 4 GB)', N'3200 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB)', N'16.1 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Wled-backlit,  Tấm nền IPS , Chống chói ,Anti Glare , 250 nits', N'Card rời - NVIDIA GeForce RTX 3050Ti, 4 GB', N'Audio by B&ORealtek High Definition Audio', N'HDMI  Jack tai nghe 3.5 mm  LAN (RJ45)  3 x USB 3.1  USB Type-C', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'HD webcam', N'Khe đọc thẻ nhớ SD', N'Có', N'Dài 370 mm - Rộng 260 mm - Dày 23.5 mm - Nặng 2.46 kg', N'Vỏ nhựa', N'4-cell Li-ion, 70 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (61, N'LAP000037', N'Intel Core i3 Tiger Lake - 1115G4', N'2', N'4', N'3.00 GHz', N'Turbo Boost 4.1 GHz', N'6 MB', N'4 GB', N'DDR4 2 khe (1 khe 4 GB + 1 khe rời)', N'3200 MHz', N'16 GB', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti Glare250 nits', N'Card tích hợp - Intel UHD Graphics', N'Stereo speakers', N'HDMI  Jack tai nghe 3.5 mm  1x SuperSpeed USB Type-C  2x SuperSpeed USB A', N'Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac', N'HD webcam', N'Khe đọc thẻ nhớ SD', N'Không có đèn', N'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.7 kg', N'Vỏ nhựa', N'3-cell Li-ion, 41 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (62, N'LAP000038', N'Intel Core i3 Tiger Lake - 1115G4', N'2', N'4', N'3.00 GHz', N'Turbo Boost 4.1 GHz', N'6 MB', N'4 GB', N'DDR4 2 khe (1 khe 4 GB + 1 khe rời)', N'3200 MHz', N'16 GB', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti Glare250 nits', N'Card tích hợp - Intel UHD Graphics', N'Stereo speakers', N'HDMI  Jack tai nghe 3.5 mm  1x SuperSpeed USB Type-C  2x SuperSpeed USB A', N'Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac', N'HD webcam', N'Khe đọc thẻ nhớ SD', N'Không có đèn', N'Dài 358.5 mm - Rộng 242 mm - Dày 17.9 mm - Nặng 1.7 kg', N'Vỏ nhựa', N'3-cell Li-ion, 41 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (63, N'LAP000039', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'8 GB', N'DDR4 (Onboard)', N'3200 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Tấm nền IPS  100% sRGB  300 nits Glossy', N'Card tích hợp - Intel Iris Xe Graphics', N'Stereo speakersDolby Atmos', N'HDMI  Jack tai nghe 3.5 mm  2 x Thunderbolt 4 USB-C  1 x USB 3.2  1 x USB 3.2 (Always on)', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'HD webcamCamera IR', N'TPM 2.0  Tiêu chuẩn Nền Intel Evo  Bản lề mở 180 độ  Bảo mật vân tay  Mở khóa khuôn mặt', N'Có', N'Dài 320.6 mm - Rộng 208.18 mm - Dày 14.9 mm - Nặng 1.36 kg', N'Vỏ kim loại', N'4-cell, 60.7 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (64, N'LAP000040', N'AMD Ryzen 5 - 5600H', N'6', N'12', N'3.30 GHz', N'Turbo Boost 4.2 GHz', N'16 MB', N'16 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)', N'3200 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230))  Không hỗ trợ khe cắm HDD  Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'15.6 inch', N'Full HD (1920 x 1080)', N'120 Hz', N'Chống chói Anti Glare  LED Backlit  250 nits  WVA', N'Card rời - NVIDIA GeForce RTX 3050, 4 GB', N'Nahimic Audio', N'2 x USB 2.0  Jack tai nghe 3.5 mm  1 x USB 3.2  HDMI  LAN (RJ45)  USB Type-C', N'Bluetooth 5.2Wi-Fi 6 (802.11ax)', N'HD webcam', N'', N'Có', N'Dài 357.26 mm - Rộng 272.11 mm - Dày 26.9 mm - Nặng 2.8 kg', N'Vỏ nhựa', N'3-cell Li-ion, 56 Wh', N'Windows 11 Home SL + Office Home & Student vĩnh viễn', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (74, N'LAP000047', N'Intel Core i3 Tiger Lake - 1115G4', N'2', N'4', N'3.00 GHz', N'Turbo Boost 4.1 GHz', N'6 MB', N'4 GB', N'DDR4 2 khe (1 khe 4 GB + 1 khe rời)', N'2666 MHz', N'16 GB', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230))Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti Glare  LED Backlight  WVA', N'Card tích hợp - Intel UHD Graphics', N'Realtek ALC3204', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2  USB 2.0', N'BluetoothWi-Fi 802.11 a/b/g/n/ac', N'HD webcam', N'Khe đọc thẻ nhớ SD', N'Không có đèn', N'Dài 358.5 mm - Rộng 235.5 mm - Dày 18.9 mm - Nặng 1.7 kg', N'Vỏ nhựa', N'3-cell Li-ion, 41 Wh', N'Windows 11 Home SL + Office Home & Student vĩnh viễn', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (79, N'LAP000048', N'Intel Core i5 Tiger Lake - 1135G7', N'4', N'8', N'2.40 GHz', N'Turbo Boost 4.2 GHz', N'8 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe rời)', N'3200 MHz', N'16 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 1 TB (2230))Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti Glare  LED Backlight  WVA', N'Card rời - NVIDIA GeForce MX350, 2 GB', N'Realtek High Definition Audio', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2  LAN (RJ45)  USB 2.0', N'Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac', N'HD webcam', N'Bảo mật vân tay', N'Không có đèn', N'Dài 358.5 mm - Rộng 235.5 mm - Dày 18.9 mm - Nặng 1.69 kg', N'Vỏ nhựa', N'3-cell Li-ion, 41 Wh', N'Windows 11 Home SL + Office Home & Student vĩnh viễn', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (80, N'LAP000049', N'Intel Core i5 Tiger Lake - 11400H', N'6', N'12', N'2.70 GHz', N'Turbo Boost 4.5 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (2280) / 512 GB (2230))', N'15.6 inch', N'Full HD (1920 x 1080)', N'120 Hz', N'Chống chói Anti Glare  LED Backlit  250 nits  WVA', N'Card rời - NVIDIA GeForce RTX 3050, 4 GB', N'Nahimic Audio', N'HDMI  Jack tai nghe 3.5 mm  3 x USB 3.2  LAN (RJ45)  USB Type-C', N'Bluetooth 5.2Wi-Fi 6 (802.11ax)', N'HD webcam', N'', N'Có', N'Dài 357 mm - Rộng 272 mm - Dày 25 mm - Nặng 2.81 kg', N'Vỏ nhựa', N'3-cell Li-ion, 56 Wh', N'Windows 11 Home SL + Office Home & Student vĩnh viễn', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (81, N'LAP000050', N'AMD Ryzen 5 - 5600H', N'6', N'12', N'3.30 GHz', N'Turbo Boost 4.2 GHz', N'16 MB', N'8 GB', N'DDR4 2 khe (1 khe 4 GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)  Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)  Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'TFT  Tấm nền IPS  LED Backlit  Acer ComfyView', N'Card rời - NVIDIA GeForce GTX 1650 4 GB', N'Acer TrueHarmonyDTS X:Ultra Audio', N'USB Type-C  Jack tai nghe 3.5 mm  3 x USB 3.2  HDMI  LAN (RJ45)', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg', N'Vỏ nhựa', N'4-cell Li-ion, 57 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (82, N'LAP000051', N'AMD Ryzen 5 - 5500U', N'6', N'12', N'2.10 GHz', N'Turbo Boost 4.0 GHz', N'8 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Không hỗ trợ khe cắm SSD M2 mở rộng thêm  Không hỗ trợ khe cắm HDD  256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti Glare  Công nghệ IPS  Acer ComfyView', N'Card rời - NVIDIA GeForce GTX 1650 4 GB', N'Acer TrueHarmony', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2  LAN (RJ45)  USB 2.0  USB Type-C', N'Wi-Fi 6 (802.11ax)Bluetooth 5.1', N'HD webcam', N'Bản lề mở 180 độ', N'Có', N'Dài 363.4 mm - Rộng 254.5 mm - Dày 22.9 mm - Nặng 2.1 kg', N'Vỏ nhựa', N'Li-ion, 48 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (84, N'LAP000052', N'Intel Core i5 Tiger Lake - 1135G7', N'4', N'8', N'2.40 GHz', N'Turbo Boost 4.2 GHz', N'8 MB', N'8 GB', N'DDR4 (Onboard 4 GB + 1 khe 4 GB)', N'Từ 2400 MHz (Hãng công bố)', N'12 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'TFT  LED Backlit  Acer ComfyView', N'Card tích hợp - Intel Iris Xe Graphics', N'Stereo speakers', N'HDMI  1 x USB 2.0  Jack tai nghe 3.5 mm  2 x USB 3.2  LAN (RJ45)', N'Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac', N'HD webcam', N'', N'Không có đèn', N'Dài 363.4 mm - Rộng 238.4 mm - Dày 19.9 mm - Nặng 1.7 kg', N'Vỏ nhựa', N'2-cell Li-ion, 36.7 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (85, N'LAP000053', N'Intel Core i3 Comet Lake - 1005G1', N'2', N'4', N'1.20 GHz', N'Turbo Boost 3.4 GHz', N'4 MB', N'4 GB', N'DDR4 (Onboard 4 GB +1 khe rời)', N'2400 MHz', N'12 GB', N'256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 512 GB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'TFT  LED Backlit  Acer ComfyView', N'Card tích hợp - Intel UHD Graphics', N'Stereo speakers', N'USB 3.1  Jack tai nghe 3.5 mm  HDMI  LAN (RJ45)  2 x USB 2.0', N'Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac', N'VGA Webcam', N'Bản lề mở 180 độ', N'Không có đèn', N'Dài 363.4 mm - Rộng 247.5 mm - Dày 19.9 mm - Nặng 1.7 kg', N'Vỏ nhựa', N'2-cell Li-ion, 36.7 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (86, N'LAP000054', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'8 GB', N'DDR4 (Onboard)', N'Từ 2666 MHz (Hãng công bố)', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB (Gen 3) / 1 TB (Gen 4))', N'13.3 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Wled-backlit  Tấm nền IPS  100% sRGB  400 nits', N'Card tích hợp - Intel Iris Xe Graphics', N'Bang & Olufsen audio', N'2x SuperSpeed USB A  Jack tai nghe 3.5 mm  Thunderbolt 4 USB-C', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'HD webcam', N'Nút bật/tắt camera  Tiêu chuẩn Nền Intel Evo  Bảo mật vân tay', N'Có', N'Dài 306.5 mm - Rộng 194.6 mm - Dày 16.9 mm - Nặng 1.3 kg', N'Vỏ kim loại nguyên khối', N'3-cell Li-ion, 51 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (87, N'LAP000055', N'Intel Pentium - N5030', N'4', N'4', N'1.10 GHz', N'Turbo Boost 3.1 GHz', N'4 MB', N'4 GB', N'DDR4 (1 khe)', N'2400 MHz', N'Không hỗ trợ nâng cấp', N'Không hỗ trợ nâng cấp, không hỗ trợ thêm khe cắm mở rộng nào khác256 GB SSD NVMe PCIe', N'11.6 inch', N'HD (1366 x 768)', N'60 Hz', N'Tấm nền TN  Chống chói Anti Glare  250 nits', N'Card tích hợp - Intel UHD Graphics 605', N'Dolby Audio', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2', N'Wi-Fi 802.11 a/b/g/n/acBluetooth 4.2', N'0.3 MP', N'TPM 2.0', N'Không có đèn', N'Dài 288 mm - Rộng 200 mm - Dày 17.9 mm - Nặng 1.2 kg', N'Vỏ nhựa', N'32 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (88, N'LAP000056', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'DDR4 2 khe (8 GB onboard + 8 GB onboard)', N'3200 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSD', N'13 inch', N'WQHD (2160x1350)', N'60 Hz', N'Gorilla 3  Công nghệ IPS , Cảm ứng 450 nits Glossy,', N'Card tích hợp - Intel Iris Xe Graphics', N'Công nghệ Smart AMPDolby Audio', N'2 x USB Type-C  Thunderbolt 4  Jack tai nghe 3.5 mm', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'Sau 5 MP, trước 5 MPCamera IR', N'TPM 2.0Mở khóa khuôn mặt', N'Có', N'Dài 297.4 mm - Rộng 207.4 mm - Dày 9.19 mm - Nặng 1.168 kg', N'Vỏ kim loại', N'41 Wh', N'Windows 10 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (89, N'LAP000057', N'Intel Core i5 Tiger Lake - 11300H', N'4', N'8', N'3.10 GHz', N'Turbo Boost 4.4 GHz', N'8 MB', N'16 GB', N'DDR4 (Onboard)', N'3200 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB (2280) / 512 GB (2242))', N'16 inch', N'WQXGA (2560 x 1600)', N'120 Hz', N'350 nits  Low Blue Light  Chống chói Anti Glare  100% sRGB', N'Card rời - NVIDIA GeForce MX450, 2 GB', N'Stereo speakersDolby Atmos', N'HDMI  Jack tai nghe 3.5 mm  Thunderbolt 4 USB-C  1 x USB 3.2  USB Type-C  1 x USB 3.2 (Always on)', N'Wi-Fi 6 (802.11ax)Bluetooth 5.1', N'HD webcamCamera IR', N'TPM 2.0Mở khóa khuôn mặt', N'Có', N'Dài 356 mm - Rộng 251 mm - Dày 18.4 mm - Nặng 1.9 kg', N'Vỏ kim loại', N'75 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (90, N'LAP000058', N'Intel Core i7 Alder Lake - 1260P', N'12', N'16', N'2.10 GHz', N'Turbo Boost 4.7 GHz', N'18 MB', N'16 GB', N'LPDDR5 (8 GB Onboard + 8 GB Onboard)', N'5200 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSDHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'17 inch', N'WQXGA (2560 x 1600)', N'60 Hz', N'350 nits  99% DCI-P3  Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'High Definition (HD) AudioDTS X:Ultra Audio', N'2 x USB Type-C  Jack tai nghe 3.5 mm  2 x USB 3.2  HDMI', N'Wi-Fi 6E (802.11ax)Bluetooth 5.1', N'Full HD WebcamCamera IR', N'Độ bền chuẩn quân đội MIL STD 810GMở khóa khuôn mặt', N'Có', N'Dài 378.8 mm - Rộng 258.8 mm - Dày 17.7 mm - Nặng 1.435 kg', N'Vỏ kim loại', N'80 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (141, N'LAP000034', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 256 GB', N'13.3 inch', N'Retina (2560 x 1600)', N'Hãng không công bố', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 10 nhân GPU', N'Wide stereo sound 3 microphones Loa kép (2 kênh) Dolby Atmos', N'2 x Thunderbolt 3 Jack tai nghe 3.5 mm', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'720p FaceTime Camera', N'Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
SET IDENTITY_INSERT [dbo].[Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailsOrders] ON 

INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1013, 1011, N'LAP000000', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 21850000, 1, 21850000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1014, 1012, N'LAP000000', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 21850000, 1, 21850000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1015, 1013, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1016, 1014, N'LAP000032', NULL, 34639500, 1, 34639500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1017, 1014, N'LAP000033', NULL, 37789500, 1, 37789500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1018, 1014, N'LAP000023', NULL, 30915000, 1, 30915000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1019, 1015, N'LAP000001', NULL, 24700000, 1, 24700000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1020, 1015, N'LAP000039', NULL, 24709700, 1, 24709700, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1021, 1016, N'LAP000032', NULL, 34639500, 2, 69279000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1022, 1016, N'LAP000054', NULL, 27529800, 1, 27529800, 1003)
SET IDENTITY_INSERT [dbo].[DetailsOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([empID], [empName], [empDate], [empPhoto], [empAddress], [empSalary], [empBonus], [empStartTime], [empEmail], [empPhone], [empPassword], [empRole]) VALUES (1, N'Nam', CAST(N'2001-12-16' AS Date), N'admin.jpg                                                                                           ', N'Kinh Xuôi Thanh Mỹ Châu Thành Trà Vinh', 22000000, 200000, CAST(N'2022-10-20' AS Date), N'nguyennhutnam112@gmail.com                                                                          ', N'0339906489', N'123                                                                                                 ', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeesRole] ON 

INSERT [dbo].[EmployeesRole] ([empRole], [empRoleName]) VALUES (1, N'Nhân viên')
INSERT [dbo].[EmployeesRole] ([empRole], [empRoleName]) VALUES (2, N'Quản lí')
SET IDENTITY_INSERT [dbo].[EmployeesRole] OFF
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000.jpg', 1, CAST(N'2021-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_1.jpg', 0, CAST(N'2021-11-13T20:49:10.107' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_10.jpg', 0, CAST(N'2021-11-13T20:58:46.297' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_11.jpg', 0, CAST(N'2021-11-13T20:58:51.983' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_2.jpg', 0, CAST(N'2021-11-13T20:58:00.867' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_3.jpg', 0, CAST(N'2021-11-13T20:58:08.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_4.jpg', 0, CAST(N'2021-11-13T20:58:13.153' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_5.jpg', 0, CAST(N'2021-11-13T20:58:16.717' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_6.jpg', 0, CAST(N'2021-11-13T20:58:20.647' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_7.jpg', 0, CAST(N'2021-11-13T20:58:27.797' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_8.jpg', 0, CAST(N'2021-11-13T20:58:35.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_9.jpg', 0, CAST(N'2021-11-13T20:58:41.623' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'mac_pro_m1_2021_1.jpg', 0, CAST(N'2022-11-18T14:29:49.837' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001.jpg', 1, CAST(N'2021-11-13T20:59:06.253' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_1.jpg', 0, CAST(N'2021-11-13T20:59:15.313' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_10.jpg', 0, CAST(N'2021-11-13T21:00:09.497' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_11.jpg', 0, CAST(N'2021-11-13T21:00:16.013' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_12.jpg', 0, CAST(N'2021-11-13T21:00:20.160' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_13.jpg', 0, CAST(N'2021-11-13T21:00:26.427' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_2.jpg', 0, CAST(N'2021-11-13T20:59:20.253' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_3.jpg', 0, CAST(N'2021-11-13T20:59:28.563' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_4.jpg', 0, CAST(N'2021-11-13T20:59:34.007' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_5.jpg', 0, CAST(N'2021-11-13T20:59:38.603' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_6.jpg', 0, CAST(N'2021-11-13T20:59:43.863' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_7.jpg', 0, CAST(N'2021-11-13T20:59:49.667' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_8.jpg', 0, CAST(N'2021-11-13T20:59:56.957' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_9.jpg', 0, CAST(N'2021-11-13T21:00:04.087' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002.jpg', 1, CAST(N'2021-11-13T21:01:12.020' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_1.jpg', 0, CAST(N'2021-11-13T21:01:30.730' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_10.jpg', 0, CAST(N'2021-11-13T21:02:36.860' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_11.jpg', 0, CAST(N'2021-11-13T21:02:42.323' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_2.jpg', 0, CAST(N'2021-11-13T21:01:37.610' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_3.jpg', 0, CAST(N'2021-11-13T21:01:43.367' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_4.jpg', 0, CAST(N'2021-11-13T21:01:50.287' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_5.jpg', 0, CAST(N'2021-11-13T21:02:02.933' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_6.jpg', 0, CAST(N'2021-11-13T21:02:08.860' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_7.jpg', 0, CAST(N'2021-11-13T21:02:15.150' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_8.jpg', 0, CAST(N'2021-11-13T21:02:23.097' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_9.jpg', 0, CAST(N'2021-11-13T21:02:31.870' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003.jpg', 1, CAST(N'2021-11-13T21:07:32.740' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_1.jpg', 0, CAST(N'2021-11-13T21:08:28.217' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_10.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_11.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_12.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_2.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_3.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_4.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_5.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_6.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_7.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_8.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_9.jpg', 0, CAST(N'2021-11-13T21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004.jpg', 1, CAST(N'2021-11-13T21:09:47.750' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_1.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_10.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_11.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_12.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_13.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_14.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_15.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_16.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_17.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_2.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_3.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_4.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_5.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_6.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_7.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_8.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_9.jpg', 0, CAST(N'2021-11-13T21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_1.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_10.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_11.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_12.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_13.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_14.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_15.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_16.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_2.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_3.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_4.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_5.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_6.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_7.jpg', 0, CAST(N'2021-11-13T21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_8.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_9.jpg', 0, CAST(N'2021-11-13T21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021 - Copy.png', 0, CAST(N'2022-11-18T14:33:36.387' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021.png', 1, CAST(N'2022-11-18T14:29:32.337' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_1.jpg', 0, CAST(N'2022-11-18T14:33:49.720' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_2.jpg', 0, CAST(N'2022-11-18T14:34:08.343' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_3.jpg', 0, CAST(N'2022-11-18T14:34:24.370' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_4.jpg', 0, CAST(N'2022-11-18T14:34:38.077' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xam-2-650x650_2.jpg', 0, CAST(N'2022-11-18T15:19:43.723' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xam-4-650x650_3.jpg', 0, CAST(N'2022-11-18T15:19:55.443' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xám-650x650 - Copy.png', 0, CAST(N'2022-11-18T15:16:07.290' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xám-650x650.png', 1, CAST(N'2022-11-18T15:15:33.153' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xam-9-650x650_4.jpg', 0, CAST(N'2022-11-18T15:20:06.907' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg', 0, CAST(N'2022-11-18T15:35:10.577' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-2-1-650x650_3.jpg', 0, CAST(N'2022-11-18T15:35:19.413' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-3-1-650x650_4.jpg', 0, CAST(N'2022-11-18T15:35:29.147' AS DateTime))
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-4-1-650x650_5.jpg', 0, CAST(N'2022-11-18T15:35:41.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-pro-m2-2022-bac-650x650.png', 1, CAST(N'2022-11-18T15:35:00.703' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000034', N'macbook-pro-13-spgry-m1-thumb-650x650.png', 1, CAST(N'2022-11-18T15:44:49.093' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000034', N'macbook-pro-13-spgry-m1-thumb-650x650ht.png', 0, CAST(N'2022-12-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg', 0, CAST(N'2022-11-18T17:02:13.373' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-2-1-650x650_3.jpg', 0, CAST(N'2022-11-18T17:02:24.003' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-3-1-650x650_4.jpg', 0, CAST(N'2022-11-18T17:02:32.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-4-1-650x650_5.jpg', 0, CAST(N'2022-11-18T17:02:41.737' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png', 1, CAST(N'2022-11-18T17:01:53.610' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_3.jpg', 0, CAST(N'2022-11-24T18:20:26.507' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_4.jpg', 0, CAST(N'2022-11-24T18:20:36.670' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_5.jpg', 0, CAST(N'2022-11-24T18:20:47.173' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'Laptop HP Gaming Victus 16-D0292TX 5Z9R3PA_2.jpg', 0, CAST(N'2022-11-24T18:17:12.657' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'LaptopHPGamingVictus16-D0292TX5Z9R3PA.jpg', 1, CAST(N'2022-11-24T17:37:17.373' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'LaptopHPGamingVictus16-D0292TX5Z9R3PA_copy.jpg', 0, CAST(N'2022-11-24T17:40:11.187' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_2.jpg', 0, CAST(N'2022-11-24T18:22:19.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_3.jpg', 0, CAST(N'2022-11-24T18:22:29.993' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_4.jpg', 0, CAST(N'2022-11-24T18:22:40.150' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_5.jpg', 0, CAST(N'2022-11-24T18:22:50.797' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'LaptopHP240G8 i31005G14GB512BWin11(617K6PA) - Copy.jpg', 0, CAST(N'2022-11-24T18:00:59.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'LaptopHP240G8 i31005G14GB512BWin11(617K6PA).jpg', 1, CAST(N'2022-11-24T18:00:21.450' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_2.jpg', 0, CAST(N'2022-11-24T18:23:56.430' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_3.jpg', 0, CAST(N'2022-11-24T18:24:06.363' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_4.jpg', 0, CAST(N'2022-11-24T18:24:16.847' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_5.jpg', 0, CAST(N'2022-11-24T18:24:26.257' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'Laptop HP 15s fq2662TU i3 1115G44GB256GBWin11 (6K795PA) - Copy.jpg', 0, CAST(N'2022-11-24T18:15:08.990' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'Laptop HP 15s fq2662TU i3 1115G44GB256GBWin11 (6K795PA).jpg', 1, CAST(N'2022-11-24T18:12:47.887' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39 - Copy.jpg', 0, CAST(N'2022-11-24T18:43:22.850' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39.jpg', 1, CAST(N'2022-11-24T18:43:00.633' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39_2.jpg', 0, CAST(N'2022-11-24T18:43:32.807' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39_3.jpg', 0, CAST(N'2022-11-24T18:43:42.433' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39_4.jpg', 0, CAST(N'2022-11-24T18:43:52.190' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39_5.jpg', 0, CAST(N'2022-11-24T18:44:06.260' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000039', N'lap39_6.jpg', 0, CAST(N'2022-11-24T18:44:17.013' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40 - Copy.jpg', 0, CAST(N'2022-11-24T21:52:02.593' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40.jpg', 1, CAST(N'2022-11-24T21:50:26.877' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40_2.jpg', 0, CAST(N'2022-11-24T21:50:58.197' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40_3.jpg', 0, CAST(N'2022-11-24T21:51:07.727' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40_4.jpg', 0, CAST(N'2022-11-24T21:51:19.203' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40_5.jpg', 0, CAST(N'2022-11-24T21:51:28.383' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000040', N'lap40_6.jpg', 0, CAST(N'2022-11-24T21:51:37.550' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47 - Copy.jpg', 0, CAST(N'2022-11-27T18:16:49.040' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47.jpg', 1, CAST(N'2022-11-27T18:15:41.310' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47_1.jpg', 0, CAST(N'2022-11-27T18:17:02.447' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47_2.jpg', 0, CAST(N'2022-11-27T18:17:11.230' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47_3.jpg', 0, CAST(N'2022-11-27T18:17:19.137' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47_4.jpg', 0, CAST(N'2022-11-27T18:17:29.043' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47_5.jpg', 0, CAST(N'2022-11-27T18:17:39.883' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000047', N'lap47_6.jpg', 0, CAST(N'2022-11-27T18:17:48.963' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48 - Copy.jpg', 0, CAST(N'2022-11-27T20:37:26.227' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48.jpg', 1, CAST(N'2022-11-27T20:37:07.850' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48_1.jpg', 0, CAST(N'2022-11-27T20:37:37.877' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48_2.jpg', 0, CAST(N'2022-11-27T20:37:48.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48_3.jpg', 0, CAST(N'2022-11-27T20:37:56.917' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48_4.jpg', 0, CAST(N'2022-11-27T20:38:11.617' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48_5.jpg', 0, CAST(N'2022-11-27T20:38:22.763' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000048', N'lap48_6.jpg', 0, CAST(N'2022-11-27T20:38:31.607' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap48 - Copy.jpg', 0, CAST(N'2022-11-27T20:48:58.803' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49.jpg', 1, CAST(N'2022-11-27T20:48:48.803' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49_1.jpg', 0, CAST(N'2022-11-27T20:49:07.810' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49_2.jpg', 0, CAST(N'2022-11-27T20:49:18.310' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49_3.jpg', 0, CAST(N'2022-11-27T20:49:27.763' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49_4.jpg', 0, CAST(N'2022-11-27T20:49:44.553' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49_5.jpg', 0, CAST(N'2022-11-27T20:49:55.317' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000049', N'lap49_6.jpg', 0, CAST(N'2022-11-27T20:50:18.550' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50 - Copy.jpg', 0, CAST(N'2022-11-27T21:02:17.823' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50.jpg', 1, CAST(N'2022-11-27T21:01:54.980' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50_1.jpg', 0, CAST(N'2022-11-27T21:02:27.880' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50_2.jpg', 0, CAST(N'2022-11-27T21:02:37.103' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50_3.jpg', 0, CAST(N'2022-11-27T21:02:46.717' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50_4.jpg', 0, CAST(N'2022-11-27T21:02:57.387' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000050', N'lap50_5.jpg', 0, CAST(N'2022-11-27T21:03:06.540' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51 - Copy.jpg', 0, CAST(N'2022-11-27T21:25:48.307' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51.jpg', 1, CAST(N'2022-11-27T21:25:24.447' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_1.jpg', 0, CAST(N'2022-11-27T21:25:57.530' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_2.jpg', 0, CAST(N'2022-11-27T21:26:06.807' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_3.jpg', 0, CAST(N'2022-11-27T21:26:15.503' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_4.jpg', 0, CAST(N'2022-11-27T21:26:25.307' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_5.jpg', 0, CAST(N'2022-11-27T21:26:34.590' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_6.jpg', 0, CAST(N'2022-11-27T21:26:43.053' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000051', N'lap51_7.jpg', 0, CAST(N'2022-11-27T21:26:58.773' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52 - Copy.jpg', 0, CAST(N'2022-11-27T22:18:04.000' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52.jpg', 1, CAST(N'2022-11-27T22:17:48.387' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52_1.jpg', 0, CAST(N'2022-11-27T22:18:12.637' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52_2.jpg', 0, CAST(N'2022-11-27T22:18:21.577' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52_3.jpg', 0, CAST(N'2022-11-27T22:18:30.557' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52_4.jpg', 0, CAST(N'2022-11-27T22:18:40.433' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000052', N'lap52_5.jpg', 0, CAST(N'2022-11-27T22:18:49.787' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53 - Copy.jpg', 0, CAST(N'2022-12-05T14:31:21.847' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53.jpg', 1, CAST(N'2022-12-05T14:30:54.530' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_1.jpg', 0, CAST(N'2022-12-05T14:31:33.457' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_2.jpg', 0, CAST(N'2022-12-05T14:31:44.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_3.jpg', 0, CAST(N'2022-12-05T14:31:56.353' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_4.jpg', 0, CAST(N'2022-12-05T14:32:06.380' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_5.jpg', 0, CAST(N'2022-12-05T14:32:15.757' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_6.jpg', 0, CAST(N'2022-12-05T14:32:25.210' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54 - Copy.jpg', 0, CAST(N'2022-12-05T15:05:08.583' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54.jpg', 1, CAST(N'2022-12-05T15:04:58.247' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_1.jpg', 0, CAST(N'2022-12-05T15:05:21.290' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_2.jpg', 0, CAST(N'2022-12-05T15:05:32.493' AS DateTime))
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_3.jpg', 0, CAST(N'2022-12-05T15:05:41.873' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_4.jpg', 0, CAST(N'2022-12-05T15:05:50.997' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_5.jpg', 0, CAST(N'2022-12-05T15:06:00.677' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000055', N'lap55 - Copy.jpg', 0, CAST(N'2022-12-05T15:17:13.330' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000055', N'lap55.jpg', 1, CAST(N'2022-12-05T15:16:56.380' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000055', N'lap55_1.jpg', 0, CAST(N'2022-12-05T15:17:25.267' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000055', N'lap55_2.jpg', 0, CAST(N'2022-12-05T15:17:36.657' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000055', N'lap55_3.jpg', 0, CAST(N'2022-12-05T15:17:45.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000055', N'lap55_4.jpg', 0, CAST(N'2022-12-05T15:17:55.277' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56 - Copy.jpg', 0, CAST(N'2022-12-05T15:25:55.993' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56.jpg', 1, CAST(N'2022-12-05T15:25:40.033' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56_1.jpg', 0, CAST(N'2022-12-05T15:26:10.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56_2.jpg', 0, CAST(N'2022-12-05T15:26:21.613' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56_3.jpg', 0, CAST(N'2022-12-05T15:26:31.160' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56_4.jpg', 0, CAST(N'2022-12-05T15:26:40.930' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56_5.jpg', 0, CAST(N'2022-12-05T15:26:54.493' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000056', N'lap56_6.jpg', 0, CAST(N'2022-12-05T15:27:03.423' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000057', N'lap57 - Copy.jpg', 0, CAST(N'2022-12-05T15:34:01.873' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000057', N'lap57.jpg', 1, CAST(N'2022-12-05T15:33:52.917' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000057', N'lap57_1.jpg', 0, CAST(N'2022-12-05T15:34:12.013' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000057', N'lap57_2.jpg', 0, CAST(N'2022-12-05T15:34:20.193' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000057', N'lap57_3.jpg', 0, CAST(N'2022-12-05T15:34:31.773' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000057', N'lap57_4.jpg', 0, CAST(N'2022-12-05T15:34:40.657' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58 - Copy.jpg', 0, CAST(N'2022-12-08T18:17:54.190' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58.jpg', 1, CAST(N'2022-12-08T18:17:45.030' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58_1.jpg', 0, CAST(N'2022-12-08T18:18:03.470' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58_2.jpg', 0, CAST(N'2022-12-08T18:18:13.740' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58_3.jpg', 0, CAST(N'2022-12-08T18:18:23.487' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58_4.jpg', 0, CAST(N'2022-12-08T18:18:32.120' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000041', N'use_c_1m_white - Copy.png', 0, CAST(N'2022-11-26T14:08:38.700' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000041', N'use_c_1m_white.png', 1, CAST(N'2022-11-26T14:08:07.593' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000041', N'use_c_1m_white_2.jpg', 0, CAST(N'2022-11-26T14:08:52.243' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000041', N'use_c_1m_white_3.jpg', 0, CAST(N'2022-11-26T14:09:07.033' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000042', N'cap-sac-usb-c-1m-mm093.png', 1, CAST(N'2022-11-17T16:31:20.970' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000042', N'cap-sac-usb-c-1m-mm093_2.jpg', 0, CAST(N'2022-11-17T16:31:34.977' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000042', N'cap-sac-usb-c-1m-mm093_3.jpg', 0, CAST(N'2022-11-17T16:31:47.427' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000043', N'chuot-bluetooth-apple-mmmq3.png', 1, CAST(N'2022-11-17T16:37:49.457' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000043', N'chuot-bluetooth-apple-mmmq3_2.jpeg', 0, CAST(N'2022-11-17T16:38:01.800' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000043', N'chuot-bluetooth-apple-mmmq3_3.jpeg', 0, CAST(N'2022-11-17T16:38:13.733' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000043', N'mt-chuot-bluetooth-apple-mmmq3.jpg', 0, CAST(N'2022-11-17T16:38:39.297' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000044', N'banphim-mk2c3.png', 1, CAST(N'2022-11-17T16:53:11.387' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000044', N'banphim-mk2c3_2.png', 0, CAST(N'2022-11-17T16:54:09.053' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000044', N'banphim-mk2c3_3.jpg', 0, CAST(N'2022-11-17T16:53:52.603' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000045', N'chup-tai-bluetooth-sony-wh.jpg', 1, CAST(N'2022-11-17T17:01:13.047' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000045', N'chup-tai-bluetooth-sony-wh-xb910.jpg', 0, CAST(N'2022-11-17T17:01:22.250' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000045', N'chup-tai-bluetooth-sony-wh-xb910n-3.jpg', 0, CAST(N'2022-11-17T17:01:31.847' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000046', N'mac_pro_m1_2021 - Copy.png', 0, CAST(N'2022-11-18T14:31:45.987' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000046', N'tui_chong_soc -2.png', 0, CAST(N'2022-11-17T17:11:01.233' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000046', N'tui_chong_soc.png', 1, CAST(N'2022-11-17T17:13:03.397' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000047', N'PK47 - Copy.png', 0, CAST(N'2022-11-27T22:08:28.793' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000047', N'PK47.png', 1, CAST(N'2022-11-27T22:08:11.630' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000047', N'PK47_1.jpg', 0, CAST(N'2022-11-27T22:08:38.027' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000047', N'PK47_2.jpg', 0, CAST(N'2022-11-27T22:08:47.023' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000047', N'PK47_3.jpg', 0, CAST(N'2022-11-27T22:08:56.223' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000047', N'PK47_4.jpg', 0, CAST(N'2022-11-27T22:09:04.777' AS DateTime))
GO
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (1, N'Đang chờ xác nhận')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (2, N'Đang chuẩn bị hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (3, N'Đang chờ vận chuyển')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (4, N'Đang giao hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (5, N'Giao hàng thành công')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (6, N'Đã hủy')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1011, CAST(N'2022-12-26T14:43:53.000' AS DateTime), N'Đang giao hàng', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1012, CAST(N'2022-12-30T19:18:37.000' AS DateTime), N'Đã hủy', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1013, CAST(N'2022-12-30T19:28:28.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1014, CAST(N'2022-12-31T14:09:40.000' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1015, CAST(N'2022-12-31T14:11:42.233' AS DateTime), N'Đã hủy', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1016, CAST(N'2023-01-05T15:02:46.793' AS DateTime), N'Đã hủy', NULL, 1003)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[parameter] ON 

INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (1, N'Chưa có chi tiết', 1)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (2, N'Sản xuất tại', 1)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (3, N'Thương hiệu', 1)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (4, N'Kích thước', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (5, N'Trọng lượng', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (6, N'Dung lượng pin', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (7, N'Thời gian sử dụng', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (8, N'Tương thích thiết bị', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (9, N'Bluetooth', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (10, N'Cách kết nối', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (11, N'wifi', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (12, N'Chức năng', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (13, N'Đầu vào', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (14, N'Đầu ra', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (15, N'Độ dài dây', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (16, N'Công suất tối đa', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (17, N'Sản xuất tại', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (18, N'Thương hiệu', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (19, N'Công nghệ/Tiện ích', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (20, N'Tương thích', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (21, N'Độ phân giải mặc định', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (22, N'Độ dài dây/Khoảng cách kết nối', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (23, N'Đèn LED', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (24, N'Ứng dụng điều khiển', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (25, N'Loại pin', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (26, N'Thời gian', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (27, N'Cổng sạc', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (28, N'Khối lượng', 4)
SET IDENTITY_INSERT [dbo].[parameter] OFF
GO
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000000', 1, CAST(N'2022-11-17T15:38:40.563' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000001', 1, CAST(N'2022-11-17T16:27:41.517' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000002', 1, CAST(N'2022-11-17T16:37:02.340' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000003', 1, CAST(N'2022-11-17T16:49:19.750' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000004', 1, CAST(N'2022-11-17T16:57:20.007' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000005', 1, CAST(N'2022-11-17T17:08:12.243' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000006', 1, CAST(N'2022-11-18T14:27:50.383' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000007', 1, CAST(N'2022-11-18T15:17:59.717' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000008', 1, CAST(N'2022-11-18T15:33:45.170' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000009', 1, CAST(N'2022-11-18T15:42:27.487' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000010', 1, CAST(N'2022-11-18T16:59:22.873' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11242022PN000011', 1, CAST(N'2022-11-24T17:30:43.413' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11242022PN000012', 1, CAST(N'2022-11-24T17:48:40.647' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11242022PN000013', 1, CAST(N'2022-11-24T18:03:29.897' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11242022PN000014', 1, CAST(N'2022-11-24T18:39:30.307' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11242022PN000015', 1, CAST(N'2022-11-24T21:45:04.593' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11262022PN000016', 1, CAST(N'2022-11-26T12:06:27.347' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11262022PN000017', 1, CAST(N'2022-11-26T14:04:36.787' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000018', 1, CAST(N'2022-11-27T17:49:07.230' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000019', 1, CAST(N'2022-11-27T18:11:14.123' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000020', 1, CAST(N'2022-11-27T20:32:52.213' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000021', 1, CAST(N'2022-11-27T20:46:26.857' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000022', 1, CAST(N'2022-11-27T21:03:19.783' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000023', 1, CAST(N'2022-11-27T21:19:18.137' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000024', 1, CAST(N'2022-11-27T21:36:51.493' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11272022PN000025', 1, CAST(N'2022-11-27T22:12:11.523' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1252022PN000026 ', 1, CAST(N'2022-12-05T14:24:57.277' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1252022PN000027 ', 1, CAST(N'2022-12-05T14:57:53.690' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1252022PN000028 ', 1, CAST(N'2022-12-05T15:10:43.720' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1252022PN000029 ', 1, CAST(N'2022-12-05T15:19:10.200' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1252022PN000030 ', 1, CAST(N'2022-12-05T15:19:29.263' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1252022PN000031 ', 1, CAST(N'2022-12-05T15:28:51.260' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1282022PN000032 ', 1, CAST(N'2022-12-08T18:10:28.443' AS DateTime))
GO
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000000', N'Laptop Apple MacBook Air M1 2020 8GB/256GB/7-core GPU (MGN93SA/A)', 92, 22, CAST(21850000 AS Decimal(32, 0)), 1, N'lap000000.png', 1, 121)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000001', N'Laptop Asus ZenBook UX325EA i5 1135G7/8GB/512GB/OLED/Cáp/Túi/Win10 (KG363T)', 42, 3, CAST(24700000 AS Decimal(32, 0)), 2, N'lap000001.jpg', 1, 30)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000002', N'Laptop Asus TUF Gaming FX516PC i7 11370H/8GB/512GB/4GB RTX3050/144Hz/Win10', 244, 0, CAST(28000000 AS Decimal(32, 0)), 2, N'lap000002.jpg', 1, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000003', N'Laptop Asus TUF Gaming FX706HE i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10', 34, 0, CAST(35000000 AS Decimal(32, 0)), 2, N'lap000003.jpg', 1, 14)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000004', N'Laptop Asus ROG Zephyrus G14 Alan Walker GA401QEC R9 5900HS/16GB 1TB/4GB RTX3050Ti/120Hz/Túi/Win10', 67, 0, CAST(40250000 AS Decimal(32, 0)), 2, N'lap000004.jpg', 1, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000005', N'Laptop Asus ZenBook UX371EA i7 1165G7/16GB/1TB SSD/Touch/Pen/Cáp/Túi/Office H&S2019/Win10', 100, 14, CAST(42000000 AS Decimal(32, 0)), 2, N'lap000005.jpg', 1, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000006', N'Laptop Asus ZenBook UX482EA i7 1165G7/16GB/1TB SSD/Touch/Pen/Túi/Stand/Win10', 24, 1, CAST(34500000 AS Decimal(32, 0)), 2, N'lap000006.jpg', 1, 6)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000007', N'Laptop Asus ExpertBook B9400CEA i7 1165G7/16GB/1TB SSD/Cáp/Túi/Win10', 36, 0, CAST(36450000 AS Decimal(32, 0)), 2, N'lap000007.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000008', N'Laptop Asus ZenBook Flip UX363EA i7 1165G7/16GB/512GB/OLED/Touch/Pen/Cáp/Túi/Win10', 100, 0, CAST(32200000 AS Decimal(32, 0)), 2, N'lap000008.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000009', N'Laptop Asus ZenBook Flip UX363EA i7 1165G7/16GB/512GB/OLED/Touch/Pen/Cáp/Túi/Win10', 54, 0, CAST(32200000 AS Decimal(32, 0)), 2, N'lap000009.jpg', 1, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000010', N'Laptop Asus TUF Gaming FX516PM i7 11370H/16GB/512GB/6GB RTX3060/144Hz/Win10', 78, 0, CAST(33750000 AS Decimal(32, 0)), 2, N'lap000010.jpg', 1, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000011', N'Laptop Asus ZenBook Duo UX482EA i5 1135G7/8GB/512GB/Touch/Pen/Túi/Stand/Win10', 80, 0, CAST(33750000 AS Decimal(32, 0)), 2, N'lap000011.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000013', N'Laptop Asus TUF Gaming FX516PM i7 11370H/8GB/512GB/6GB RTX3060/144Hz/Win10', 112, 0, CAST(32400000 AS Decimal(32, 0)), 2, N'lap000013.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000014', N'Laptop Asus ZenBook UX425EA i7 1165G7/16GB/512GB/Cáp/Túi/Win10', 101, 0, CAST(27144000 AS Decimal(32, 0)), 2, N'lap000014.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000015', N'Laptop Asus TUF Gaming FX516PE i7 11370H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10', 52, 0, CAST(30960000 AS Decimal(32, 0)), 2, N'lap000015.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000018', N'Laptop Asus TUF Gaming FX706HC i7 11800H/8GB/512GB/4GB RTX3050/144Hz/Win10', 73, 0, CAST(24780000 AS Decimal(32, 0)), 2, N'lap000018.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000019', N'Laptop Asus Rog Zephyrus Gaming G14 GA401QH R7 5800HS/8GB/512GB/4GB GTX1650/144Hz/Túi/Win10', 142, 0, CAST(28072000 AS Decimal(32, 0)), 2, N'lap000019.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000020', N'Laptop Asus TUF Gaming FX506HCB i7 11800H/8GB/512GB/4GB RTX3050/144Hz/Win10', 104, 0, CAST(26314000 AS Decimal(32, 0)), 2, N'lap000020.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000021', N'Laptop Asus TUF Gaming FX706HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win10', 50, 0, CAST(25800000 AS Decimal(32, 0)), 2, N'lap000021.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000022', N'Laptop Asus TUF Gaming FX506HCB i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win10', 132, 0, CAST(26666000 AS Decimal(32, 0)), 2, N'lap000022.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000023', N'Laptop HP Envy 13 ba1030TU i7 1165G7/8GB/512GB/Office H&S2019/Win10', 69, 1, CAST(30915000 AS Decimal(32, 0)), 2, N'lap000023.jpg', 1, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000031', N'MacBook Pro 14 inch M1 Pro 2021 14-Core GPU', 95, 5, CAST(55650000 AS Decimal(32, 0)), 1, N'mac_pro_m1_2021.png', 1, 30)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000032', N'MacBook Air M2 2022 8-core GPU', 95, 4, CAST(34639500 AS Decimal(32, 0)), 1, N'macbook-air-m2-2022-8-core-gpu-xám-650x650.png', 1, 15)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000033', N'MacBook Pro 13 inch M2 2022', 99, 1, CAST(37789500 AS Decimal(32, 0)), 1, N'apple-pro-m2-2022-bac-650x650.png', 1, 7)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000034', N'MacBook Pro 13 inch M1 2020', 199, 1, CAST(34650000 AS Decimal(32, 0)), 1, N'macbook-pro-13-spgry-m1-thumb-650x650.png', 1, 20)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000035', N'MacBook Pro 13 inch M2 2022', 200, 0, CAST(43050000 AS Decimal(32, 0)), 1, N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png', 1, 22)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000036', N'Laptop HP Gaming Victus 16-D0292TX 5Z9R3PA', 200, 0, CAST(25189500 AS Decimal(32, 0)), 3, N'LaptopHPGamingVictus16-D0292TX5Z9R3PA.jpg', 1, 12)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000037', N'Laptop HP 15s fq2662TU i3 1115G4/4GB/256GB/Win11 (6K795PA)', 38, 0, CAST(14065800 AS Decimal(32, 0)), 3, N'LaptopHP240G8 i31005G14GB512BWin11(617K6PA).jpg', 1, 16)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000038', N'Laptop HP 240 G8 i3 1005G1/4GB/512GB/Win11 (617K6PA)', 180, 0, CAST(13147800 AS Decimal(32, 0)), 3, N'Laptop HP 15s fq2662TU i3 1115G44GB256GBWin11 (6K795PA).jpg', 1, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000039', N'Laptop Lenovo Yoga Slim 7 14ITL05 i7 1165G7/8GB/512GB/Win10 (82A300DQVN)', 39, 1, CAST(24709700 AS Decimal(32, 0)), 4, N'lap39.jpg', 1, 10)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000040', N'Laptop Dell Gaming G15 5515 R5 5600H/16GB/512GB/4GB RTX3050/120Hz/OfficeHS/Win11 (P105F004DGR)', 239, 3, CAST(23551800 AS Decimal(32, 0)), 6, N'lap40.jpg', 1, 30)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000047', N'Laptop Dell Inspiron 15 3511 i3 1115G4/4GB/256GB/Office H&S/Win11 (P112F001CBL)', 50, 0, CAST(12331800 AS Decimal(32, 0)), 6, N'lap47.jpg', 1, 6)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000048', N'Laptop Dell Vostro 3510 i5 1135G7/8GB/512GB/2GB MX350/OfficeHS/Win11 (P112F002BBL)', 70, 0, CAST(20177700 AS Decimal(32, 0)), 6, N'lap48.jpg', 1, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000049', N'Laptop Dell Gaming G15 5511 i5 11400H/8GB/256GB/4GB RTX3050/120Hz/OfficeHS/Win11 (70266676)', 100, 0, CAST(28039800 AS Decimal(32, 0)), 6, N'lap49.jpg', 1, 22)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000050', N'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QBMSV.006)', 40, 0, CAST(19471800 AS Decimal(32, 0)), 5, N'lap50.jpg', 1, 13)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000051', N'Laptop Acer Aspire 7 Gaming A715 42G R4XX R5 5500U/8GB/256GB/4GB GTX1650/Win11 (NH.QAYSV.008)', 60, 0, CAST(15027700 AS Decimal(32, 0)), 5, N'lap51.jpg', 1, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000052', N'Laptop Acer Aspire 3 A315 58 52KT i5 1135G7/8GB/512GB/Win11 (NX.AM0SV.006)', 20, 0, CAST(14881800 AS Decimal(32, 0)), 5, N'lap52.jpg', 1, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000053', N'Laptop Acer Aspire A315 56 32TP i3 1005G1/4GB/256GB/Win11 (NX.HS5SV.00K)', 20, 0, CAST(10189800 AS Decimal(32, 0)), 5, N'lap53.jpg', 1, 12)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000054', N'Laptop HP Envy 13 ba1535TU i7 1165G7/8GB/512GB/Win11 (4U6M4PA)', 39, 1, CAST(27529800 AS Decimal(32, 0)), 3, N'lap54.jpg', 1, 8)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000055', N'Laptop Lenovo Ideapad 1 11IGL05 N5030/4GB/256GB/Win11 (81VT006FVN)', 30, 0, CAST(6415800 AS Decimal(32, 0)), 4, N'lap55.jpg', 1, 35)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000056', N'Laptop Lenovo Yoga Duet 7 13ITL6 i7 1165G7/16GB/1TB SSD/Touch/Pen/Win10 (82MA003UVN)', 50, 0, CAST(36199800 AS Decimal(32, 0)), 4, N'lap56.jpg', 1, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000057', N'Laptop Lenovo IdeaPad 5 Pro 16IHU6 i5 11300H/16GB/512GB/2GB MX450/120Hz/Win11 (82L9004XVN)', 60, 0, CAST(27529800 AS Decimal(32, 0)), 4, N'lap57.jpg', 1, 9)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000058', N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (17Z90Q-G.AH78A5', 40, 0, CAST(50785800 AS Decimal(32, 0)), 8, N'lap58.jpg', 1, 16)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000041', N'Cáp sạc USB-C 1m', 199, 1, CAST(525000 AS Decimal(32, 0)), 10, N'use_c_1m_white.png', 7, 16)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000042', N'Cáp sạc USB-C MM093 1m', 38, 2, CAST(550000 AS Decimal(32, 0)), 10, N'cap-sac-usb-c-1m-mm093.png', 7, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000043', N'Chuột Bluetooth Apple MMMQ3', 150, 0, CAST(2667000 AS Decimal(32, 0)), 10, N'chuot-bluetooth-apple-mmmq3.png', 5, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000044', N'Magic Keyboard với Touch ID và Numeric Keypad', 200, 0, CAST(3927000 AS Decimal(32, 0)), 10, N'banphim-mk2c3.png', 4, 9)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000045', N'Tai nghe chụp tai Bluetooth Sony WH-XB910N', 200, 0, CAST(4095000 AS Decimal(32, 0)), 10, N'chup-tai-bluetooth-sony-wh.jpg', 3, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000046', N'Túi chống sốc Laptop 14 inch Targus Pulse Sleeve TSS94804EU-50', 200, 0, CAST(309750 AS Decimal(32, 0)), 10, N'tui_chong_soc.png', 7, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000047', N'Magic Mouse', 20, 0, CAST(2220750 AS Decimal(32, 0)), 10, N'PK47.png', 5, 5)
GO
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (1, N'Máy tính')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (2, N'Điện thoại')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (3, N'Tai nghe')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (4, N'Bàn phím')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (5, N'Chuột')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (6, N'Cục sạc')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (7, N'Phụ Kiện máy tính')
GO
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000000', CAST(N'2022-11-18' AS Date), CAST(N'2022-12-18' AS Date), CAST(10000000 AS Decimal(32, 0)), CAST(11850000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000001', CAST(N'2022-11-18' AS Date), CAST(N'2022-12-18' AS Date), CAST(1300000 AS Decimal(32, 0)), CAST(23400000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000002', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(27000000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000003', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(900000 AS Decimal(32, 0)), CAST(34100000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000004', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1500000 AS Decimal(32, 0)), CAST(38750000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000005', CAST(N'2022-11-18' AS Date), CAST(N'2022-12-18' AS Date), CAST(2000000 AS Decimal(32, 0)), CAST(40000000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000006', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1400000 AS Decimal(32, 0)), CAST(33100000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000007', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1300000 AS Decimal(32, 0)), CAST(35150000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000008', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(990000 AS Decimal(32, 0)), CAST(31210000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000009', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1500000 AS Decimal(32, 0)), CAST(30700000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000010', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1600000 AS Decimal(32, 0)), CAST(32150000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000011', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1750000 AS Decimal(32, 0)), CAST(32000000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000013', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1450000 AS Decimal(32, 0)), CAST(30950000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000014', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1300000 AS Decimal(32, 0)), CAST(25844000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000015', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1800000 AS Decimal(32, 0)), CAST(29160000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000018', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(950000 AS Decimal(32, 0)), CAST(23830000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000019', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(750000 AS Decimal(32, 0)), CAST(27322000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000020', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(25114000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000021', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(24600000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000022', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(25466000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000023', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(29715000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000054', CAST(N'2022-12-30' AS Date), CAST(N'2023-04-04' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(26529800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000055', CAST(N'2022-12-30' AS Date), CAST(N'2023-04-02' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(5415800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000056', CAST(N'2022-12-30' AS Date), CAST(N'2023-05-02' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(35199800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000057', CAST(N'2022-12-30' AS Date), CAST(N'2023-03-03' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(26529800 AS Decimal(32, 0)))
GO
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000000', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000001', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000002', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021 ', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000003', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000004', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000005', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000006', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000007', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000008', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000009', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000010', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000011', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000013', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000014', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000015', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000018', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000019', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000020', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000021', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000022', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000023', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
GO
SET IDENTITY_INSERT [dbo].[TitleDetailAccessory] ON 

INSERT [dbo].[TitleDetailAccessory] ([tt_id], [ttName]) VALUES (1, N'Chi tiết cấu hình')
INSERT [dbo].[TitleDetailAccessory] ([tt_id], [ttName]) VALUES (2, N'Thông số vật lý')
INSERT [dbo].[TitleDetailAccessory] ([tt_id], [ttName]) VALUES (3, N'Kết nối và tính năng')
INSERT [dbo].[TitleDetailAccessory] ([tt_id], [ttName]) VALUES (4, N'Tổng quan')
SET IDENTITY_INSERT [dbo].[TitleDetailAccessory] OFF
GO
SET IDENTITY_INSERT [dbo].[Trademark] ON 

INSERT [dbo].[Trademark] ([id], [name]) VALUES (1, N'MacBook')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (2, N'Asus')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (3, N'HP')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (4, N'Lenovo')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (5, N'Acer')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (6, N'DELL')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (7, N'MSI')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (8, N'LG')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (9, N'GIGABYTE')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (10, N'KHÁC')
SET IDENTITY_INSERT [dbo].[Trademark] OFF
GO
ALTER TABLE [dbo].[Banner] ADD  DEFAULT (getdate()) FOR [dateUpdate]
GO
ALTER TABLE [dbo].[Image] ADD  CONSTRAINT [DF__Image__dateUpdat__7E02B4CC]  DEFAULT (getdate()) FOR [dateUpdate]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [DF__PhieuNhap__date___3D2915A8]  DEFAULT (getdate()) FOR [date_]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__quanli__671F4F74]  DEFAULT ((0)) FOR [quanlity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__purcha__681373AD]  DEFAULT ((0)) FOR [purchase]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__price__690797E6]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[accessory]  WITH CHECK ADD  CONSTRAINT [fk_ac] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[accessory] CHECK CONSTRAINT [fk_ac]
GO
ALTER TABLE [dbo].[accessory]  WITH CHECK ADD  CONSTRAINT [fk_ac2] FOREIGN KEY([para_id])
REFERENCES [dbo].[parameter] ([paraID])
GO
ALTER TABLE [dbo].[accessory] CHECK CONSTRAINT [fk_ac2]
GO
ALTER TABLE [dbo].[CancelOrder]  WITH CHECK ADD  CONSTRAINT [fk_Co_Or] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[CancelOrder] CHECK CONSTRAINT [fk_Co_Or]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_ca] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_ca]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_CartproID] FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_CartproID]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PN] FOREIGN KEY([PhieuNhap_id])
REFERENCES [dbo].[PhieuNhap] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_CTPN_PN]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_CTPN_Products]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_ComPr] FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_ComPr]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [fk_add] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [fk_add]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [fk_cusType] FOREIGN KEY([cusType])
REFERENCES [dbo].[Customertype] ([CusType])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [fk_cusType]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_Description_Prod] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Description_Prod]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Products]
GO
ALTER TABLE [dbo].[DetailsOrders]  WITH CHECK ADD  CONSTRAINT [fk_DeOrderCus] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[DetailsOrders] CHECK CONSTRAINT [fk_DeOrderCus]
GO
ALTER TABLE [dbo].[DetailsOrders]  WITH CHECK ADD  CONSTRAINT [fk_DeOrderorderID] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[DetailsOrders] CHECK CONSTRAINT [fk_DeOrderorderID]
GO
ALTER TABLE [dbo].[DetailsOrders]  WITH CHECK ADD  CONSTRAINT [fk_DeOrderProID] FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetailsOrders] CHECK CONSTRAINT [fk_DeOrderProID]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [fk_EmRole] FOREIGN KEY([empRole])
REFERENCES [dbo].[EmployeesRole] ([empRole])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [fk_EmRole]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_OrderCus] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_OrderCus]
GO
ALTER TABLE [dbo].[parameter]  WITH CHECK ADD  CONSTRAINT [fk_para1] FOREIGN KEY([tt_id])
REFERENCES [dbo].[TitleDetailAccessory] ([tt_id])
GO
ALTER TABLE [dbo].[parameter] CHECK CONSTRAINT [fk_para1]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PN_Empl] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([empID])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PN_Empl]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_trademark] FOREIGN KEY([trademark_id])
REFERENCES [dbo].[Trademark] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_trademark]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductType] FOREIGN KEY([productType_id])
REFERENCES [dbo].[ProductType] ([productType_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductType]
GO
ALTER TABLE [dbo].[promotions]  WITH CHECK ADD  CONSTRAINT [FK_promotions_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[promotions] CHECK CONSTRAINT [FK_promotions_Products]
GO
ALTER TABLE [dbo].[PromotionsGift]  WITH CHECK ADD  CONSTRAINT [FK_PromotionsGift_Prod] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PromotionsGift] CHECK CONSTRAINT [FK_PromotionsGift_Prod]
GO
/****** Object:  StoredProcedure [dbo].[auto_idAccessory]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[auto_idAccessory]
@id char(16) out
AS
BEGIN
	IF (SELECT COUNT(id) FROM Products) = 0
		SET @id = '0'
	ELSE
		SELECT @id = MAX(RIGHT(id, 5)) FROM Products where productType_id != 1
		SELECT @id = CASE
			WHEN @id = 99999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'PK00001'
			WHEN @id >= 0 and @id < 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'PK0000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'PK000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 99 THEN CONVERT(VARCHAR,GETDATE(),112) + 'PK00' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'PK0' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'PK' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[auto_idProducts]    Script Date: 1/5/2023 6:30:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[auto_idProducts]
@id char(16) out
AS
BEGIN
	IF (SELECT COUNT(id) FROM Products) = 0
		SET @id = '0'
	ELSE
		SELECT @id = MAX(RIGHT(id, 5)) FROM Products where productType_id=1
		SELECT @id = CASE
			WHEN @id = 99999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00001'
			WHEN @id >= 0 and @id < 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 99 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
		END
END


GO
/****** Object:  StoredProcedure [dbo].[LayMa]    Script Date: 12/8/2022 9:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayMa]
@ma varchar(50) out
AS
BEGIN
	Select @ma = id
	From Products
	
END

GO
CREATE TRIGGER tg_AutoUpdateCarttt on Cart
for insert
as
	Begin 
		Update Cart
		set tt = 1
	END
	
--Tự động cập nhật avatar sản phẩm khi thêm hình ảnh
GO
CREATE TRIGGER tg_AutoUpdAvaPro on Image
for insert,update
as
	if(select active from inserted) = 'true'
	Begin 
		Update Products
		set avatar = (select image_ from inserted)
		where id = (select product_id from inserted)
	END

GO
CREATE TRIGGER tg_AutoInsertDetailsComputer on Products
for insert
as
	declare @id char(9)
	set @id = (select id from inserted Where productType_id = 1 )

	Insert into Detail(product_id,CPU,SoNhan,SoLuong,Speed,MaxSpeed,Cache,RAM,RAM_type,BusRAM,MaxRAM,OCung,ManHinh,DoPhanGiai,TanSoQuet,CongNgheManHinh,
	VGA,AmThanh,CongGiaoTiep,KetNoiKhongDay,Webcam,TinhNangKhac,DenBanPhim,SizeAndWeight,ChatLieu,Pin,HeDieuHanh,RaMat)
	values(@id,'','','','','','','','','',N'','','',N'','',N'','',N'','',N'',N'',N'',N'',N'',N'','','','')
GO
CREATE TRIGGER tg_AutoUpdPricePromotion on promotions
for insert,update
as
	Declare @id char(9)
	set @id = (select product_id from inserted)
	update promotions
	set price_after = (select price From Products where id=@id) - (select price from inserted)
	where product_id = @id and date_start = (select date_start from inserted)
GO
CREATE TRIGGER tg_AutoUpdPrice on ChiTietPhieuNhap
for insert
as
	update Products
	set price = (select price_Import + (price_Import*ratio/100) from inserted)
	where id = (Select product_id from inserted)
GO
CREATE TRIGGER tg_AutoUpdQuanlity on ChiTietPhieuNhap
for insert
as
	Update Products
	set quanlity = quanlity + (select quanlity from inserted)
	where id = (select product_id from inserted)
GO
GO
CREATE FUNCTION [dbo].[auto_idProducts2]()
RETURNS VARCHAR(16)
AS
BEGIN
	DECLARE @id VARCHAR(16)
	IF (SELECT COUNT(id) FROM Products) = 0
		SET @id = '0'
	ELSE
		SELECT @id = MAX(RIGHT(id, 5)) FROM Products
		SELECT @id = CASE
			WHEN @id = 99999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00001'
			WHEN @id >= 0 and @id < 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 99 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
		END
	RETURN @id
END
--Cập nhật số lượng đã bán bên bảng product
GO
CREATE TRIGGER tg_AutoUpdatePro on DetailsOrders
for insert,update
as
	update Products
	set purchase = purchase + (select orderQuantity from inserted)
	where id = (select proID from inserted)
--Cập nhật số lượng tồn trên bảng product
--GO
--CREATE TRIGGER tg_AutoQuantityGiam on DetailsOrders
--for insert,update
--as
--	update Products
--	set quanlity = quanlity - (select orderQuantity from inserted)
--	where id = (select proID from inserted)
--Cập nhật giỏ hàng khi đổi giá
GO 
CREATE TRIGGER tg_AutoUp on Cart
for update
 as
 update Products
 set price = (select proPrice from inserted)
 where id = (select proID from inserted)
--Cập nhật số lượng mua bên bảng khách hàng
GO 
CREATE TRIGGER tg_AutoUpCountCus on DetailsOrders
for insert,update
 as
 update Customers
 set cusQuantityBuy = cusQuantityBuy + (select orderQuantity from inserted)
 where cusID = (select cusID from Orders where orderID = (select orderID  from inserted))
 --Cập nhật tiền bên bảng khách hàng
 GO 
CREATE TRIGGER tg_AutoUpTotalCus on DetailsOrders
for insert,update
 as
 update Customers
 set cusTotal = cusTotal + (select (orderQuantity*proPrice) from inserted)
 where cusID = (select cusID from Orders where orderID = (select orderID  from inserted))
 --cập nhật giỏ hàng khi thay đổi số lượng
 GO 
CREATE TRIGGER tg_AutoMoneyCart on Cart
for update
 as
update Cart
set cartMoney = CartQuantity* proPrice
GO
USE [master]
GO
ALTER DATABASE [QL_Laptop] SET  READ_WRITE 
GO
