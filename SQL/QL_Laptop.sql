

--Cập nhật số lượng đã bán bên bảng product
GO
/****** Object:  Table [dbo].[accessory]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Banner]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[CancelOrder]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 2/16/2023 9:52:30 AM ******/
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
 CONSTRAINT [pk_ca] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 2/16/2023 9:52:30 AM ******/
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
 CONSTRAINT [pk_cmt] PRIMARY KEY CLUSTERED 
(
	[comID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 2/16/2023 9:52:30 AM ******/
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
 CONSTRAINT [PK__cus] PRIMARY KEY CLUSTERED 
(
	[cusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customertype]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Description]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Detail]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[DetailsOrders]    Script Date: 2/16/2023 9:52:30 AM ******/
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
 CONSTRAINT [PK__DetailsOrder] PRIMARY KEY CLUSTERED 
(
	[DeOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2/16/2023 9:52:30 AM ******/
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
 CONSTRAINT [PK__Employee] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesRole]    Script Date: 2/16/2023 9:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesRole](
	[empRole] [int] IDENTITY(1,1) NOT NULL,
	[empRoleName] [nvarchar](10) NULL,
 CONSTRAINT [PK__Employee__role] PRIMARY KEY CLUSTERED 
(
	[empRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HUI]    Script Date: 2/16/2023 9:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUI](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemset] [nvarchar](max) NULL,
	[Util] [int] NULL,
 CONSTRAINT [pk_hui] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[NameOrderStatus]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 2/16/2023 9:52:30 AM ******/
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
 CONSTRAINT [pk_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parameter]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[promotions]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[PromotionsGift]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[returnProduct]    Script Date: 2/16/2023 9:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[returnProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NULL,
	[reason] [nvarchar](500) NULL,
	[nameImage] [nvarchar](500) NULL,
	[tt] [nvarchar](500) NULL,
 CONSTRAINT [pk_rePro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupPortOfTransation]    Script Date: 2/16/2023 9:52:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupPortOfTransation](
	[itemset] [nvarchar](max) NULL,
	[sup] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleDetailAccessory]    Script Date: 2/16/2023 9:52:30 AM ******/
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
/****** Object:  Table [dbo].[Trademark]    Script Date: 2/16/2023 9:52:30 AM ******/
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
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (68, N'PKC000048', 17, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (69, N'PKC000048', 18, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (70, N'PKC000048', 4, N'Dài 17.57 cm - Đường kính 0.98 cm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (71, N'PKC000048', 5, N'Khoảng 20.7 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (72, N'PKC000048', 29, N'Khoảng 45 phút')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (73, N'PKC000048', 30, N'Khoảng 4 tiếng')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (74, N'LAP000031', 8, N' iPad Pro 12.9 inch (Gen 1,2), iPad Pro 10.5 inch, iPad Pro 9.7 inch, iPad Air (Gen 3), iPad (Gen 6,7,8,9), iPad mini 5')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (75, N'PKC000048', 9, N' Có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (76, N'PKC000048', 10, N'Sạc qua cổng Lightning')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (77, N'PKC000049', 31, N'Dùng 6 giờ - Sạc Hãng không công bố')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (78, N'PKC000049', 32, N' Dùng 30 giờ - Sạc Hãng không công bố')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (79, N'PKC000049', 27, N'Sạc MagSafe  Lightning  Sạc không dây Qi')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (80, N'PKC000049', 34, N'Active Noise Cancellation  Chip Apple H2  Adaptive EQ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (81, N'PKC000049', 8, N'Android, iOS, Windows')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (82, N'PKC000049', 19, N'Chống nước IPX4,  Sạc không dây,  Trợ lý ảo Siri,  Có mic thoại,  Sạc nhanh,  Chống ồn chủ động ANC')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (83, N'PKC000049', 35, N'1 thiết bị')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (84, N'PKC000049', 36, N'Bluetooth 5.3')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (85, N'PKC000049', 37, N'Cảm ứng chạm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (86, N'PKC000049', 33, N'Nghe/nhận cuộc gọi,  Phát/dừng chơi nhạc,  Chuyển bài hát,  Tăng/giảm âm lượng,  Bật trợ lí ảo,  Chuyển chế độ,  Bật/Tắt chống ồn')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (87, N'PKC000049', 4, N' Dài 3.09 cm - Rộng 2.18 cm - Cao 2.17 cm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (88, N'PKC000049', 5, N'5.3 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (89, N'PKC000049', 3, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (90, N'PKC000049', 2, N'Việt Nam / Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (91, N'PKC000050', 31, N'Dùng 5 giờ - Sạc 2 giờ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (92, N'PKC000050', 32, N'Dùng 24 giờ - Sạc 2 giờ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (93, N'PKC000050', 27, N' Lightning')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (94, N'PKC000050', 34, N'Chip Apple H1')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (95, N'PKC000050', 8, N' AndroidiOS (iPhone)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (96, N'PKC000050', 19, N'Có mic thoạiSạc nhanh')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (97, N'PKC000050', 35, N'1 thiết bị')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (98, N'PKC000050', 36, N'Bluetooth 5.0')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (99, N'PKC000050', 37, N'Cảm ứng chạm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (100, N'PKC000050', 33, N'Mic thoại  Nghe/nhận cuộc gọi  Phát/dừng chơi nhạc  Chuyển bài hát  Bật trợ lí ảo')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (101, N'PKC000050', 4, N'Dài 4.05 cm - Rộng 1.65 cm - Cao 1.8 cm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (102, N'PKC000050', 5, N'4 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (103, N'PKC000050', 3, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (104, N'PKC000050', 2, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (105, N'PKC000051', 31, N'Dùng 5 giờ - Sạc 2 giờ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (106, N'PKC000051', 32, N'Dùng 24 giờ - Sạc 3 giờ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (107, N'PKC000051', 27, N'Sạc MagSafe  Lightning  Sạc không dây')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (108, N'PKC000051', 34, N' Spatial Audio  Active Noise Cancellation  Chip Apple H1  Adaptive EQ  Transparency Mode  Custom High Dynamic Range Amplifier  Custom high-excursion Apple driver')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (109, N'LAP000031', 8, N'Android  iOS (iPhone)  iPadOS (iPad)  macOS (Macbook, iMac)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (110, N'PKC000051', 19, N'Chống nước IPX4  Sạc không dây  Chống ồn  Có mic thoại')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (111, N'PKC000051', 35, N'1 thiết bị')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (112, N'PKC000051', 36, N'Bluetooth 5.0')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (114, N'PKC000051', 37, N'Cảm ứng lực')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (115, N'PKC000051', 33, N'Nghe/nhận cuộc gọi  Chuyển bài hát  Phát/dừng chơi nhạc  Bật trợ lí ảo')
GO
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (116, N'PKC000051', 4, N' Dài 3.1 cm - Rộng 1.8 cm - Cao 2.4 cm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (117, N'PKC000051', 5, N' 5.4 g')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (118, N'PKC000051', 3, N'Mỹ')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (119, N'PKC000051', 2, N'Việt Nam/Trung Quốc (tùy lô hàng)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (120, N'PKC000052', 8, N' macOS (MacBook, iMac)Windows')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (121, N'PKC000052', 21, N' 1300 DPI')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (122, N'PKC000052', 10, N' BluetoothĐầu thu USB Receiver')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (123, N'PKC000052', 22, N'10 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (124, N'PKC000052', 25, N'1 viên pin AA')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (125, N'PKC000052', 5, N'60 g (bao gồm hộp)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (126, N'PKC000052', 3, N' Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (127, N'PKC000052', 2, N' Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (128, N'PKC000052', 38, N'Rapoo')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (129, N'PKC000049', 38, N'Apple')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (130, N'PKC000050', 38, N'Apple')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (131, N'PKC000052', 38, N'Apple')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (132, N'PKC000053', 8, N'macOS (MacBook, iMac)Windows')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (133, N'PKC000053', 21, N'1300 DPI')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (134, N'PKC000053', 10, N'BluetoothĐầu thu USB Receiver')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (135, N'PKC000053', 22, N'10 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (138, N'PKC000053', 25, N'1 viên pin AA')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (139, N'PKC000053', 5, N' 60 (bao gồm hộp)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (140, N'PKC000053', 3, N'Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (141, N'PKC000053', 2, N'Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (142, N'PKC000053', 38, N'Rapoo')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (143, N'PKC000054', 8, N' Windows')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (144, N'PKC000054', 10, N'Dây cắm USB')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (145, N'PKC000054', 22, N'1.85 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (146, N'PKC000054', 39, N'Hãng không công bố')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (147, N'PKC000054', 40, N'Full size')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (148, N'PKC000054', 41, N'108 Phím')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (149, N'PKC000054', 43, N'RGB')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (150, N'PKC000054', 27, N' Không có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (151, N'PKC000054', 42, N'MSI Center')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (152, N'PKC000054', 4, N'Dài 43.5 cm - Rộng 15 cm - Cao 3.2 cm - Nặng 1.042 kg')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (153, N'PKC000054', 2, N'Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (154, N'PKC000054', 3, N' Đài Loan')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (155, N'PKC000054', 38, N' MSI')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (156, N'PKC000055', 8, N'Windows')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (157, N'PKC000055', 10, N'Dây cắm USB')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (158, N'PKC000055', 22, N'1.8 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (159, N'PKC000055', 40, N'Full size')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (160, N'PKC000055', 41, N' 104 Phím')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (161, N'PKC000055', 43, N'RGB')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (162, N'PKC000055', 42, N'Armoury Crate')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (163, N'PKC000055', 5, N'Nặng 810 g (bàn phím)')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (164, N'PKC000055', 2, N'Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (165, N'PKC000055', 3, N'Đài Loan')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (166, N'PKC000055', 38, N' Asus')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (167, N'PKC000056', 8, N' iOS,  Windows,  Android,  MacOS')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (168, N'PKC000056', 10, N'Dây cắm USBBluetooth')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (169, N'PKC000056', 22, N'8 m')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (170, N'PKC000056', 39, N'Blue Switch')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (171, N'PKC000056', 41, N' 68 Phím')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (172, N'PKC000056', 43, N' Có')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (173, N'PKC000056', 27, N'USB Type-C')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (174, N'PKC000056', 42, N' DareU')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (175, N'PKC000056', 4, N' Dài 31 cm - Rộng 11.1 cm - Cao 3.2 cm')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (176, N'PKC000056', 2, N'Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (177, N'PKC000056', 3, N'Trung Quốc')
INSERT [dbo].[accessory] ([ac_ID], [product_id], [para_id], [content]) VALUES (178, N'PKC000056', 38, N' DareU')
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

INSERT [dbo].[CancelOrder] ([id], [id_order], [reason]) VALUES (2, 1015, N'Iu Quin')
INSERT [dbo].[CancelOrder] ([id], [id_order], [reason]) VALUES (3, 1016, N'Dỏm quá')
INSERT [dbo].[CancelOrder] ([id], [id_order], [reason]) VALUES (4, 1020, N'Không muốn nữa')
SET IDENTITY_INSERT [dbo].[CancelOrder] OFF
GO
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000001', N'PKC000042', 20, 500000, CAST(10 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000002', N'PKC000043', 50, 2540000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000003', N'PKC000044', 100, 3740000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000004', N'PKC000045', 100, 3900000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000005', N'PKC000046', 100, 295000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000006', N'LAP000031', 100, 53000000, CAST(5 AS Decimal(32, 0)))
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
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1302023PN000033 ', N'LAP000058', 50, 17190000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1302023PN000034 ', N'LAP000059', 30, 17890000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1302023PN000035 ', N'LAP000060', 30, 25690000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1302023PN000036 ', N'LAP000061', 20, 23690000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000037 ', N'LAP000062', 20, 43690000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000038 ', N'LAP000063', 20, 41890000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000039 ', N'LAP000064', 20, 40090000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000040 ', N'LAP000065', 20, 31910000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000041 ', N'LAP000066', 20, 23690000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000042 ', N'LAP000067', 20, 16390000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000043 ', N'LAP000068', 20, 14990000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'1312023PN000044 ', N'LAP000069', 20, 29490000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000045  ', N'PKC000048', 20, 2310000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000046  ', N'PKC000049', 20, 6590000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000047  ', N'PKC000050', 20, 3390000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000048  ', N'PKC000051', 20, 4990000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000049  ', N'PKC000052', 20, 400000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000050  ', N'PKC000053', 20, 400000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000051  ', N'PKC000054', 20, 970000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000052  ', N'PKC000055', 20, 990000, CAST(2 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'212023PN000053  ', N'PKC000056', 20, 1170000, CAST(2 AS Decimal(32, 0)))
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (1, N'LAP000058', 1003, N'kkkk', CAST(N'2023-02-02T16:04:53.017' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (2, N'PKC000052', 1003, N'kkkkkk', CAST(N'2023-02-07T15:52:55.520' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
INSERT [dbo].[Comments] ([comID], [proID], [cusID], [comMessage], [comDate], [cusemail], [cusName]) VALUES (3, N'LAP000059', 1003, N'KKKKK', CAST(N'2023-02-15T21:50:20.813' AS DateTime), N'nguyennhutnam@gmail.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', N'Nguyễn Nam')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 

INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (4, 1003, N'Số 438A ,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (5, 1003, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (7, 1004, N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (8, 1004, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (11, 1004, N'114 Lê Lợi, Xã Tân An,Huyện Chiêm Hóa,Tỉnh Tuyên Quang')
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1003, N'Nguyễn Nam', N'Nam', N'nguyennhutnam@gmail.com', N'0339906489 ', N'123       ', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 1, 1408999950, 50, 1, N'admin.jpg                                                                                           ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1004, N'Bùi Thị KimQuyên', N'Nữ', N'quin.12177@gmail.com', N'0397495029 ', N'123       ', N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre', 1, 103771600, 6, 1, N'beQuin.jpg                                                                                          ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1005, N'QuyênBùi', N'Nữ', N'quyen.12177@gmail.com', N'0397495029 ', N'123       ', N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre', 1, 0, 0, 1, N'beQuin.jpg                                                                                          ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1006, N'Nguyễn Nhựt Nam', N'Nam', NULL, N'033993212  ', NULL, N'Số 114 , Phường Ngọc Hà, Thành phố Hà Giang, Tỉnh Hà Giang', 1, 69300000, 2, 1, N'admin.jpg                                                                                           ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1007, N'Nam', N'Nam', NULL, N'0338867453 ', NULL, N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre', 1, 34650000, 1, 1, N'admin.jpg                                                                                           ')
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1008, N'Nguyễn Văn An', N'Nam', N'nguyenntnam@gmail.com', N'0339906477 ', N'123       ', N'114 Phú Xuân, Xã Đức Giang, Huyện Yên Dũng, Tỉnh Bắc Giang', 1, 137401800, 5, 1, NULL)
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1009, N'Nguyễn Nhựt Nam', N'Nam', NULL, N'0338899779 ', NULL, N'65 Kinh xuôi, Phường Yên Thanh, Thành phố Uông Bí, Tỉnh Quảng Ninh', 1, 222600000, 4, 1, NULL)
INSERT [dbo].[Customers] ([cusID], [cusName], [cusGender], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusTotal], [cusQuantityBuy], [cusStatus], [cusPhoto]) VALUES (1010, N'Nam', N'Nam', NULL, N'0339907799 ', NULL, N'114 Mong, Xã Huổi Lèng, Huyện Mường Chà, Tỉnh Điện Biên', 1, 26203800, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (1, N'Khách hàng thường')
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (2, N'Khách hàng thân thiết')
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (3, N'Khách VIP')
GO
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000031', N'MacBook Pro mới mang đến hiệu năng cao ấn tượng cho người dùng pro. Lựa chọn M1 Pro mạnh mẽ hay M1 Max còn mạnh hơn thế để tăng tốc xử lý các luồng công việc đẳng cấp pro cùng thời lượng pin đáng kinh ngạc.', N'Tính năng nổi bật
& Chip M1 Max hoặc M1 Pro do Apple thiết kế tạo ra một cú nhảy vọt về hiệu năng máy học, CPU và GPU

& CPU lên đến 10 lõi cho hiệu năng nhanh hơn đến 3.7x, xử lý các luồng công việc chuyên nghiệp nhanh hơn bao giờ hết3

& GPU lên đến 32 lõi với tốc độ xử lý đồ họa nhanh hơn đến 13x cho các ứng dụng và game có đồ họa khủng3

& Neural Engine 16 lõi cho hiệu năng máy học nhanh hơn đến 11x3

& Thời lượng pin lâu hơn, lên đến 17 giờ1

&  Bộ nhớ thống nhất lên đến 64GB giúp bạn làm việc gì cũng nhanh chóng và trôi chảy

&  Ổ lưu trữ SSD siêu nhanh lên đến 8TB giúp mở các ứng dụng và tập tin chỉ trong tích tắc

& Màn hình Liquid Retina XDR 14 inch sắc nét với Extreme Dynamic Range và tỷ lệ tương phản cực cao2

& Camera FaceTime HD 1080p với bộ xử lý tín hiệu hình ảnh tiên tiến cho các cuộc gọi video sắc nét hơn

& Hệ thống âm thanh 6 loa với loa trầm khử lực

& Ba micro phối hợp chuẩn studio thu giọng nói của bạn rõ hơn

&  Ba cổng Thunderbolt 4, cổng HDMI, khe thẻ nhớ SDXC, jack cắm tai nghe, cổng MagSafe 3

& Wi-Fi 6 thế hệ mới giúp kết nối nhanh hơn

& Bàn phím Magic Keyboard có đèn nền và Touch ID giúp mở khóa và thanh toán an toàn hơn macOS Monterey cho phép bạn kết nối, chia sẻ và sáng tạo hơn bao giờ hết, với các bản cập nhật FaceTime mới đầy thú vị và Safari đã được thiết kế lại

& Hiện có màu xám bạc và bạc', N'lap000000.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000033', N'Sự xuất hiện của chip M2 cùng ngoại hình đẳng cấp, thời thượng đã giúp chiếc MacBook Pro 13 inch M2 2022 trở thành một trong những siêu phẩm lần nữa khẳng định vị thế của Apple trong phân khúc laptop cao cấp - sang trọng tính đến thời điểm 2022. ', N'Cân mọi tác vụ với nguồn sức mạnh tiềm năng
&Tuy vẫn được sản xuất ở tiến trình 5 nm và sở hữu 4 nhân điện năng cao, 4 nhân tiết kiệm như dòng chip M1 nhưng MacBook M2 năm nay đã được cải tiến vượt trội với tốc độ băng thông lên đến 100GB/s giúp vận hành trơn tru, liền mạch mọi tác vụ từ cơ bản đến nâng cao, cùng với đó là sự hỗ trợ của 20 nghìn tỷ bóng bán dẫn hứa hẹn nâng cao hiệu suất hoạt động hơn 18% so với thế hệ tiền nhiệm.  
&Card đồ họa tích hợp 10 nhân GPU với khả năng xử lý lên đến 15.8 nghìn tỷ tác vụ chỉ trong 1 giây giúp người dùng cân tốt mọi tác vụ của một chiếc laptop đồ họa - kỹ thuật từ thiết kế chuyên nghiệp trên các ứng dụng đồ họa Photoshop, Illustrator, Premiere,... đến phát và chỉnh sửa nhiều luồng video 4K, 8K ProRes 12 ấn tượng.
&Nâng tầm đa nhiệm vượt trội với bộ nhớ RAM 16 GB ấn tượng, cho phép bạn vận hành cùng lúc nhiều trình duyệt Safari khác nhau nhưng vẫn đảm bảo trơn tru, mượt mà. Đi kèm với đó là không gian lưu trữ ổn định đến từ ổ cứng SSD 256 GB vừa giúp bạn tải nhiều tài liệu cần thiết vừa cho tốc độ mở máy nhanh chóng hơn chỉ trong vài giây. 
&Luôn sang trọng, quyến rũ trên mọi góc nhìn
&MacBook Pro luôn làm người dùng hài lòng với lớp vỏ kim loại cứng cáp cùng những cạnh bo góc tinh tế và chiếc logo táo khuyết đặc trưng, tất cả đều toát lên một vẻ ngoài tuy đơn giản nhưng vô cùng hút mắt. Độ di động cực cao chỉ với 1.4 kg luôn sẵn sàng đồng hành cùng bạn trên mọi chuyến đi xa.
&MacBook luôn là một trong những dòng sản phẩm đứng đầu về hệ thống bảo mật và quyền riêng tư nhờ tính năng cảm biến vân tay tiện ích được tích hợp ngang với thanh cảm ứng Touch Bar, ngoài ra sự hỗ trợ của vi xử lý Apple Silicon và hệ điều hành macOS đảm bảo tối đa tính an toàn tuyệt đối cũng như giúp người dùng quản lý máy tính của mình tốt hơn.   
&Laptop được trang bị 2 cổng Thunderbolt 3 hoạt động với băng thông lên đến 40 Gbps cùng Jack tai nghe 3.5 mm tương thích được nhiều sản phẩm trên thị trường, vừa giúp cho quá trình làm việc với các thiết bị ngoại vi khác dễ dàng vừa mang đến sự tinh gọn đẹp mắt cho máy.', N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000034', N'Macbook Pro M1 2020 được nâng cấp với bộ vi xử lý mới cực kỳ mạnh mẽ, chiếc laptop này sẽ phục vụ tốt cho công việc của bạn, đặc biệt cho lĩnh vực đồ họa, kỹ thuật.', N'Tăng cường không gian lưu trữ, tốc độ xử lý
&Chip Apple M1 là một bộ vi xử lý mạnh mẽ, được ra mắt lần đầu tiên trên máy Mac. Đây là con chip sản xuất trên tiến trình 5 nm, tích hợp CPU 8 lõi với 4 lõi CPU tốc độ và và 4 lõi tiết kiệm năng lượng. Nhờ vậy, thời lượng pin của laptop được kéo dài đến tận 10 tiếng đồng hồ, giúp cho bạn thoải mái làm việc với một hiệu suất cực kỳ cao.
&Ngoài ra, card đồ họa tích hợp 8 nhân GPU giúp người dùng thao tác tốt các tác vụ văn phòng cơ bản Word, Excel,... cũng như thiết kế đồ họa bằng Photoshop, AI, Pr,... một cách trơn tru, mượt mà với tốc độ xử lý gấp 5 lần các thế hệ trước đó. Nhờ vậy, bạn có thể nâng cao hiệu suất làm việc cũng như tiết kiệm được thời gian một cách tối ưu nhất.
&Laptop SSD 512 GB giúp bạn tăng tốc toàn diện máy tính với tốc độ khởi động, mở ứng dụng, truyền dữ liệu nhanh vượt trội so với ổ cứng HDD truyền thống. Bên cạnh đó, RAM 16 GB của laptop giúp nâng cao khả năng đa nhiệm, dễ dàng mở những tập tin lớn, nặng hay mở nhiều trình duyệt cùng lúc nhưng không xảy ra tình trạng giật lag.
&Kiểu dáng thời trang, mỏng nhẹ
&Chiếc laptop phiên bản thời thượng với vỏ kim loại nguyên khối cực kỳ sang trọng, nhỏ gọn và thời trang. Bạn cũng có thể dễ dàng cho Macbook Pro 2020 vào cặp xách hay balo, cầm trên tay nhẹ nhàng để di chuyển bất cứ nơi đâu chỉ với khối lượng 1.4 kg và mỏng 15.6 mm.
&Hình ảnh chân thật đến từng chi tiết
&Với độ phân giải 2560 x 1600 vô cùng sắc nét, màn hình Retina 13.3 inch hiển thị lý tưởng mọi nội dung bạn cần theo dõi, từ trang web, văn bản rõ ràng cho đến những đoạn phim sống động.
&Ấn tượng hơn nữa, với độ sáng màn hình lên đến 500 nits, bạn sẽ có được một trải nghiệm ánh sáng tuyệt vời trên một màn hình hiển thị hình ảnh cực kỳ sống động và chân thật. Bên cạnh đó, với tấm nền IPS, bạn sẽ đắm chìm vào một thế giới màu sắc vô cùng rực rỡ và có được một góc nhìn rộng hơn.', N'lap34.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000035', N'Sự xuất hiện của chip M2 cùng ngoại hình đẳng cấp, thời thượng đã giúp chiếc MacBook Pro 13 inch M2 2022 trở thành một trong những siêu phẩm lần nữa khẳng định vị thế của Apple trong phân khúc laptop cao cấp - sang trọng tính đến thời điểm 2022.', N'Cân mọi tác vụ với nguồn sức mạnh tiềm năng &Tuy vẫn được sản xuất ở tiến trình 5 nm và sở hữu 4 nhân điện năng cao, 4 nhân tiết kiệm như dòng chip M1 nhưng MacBook M2 năm nay đã được cải tiến vượt trội với tốc độ băng thông lên đến 100GB/s giúp vận hành trơn tru, liền mạch mọi tác vụ từ cơ bản đến nâng cao, cùng với đó là sự hỗ trợ của 20 nghìn tỷ bóng bán dẫn hứa hẹn nâng cao hiệu suất hoạt động hơn 18% so với thế hệ tiền nhiệm. &Card đồ họa tích hợp 10 nhân GPU với khả năng xử lý lên đến 15.8 nghìn tỷ tác vụ chỉ trong 1 giây giúp người dùng cân tốt mọi tác vụ của một chiếc laptop đồ họa - kỹ thuật từ thiết kế chuyên nghiệp trên các ứng dụng đồ họa Photoshop, Illustrator, Premiere,... đến phát và chỉnh sửa nhiều luồng video 4K, 8K ProRes 12 ấn tượng. &Nâng tầm đa nhiệm vượt trội với bộ nhớ RAM 16 GB ấn tượng, cho phép bạn vận hành cùng lúc nhiều trình duyệt Safari khác nhau nhưng vẫn đảm bảo trơn tru, mượt mà. Đi kèm với đó là không gian lưu trữ ổn định đến từ ổ cứng SSD 256 GB vừa giúp bạn tải nhiều tài liệu cần thiết vừa cho tốc độ mở máy nhanh chóng hơn chỉ trong vài giây. &Luôn sang trọng, quyến rũ trên mọi góc nhìn &MacBook Pro luôn làm người dùng hài lòng với lớp vỏ kim loại cứng cáp cùng những cạnh bo góc tinh tế và chiếc logo táo khuyết đặc trưng, tất cả đều toát lên một vẻ ngoài tuy đơn giản nhưng vô cùng hút mắt. Độ di động cực cao chỉ với 1.4 kg luôn sẵn sàng đồng hành cùng bạn trên mọi chuyến đi xa. &MacBook luôn là một trong những dòng sản phẩm đứng đầu về hệ thống bảo mật và quyền riêng tư nhờ tính năng cảm biến vân tay tiện ích được tích hợp ngang với thanh cảm ứng Touch Bar, ngoài ra sự hỗ trợ của vi xử lý Apple Silicon và hệ điều hành macOS đảm bảo tối đa tính an toàn tuyệt đối cũng như giúp người dùng quản lý máy tính của mình tốt hơn. &Laptop được trang bị 2 cổng Thunderbolt 3 hoạt động với băng thông lên đến 40 Gbps cùng Jack tai nghe 3.5 mm tương thích được nhiều sản phẩm trên thị trường, vừa giúp cho quá trình làm việc với các thiết bị ngoại vi khác dễ dàng vừa mang đến sự tinh gọn đẹp mắt cho máy.', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000036', N'Laptop HP VICTUS 16 d0292TX i5 (5Z9R3PA) sẽ là một người bạn đồng hành đắc lực trên mọi chiến trường ảo của game thủ nhờ ngoại hình sang trọng, hiện đại cùng những thông số kỹ thuật mạnh mẽ.', N'Trang bị chip Intel Core i5 11400H cùng card rời NVIDIA GeForce RTX3050Ti 4 GB, laptop HP Victus sẵn sàng cùng bạn chiến mọi tựa game đình đám như LOL, PUBG, CS:GO,... hay thỏa mãn đam mê sáng tạo với các ứng dụng đồ họa của nhà Adobe. Vừa chiến game vừa nghe nhạc giải trí vẫn rất mượt mà, không giật lag nhờ bộ nhớ RAM 8 GB, ổ cứng 512 GB SSD (có thể tháo và lắp thanh khác tối đa 1 TB) mang đến không gian lưu trữ ổn định cùng tốc độ mở máy nhanh chóng hơn. 
& Quan sát di chuyển của đối thủ ở mọi góc cạnh nhờ kích thước màn hình 16.1 inch cùng tấm nền IPS tạo góc nhìn rộng rãi, độ phân giải Full HD cùng công nghệ Wled-backlit mang đến những khung ảnh chất lượng, sắc nét hơn. 
& Tần số quét 144 Hz cho mọi chuyển động có tốc độ nhanh được mượt mà hơn đáng kể, đồng thời vẫn bảo vệ thị giác của người dùng trước ánh sáng xanh của máy nhờ màn hình chống chói Anti Glare.', N'lap36_6.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000037', N'Laptop HP 15s fq2662TU i3 (6K795PA) sẽ là sự lựa chọn phù hợp cho học sinh, sinh viên muốn tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình ổn định, đáp ứng tốt mọi nhu cầu cơ bản cùng một mức giá lý tưởng, dễ dàng tiếp cận.', N'Laptop HP cơ bản được bao bọc bởi lớp vỏ nhựa màu bạc, mang đến vẻ đẹp tối giản nhưng cũng không kém phần thanh lịch, tao nhã. Khối lượng 1.7 kg hỗ trợ bạn bỏ vào balo dễ dàng và mang đến khắp mọi nơi để học tập, làm việc.

& Các cổng kết nối như USB Type-C, USB A, HDMI, khe đọc thẻ nhớ SD và Jack tai nghe 3.5 mm được trang bị xung quanh laptop cho phép bạn kết nối với các thiết bị ngoại vi khác như loa, chuột, máy chiếu,... nhanh chóng hơn mà không cần đến dây cáp rườm rà.

& Laptop HP trang bị bộ vi xử lý Intel Core i3 1115G4 và card Intel UHD Graphics giải quyết nhẹ nhàng các tác vụ học tập, làm việc trên Word, Excel, PowerPoint,... hay chỉnh sửa ảnh, thiết kế cơ bản trên Figma, Canva,... một cách mượt mà.

& RAM 4 GB cho phép bạn vừa soạn thảo văn bản trên Word vừa nghe nhạc giải trí mà vẫn trơn tru, suôn sẻ. Không gian lưu trữ ổn định nhờ ổ cứng SSD 256 GB, nó có thể tháo ra và lắp thanh khác tối đa 1 TB.

& Màn hình 15.6 inch cho không gian hiển thị rộng rãi cùng độ sáng 250 nits giúp bạn quan sát rõ mọi nội dung được hiển thị trên màn hình ở điều kiện văn phòng mát mẻ. 

& Công nghệ âm thanh Stereo speakers mang đến chất lượng âm thanh tốt, ro rõ, đắm chìm bạn vào những phút giây thư giãn tuyệt vời. ', N'lap37_2.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000038', N'Laptop HP 15s fq2662TU i3 (6K795PA) sẽ là sự lựa chọn phù hợp cho học sinh, sinh viên muốn tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình ổn định, đáp ứng tốt mọi nhu cầu cơ bản cùng một mức giá lý tưởng, dễ dàng tiếp cận.', N'Laptop HP cơ bản được bao bọc bởi lớp vỏ nhựa màu bạc, mang đến vẻ đẹp tối giản nhưng cũng không kém phần thanh lịch, tao nhã. Khối lượng 1.7 kg hỗ trợ bạn bỏ vào balo dễ dàng và mang đến khắp mọi nơi để học tập, làm việc. 
& Các cổng kết nối như USB Type-C, USB A, HDMI, khe đọc thẻ nhớ SD và Jack tai nghe 3.5 mm được trang bị xung quanh laptop cho phép bạn kết nối với các thiết bị ngoại vi khác như loa, chuột, máy chiếu,... nhanh chóng hơn mà không cần đến dây cáp rườm rà. 
& Laptop HP trang bị bộ vi xử lý Intel Core i3 1115G4 và card Intel UHD Graphics giải quyết nhẹ nhàng các tác vụ học tập, làm việc trên Word, Excel, PowerPoint,... hay chỉnh sửa ảnh, thiết kế cơ bản trên Figma, Canva,... một cách mượt mà. 
& RAM 4 GB cho phép bạn vừa soạn thảo văn bản trên Word vừa nghe nhạc giải trí mà vẫn trơn tru, suôn sẻ. Không gian lưu trữ ổn định nhờ ổ cứng SSD 256 GB, nó có thể tháo ra và lắp thanh khác tối đa 1 TB. 
& Màn hình 15.6 inch cho không gian hiển thị rộng rãi cùng độ sáng 250 nits giúp bạn quan sát rõ mọi nội dung được hiển thị trên màn hình ở điều kiện văn phòng mát mẻ. 
& Công nghệ âm thanh Stereo speakers mang đến chất lượng âm thanh tốt, ro rõ, đắm chìm bạn vào những phút giây thư giãn tuyệt vời.', N'Laptop HP 15s fq2662TU i3 1115G44GB256GBWin11 (6K795PA).jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000039', N'Laptop Lenovo Yoga Slim 7 14ITL05 i7 (82A300DQVN) hướng đến sự toàn vẹn về thiết kế tạo nên một phiên bản laptop cao cấp - sang trọng hiện đại kết hợp cùng cấu hình mạnh mẽ, tự tin đồng hành cùng bạn trên mọi phương diện làm việc và giải trí.', N'Laptop Lenovo được chế tác với lớp vỏ ngoài bằng kim loại cứng cáp, tạo sự bền bỉ trong quá trình sử dụng. Thiết kế bản lề có khả năng mở góc lên đến 180 độ cho phép mình chỉnh góc nhìn cũng như chia sẻ hình ảnh, dữ liệu với bạn bè, đồng nghiệp mà không cần di chuyển máy phức tạp. Nắp lưng có thiết kế quen thuộc với logo “YOGA” và “Lenovo” được bố trí ở hai phía góc máy. 
& Khối lượng nhẹ chỉ 1.36 kg cùng độ dày khiêm tốn 14.9 mm thuận tiện để mình di chuyển, không tốn quá nhiều không gian trong balo, cùng mình đi khắp mọi nơi từ công ty cho đến quán cà phê. Cảm biến vân tay được tích hợp trên nút nguồn nằm ở cạnh bên của máy cho phép mình mở khóa nhanh chóng, thực hiện thanh toán trực tuyến cũng như thay cho mật khẩu truy cập vào dữ liệu, ứng dụng chỉ với một chạm đơn giản. 
& Bạn cũng có thể kích hoạt tính năng mở khóa khuôn mặt trên máy nhờ trang bị camera IR, đáp ứng trọn vẹn nhu cầu bảo mật. Laptop được trang bị chip bảo mật TPM 2.0 giúp bảo mật dữ liệu cá nhân khỏi các cuộc xâm nhập trái phép, đây là một tính năng quan trọng đối với những người dùng là doanh nhân luôn cần bảo mật các số liệu lưu trữ trên máy. Đồng thời chip TPM 2.0 cũng là trang bị quan trọng để mình có thể nâng cấp máy lên Windows 11. 
& Bàn phím của máy có hành trình sâu, độ nảy tốt, khoảng cách giữa các phím rộng rãi tạo cho mình cảm giác thoải mái khi gõ. Bàn phím cũng có đèn nền hỗ trợ mình soạn thảo văn bản ở những nơi tối, rất hữu ích để chạy deadline.', N'lap39_7.jpg')
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
& Chiếc laptop Acer Aspire còn sở hữu RAM 8 GB và SSD 256 GB đáp ứng tốt nhu cầu đa nhiệm, hỗ trợ bạn thao tác mọi việc nhanh chóng và hiệu quả hơn. 
& Phiên bản laptop này với khối lượng 2.1 kg và dày 22.9 mm, được chế tác từ chất liệu nhựa bền bỉ, dễ dàng để bạn mang đi khắp mọi nơi. 
& Bản lề mở 180 độ giúp chia sẻ thông tin nhanh chóng, tiện lợi. Cùng đèn nền đơn sắc được trang bị hỗ trợ bạn gõ phím chuẩn xác trong bóng tối. Laptop Acer này có 2 cổng USB 3.2, HDMI, LAN (RJ45), USB 2.0 và USB Type-C cho phép bạn truyền tải dữ liệu nhanh chóng. 
& Công nghệ Acer ComfyView, chống chói Anti Glare và tấm nền IPS được trang bị trên màn hình 15.6 inch, mang đến những trải nghiệm rõ nét, góc nhìn mở rộng, hạn chế hiện tượng chói loá, bóng gương, bảo vệ thị giác của bạn. 
& Chiếc laptop gaming này cho bạn cảm nhận chân thật âm nhạc sống động, ít bị biến dạng nhờ công nghệ âm thanh Acer TrueHarmony.', N'lap51_7.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000052', N'Laptop Acer Aspire 3 A315 58 52KT i5 (NX.AM0SV.006) có cấu hình khỏe, thiết kế cao cấp, màn hình lớn đủ để phục vụ các nhu cầu làm việc văn phòng và giải trí cơ bản của mọi người dùng.', N'Laptop Acer Aspire được hoàn thiện bởi lớp vỏ nhựa cứng cáp, chắc chắn cùng khối lượng 1.7 kg giúp bạn có thể di chuyển và đem máy đi bất cứ nơi đâu mà không sợ quá cồng kềnh. Laptop Acer có màn hình 15.6 inch Full HD trên tấm nền TFT giúp hình ảnh, nội dung hiển thị sắc nét, màu sắc chính xác, độ tương phản rõ ràng. Tần số quét 60 Hz vừa đủ để bạn trải nghiệm những chuyển động hình ảnh mượt mà khi chơi game phổ thông hay xem phim thư giãn. & Được trang bị bộ vi xử lý Intel Core i5 1135G7 cùng card đồ họa tích hợp Intel Iris Xe Graphics nên máy có thể thoải mái chạy được các ứng dụng từ văn phòng cơ bản hay các phần mềm thiết kế đơn giản và các tựa game phổ thông hiện nay. 
& Là chiếc laptop học tập, văn phòng tối ưu cho người dùng với RAM 8 GB chuẩn DDR4 (hỗ trợ nâng cấp tối đa đến 12 GB) giúp thao tác đa nhiệm mượt mà hơn. Bên cạnh đó, tốc độ khởi động máy cũng như các ứng dụng cũng nhanh chóng chỉ trong vài giây nhờ ổ cứng SSD 512 GB PCIe NVMe. 
& Sở hữu đa dạng các cổng kết nối như HDMI, USB, jack tai nghe 3.5 mm và LAN (RJ45) giúp laptop dễ dàng kết nối với các thiết bị khác. Máy cũng được trang bị chuẩn Wi-Fi 802.11 a/b/g/n/ac kết nối mạng nhanh và trải nghiệm mượt mà.', N'lap52_6.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000053', N'Laptop Acer Aspire A315 56 32TP i3 1005G1 (NX.HS5SV.00K) là sản phẩm laptop laptop mỏng nhẹ, có cấu hình ổn định phù hợp với các nhu cầu sử dụng Office hay lướt web, xem phim giải trí,... của các bạn học sinh, sinh viên.', N'Được bao bọc bởi lớp vỏ nhựa bền chắc và gam màu đen hiện đại, laptop Acer Aspire có khối lượng 1.7 kg dễ dàng cất gọn vào balo mang theo. 
​& Laptop Acer trang bị màn hình 15.6 inch và công nghệ Acer ComfyView, LED Backlit, TFT cung cấp màu sắc trong trẻo với độ tương phản cao, kiểm soát tốt chất lượng hiển thị, giảm thiểu hiện tượng bị chói sáng, bảo vệ mắt trước các ánh sáng xanh độc hại. 
& Bản lề mở 180 độ độc đáo giúp bạn dễ dàng tuỳ chỉnh, chia sẻ màn hình với mọi người trong các buổi họp nhóm.. Đáp ứng tốt các tác vụ cơ bản trên Word, Excel,... nhu cầu giải trí, lướt web nhẹ nhàng nhờ CPU Intel Core i3 Ice Lake 1005G1 cùng card tích hợp Intel UHD Graphics. 
& RAM 4 GB cho khả năng đa nhiệm ổn định. Bộ nhớ trong SSD 256 GB rút ngắn thời gian phản hồi tác vụ, tăng tốc độ khởi động máy, ứng dụng. 
& Các cổng kết nối 2 x USB 2.0, HDMI, LAN (RJ45), USB 3.1 giúp bạn dễ dàng kết nối với các thiết bị ngoại vi khác. Loa laptop sở hữu công nghệ Stereo speakers tái tạo âm thanh tốt, mang đến trải nghiệm âm thanh như đang ở trong một nhà hát giao hưởng sang trọng cho người dùng.', N'lap53_7.jpg')
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
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000057', N'Mang phong cách thiết kế thanh lịch quen thuộc của dòng laptop học tập - văn phòng, laptop Lenovo IdeaPad 5 Pro 16IHU6 i5 11300H (82L9004XVN) nay còn được trang bị màn hình lên đến 16 inch hỗ trợ bạn thao tác xử lý công việc trên một màn hình tiện lợi hơn bao giờ hết.', N'Laptop Lenovo Ideapad được hoàn thiện tinh tế từ lớp vỏ kim loại bền bỉ, có khối lượng 1.9 kg cho cảm giác vô cùng chắc chắn khi cầm nắm, di chuyển. 
& Màn hình có kích thước 16 inch cho không gian hiển thị vô cùng rộng rãi, độ phân giải WQXGA (2560 x 1600) cùng tần số quét 120 Hz mang lại trải nghiệm hình ảnh khi lướt web, cuộn trang vô cùng sắc nét, mượt mà. 
& Độ phủ màu chuẩn xác 100% sRGB cùng độ sáng 350 nits cho chất lượng hiển thị rực rỡ, sống động, độ tương phản cao. Công nghệ chống chói Anti Glare và chống ánh sáng xanh Low Blue Light bảo vệ tối ưu cho thị giác người dùng. 
& Sở hữu con chip mạnh mẽ Intel Core i5 11300H và card rời MX 450 2 GB, laptop có khả năng xử lý nhanh chóng mọi tác vụ trên Office hay thiết kế 2D, chỉnh sửa hình ảnh trên Photoshop, Canva,... 
& RAM 16 GB cho khả năng đa nhiệm siêu trơn tru. Ổ cứng SSD 512 GB rút ngắn thời gian phản hồi tác vụ, cung cấp không gian lưu trữ đủ dùng. 
& Đăng nhập không cần nhập mật khẩu nhờ camera IR cho phép mở khóa bằng khuôn mặt nhanh chóng. Laptop Lenovo còn nâng cao độ an toàn cho dữ liệu cá nhân hơn với chip TPM 2.0 tiên tiến. 
& Đa dạng các cổng kết nối hiện đại như USB 3.2, USB 3.2 (Always on), HDMI, Thunderbolt 4 USB-C, USB Type-C và khe thẻ SD hỗ trợ truyền, xuất dữ liệu dễ dàng. Đèn nền bàn phím tiện lợi cũng được tích hợp. 
& Công nghệ âm vòm Dolby Atmos cho chất âm sống động từ mọi hướng và Stereo speakers giúp bạn cảm giác được không gian, vị trí của từng âm thanh, đắm chìm trong những giai điệu chân thật, sống động.	', N'lap57.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000058', N'Nếu bạn đang tìm kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức giá phải chăng thì laptop Asus TUF Gaming F15 FX506LHB i5 (HN188W) sẽ là sự lựa chọn đáng cân nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ cùng phong cách thiết kế cứng cáp, độc đáo. ', N'Chạy mượt mà các ứng dụng văn phòng trên Word, Excel, PowerPoint,... đến chiến những con game đình đám nhờ bộ vi xử lý Intel Core i5 10300H kết hợp với card đồ họa rời NVIDIA GeForce GTX 1650 4 GB mạnh mẽ. 
& Laptop Asus đa nhiệm mượt mà trên nhiều cửa sổ Chrome cùng lúc nhờ bộ nhớ RAM 8 GB, bên cạnh đó còn mang đến tốc độ khởi động máy và ứng dụng nhanh chóng với ổ cứng SSD 512 GB.   
& Laptop có kích thước màn hình 15.6 inch cùng tần số quét 144 Hz mang đến những trải nghiệm chiến game cực đỉnh, không bị giật lag hay xé hình khi chơi những tựa game có tốc độ cao.
& Laptop Asus TUF Gaming được bao bọc bởi lớp vỏ nhựa màu đen huyền bí, khối lượng 2.3 kg cho phép bạn chiến game ở mọi không gian.
& Máy được trang bị đèn nền bàn phím chuyển màu RGB độc đáo, tăng độ hăng hái cho game thủ mỗi khi chiến game.', N'lap58_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000059', N'Laptop Asus VivoBook 15X OLED A1503ZA i5 (L1290W) là phiên bản laptop cao cấp - sang trọng không chỉ giải quyết triệt để các tác vụ học tập, văn phòng nhờ sức mạnh bùng nổ đến từ bộ vi xử lý Intel thế hệ 12 mà còn mang đến không gian giải trí trọn vẹn khi sở hữu những thông số màn hình ấn tượng. ', N'Thiết kế thời thượng, tông xanh say đắm
&Sở hữu màn hình 15.6 inch nhưng laptop Asus VivoBook lại được thiết kế một cách khá gọn gàng với khung vỏ nhựa phủ màu xanh thời thượng. Mặc dù được hoàn thiện bằng chất liệu nhựa nhưng máy tỏ ra khá chắc chắn, không bị biến dạng khi mình tác động một lực mạnh vào các khu vực yếu như nắp máy và bàn phím.
&Khối lượng 1.7 kg cùng độ dày 19.9 mm vẫn có thể dễ dàng bỏ vào balo, đồng hành cùng mình trong mỗi tiết học, làm việc trên văn phòng cho đến những giờ chạy deadline ở quán cà phê. Đi kèm theo đó là cảm biến vân tay giúp mình mở khóa khởi động máy an toàn, nhanh chóng chỉ với một chạm. 
Công tắc khóa camera vừa giúp máy tránh được bụi bẩn vừa đảm bảo độ an toàn cho dữ liệu cá nhân. Độ bền chuẩn quân đội MIL STD 810H gia tăng tuổi thọ và độ bền bỉ cho máy, hạn chế tối đa tình trạng hư hỏng khi mình vô tình khiến máy bị va đập.
&Không những thế, em laptop Asus này còn sở hữu bản lề 180 độ giúp mình dễ dàng chia sẻ nội dung với bạn bè, đồng nghiệp mà không cần xoay toàn bộ máy sang phía đối diện tốn thời gian. Bàn phím của máy có đèn nền, bố cục kích thước đầy đủ có cả bàn phím số với hành trình sâu cho mình trải nghiệm tốt, dễ dàng để làm quen.
&Laptop được trang bị khá đầy đủ các cổng kết nối phổ biến nhất hiện nay như USB 2.0, USB 3.2, HDMI, Jack tai nghe 3.5 mm và USB Type-C tương thích với nhiều thiết bị ngoại vi, hỗ trợ mình trong việc truyền xuất dữ liệu hay chia sẻ thông tin một cách dễ dàng.
&Với bộ nhớ RAM 8 GB, VivoBook 15X cho phép chuyển đổi qua lại nhiều ứng dụng cùng lúc, mình vừa mở tệp Excel nặng vừa xem phim song song trên YouTube mà không bị đứng máy. Mình khuyên bạn nên nâng cấp thêm một thanh RAM nữa cho laptop để có trải nghiệm mượt mà hơn, đồng thời cũng “mở khóa" luôn được đồ họa Intel Xe Graphics vốn chỉ hoạt động trên RAM kênh đôi, nhờ đó các chức năng đồ họa cũng như chơi game sẽ được cải thiện, FPS sẽ tăng cao hơn trong mỗi trận đấu.
&Ổ cứng 512 GB SSD chuẩn NVMe PCIe cho mình không gian lưu trữ đủ lớn, linh hoạt hơn theo nhu cầu lưu trữ tài liệu, hình ảnh, file dung lượng lớn,.... Nhờ chuẩn SSD nên việc khởi động máy hay mở ứng dụng cũng đều nhanh chỉ trong vài giây.', N'lap59_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000060', N'Chiêm ngưỡng sự đẳng cấp đến từ laptop Asus ZenBook UX325EA i7 (KG658W) với cấu hình vượt trội cùng diện mạo cao cấp, hứa hẹn mang đến những trải nghiệm độc đáo, đáp ứng mọi nhu cầu sử dụng của người dùng.', N'Mang trên mình lớp vỏ kim loại nguyên khối cứng cáp có gam màu xám chủ đạo và những đường nét sắc sảo trên máy, ZenBook UX325EA sở hữu dáng vẻ sang chảnh của dòng laptop cao cấp. Bề dày 13.9 mm và khối lượng chỉ vỏn vẹn 1.14 kg, cực kỳ phù hợp cho những ai thường xuyên di chuyển nhiều nơi với khả năng linh hoạt ấn tượng.
& Một điểm ấn tượng được trang bị trên trên chiếc laptop Asus ZenBook này là tính năng mở khóa gương mặt hiện đại tích hợp với Camera IR hồng ngoại, cho phép bạn mở máy và truy cập các ứng dụng nhanh chóng bằng chính khuôn mặt của mình dù là trong bóng tối, tiện lợi hơn rất nhiều so với các kiểu mật khẩu truyền thống đồng thời bảo đảm độ an toàn tuyệt đối cho mọi dữ liệu cá nhân của bạn. 
& Laptop Asus sở hữu độ bền đạt tiêu chuẩn quân đội MIL STD 810G cho phép bạn sử dụng máy bền lâu trong khoảng thời gian dài mà không lo hư hỏng do các tình trạng va đập không mong muốn hằng ngày với hàng loạt các bài kiểm tra đánh giá khắt khe từ thả rơi, địa hình, độ rung sốc, độ ẩm, bụi bẩn,... 
& Máy còn đạt chứng nhận tiêu chuẩn nền Intel Evo khi đạt được các tiêu chí ấn tượng như trang bị bộ vi xử lý tối thiểu là Core i5 thế hệ 11 trở lên, phải đạt được 4 giờ sử dụng sau 30 phút sạc, hỗ trợ kết nối Wi-Fi 6 và Thunderbolt 4,... nhằm phục vụ tối ưu mọi nhu cầu học tập và làm việc cho người dùng.
& Tuy gọn nhẹ nhưng chiếc máy tính xách tay này vẫn sở hữu các cổng kết nối hiện đại hiện nay bao gồm 1 cổng USB 3.2, HDMI và đặc biệt là 2 cổng Thunderbolt 4 USB-C với khả năng vừa sạc nhanh vừa truyền dữ liệu, hỗ trợ máy liên kết dễ dàng và nhanh chóng đến các thiết bị ngoại vi tương thích mà không cần đến sự trợ giúp của dây cáp rườm rà, phức tạp.
&Vận hành trơn tru mọi ứng dụng từ nhẹ nhàng như Word, Excel, PowerPoint,... đến các tác vụ nặng hơn như thiết kế đồ họa, chơi game, phục vụ tối ưu mọi nhu cầu làm việc cũng như giải trí nhờ bộ vi xử lý Intel Core i7 Tiger Lake 1165G7 với cấu trúc 4 nhân 8 luồng mạnh mẽ, đạt tốc độ xung nhịp cơ bản 2.80 GHz và ép xung tối đa lên đến 4.7 GHz nhờ công nghệ Turbo Boost. 
& Card đồ họa tích hợp Intel Iris Xe Graphics cải thiện hiệu suất đồ họa vượt trội với trí tuệ AI nhân tạo hiện đại, cho các thao tác chỉnh sửa hình ảnh với kết xuất lên tới 8K, biên tập và dựng video cơ bản trên những phần mềm đồ họa một cách chuyên nghiệp hay thậm chí là thư giãn với các tựa game đình đám có mức cài đặt 1080p 60FPS. 
& Khả năng đa nhiệm mượt mà hơn bao giờ hết nhờ bộ nhớ RAM 16 GB chuẩn LPDDR4X (On board), cho phép bạn làm việc trên hàng loạt cửa sổ trình duyệt được mở cùng lúc hay chuyển động giữa các ứng dụng được suôn sẻ hơn mà không lo tình trạng giật máy, đứng máy nhờ tốc độ Bus RAM lên đến 4267 MHz.', N'lap60_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000061', N'Sở hữu ngoại hình ấn tượng thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus Gaming TUF Dash F15 FX517ZC i5 (HN077W) là lựa chọn xứng tầm cho mọi nhu cầu chiến game giải trí hay đồ hoạ - kỹ thuật của người dùng.', N'Laptop Asus TUF mang hiệu năng vượt trội cho khả năng giải quyết trơn tru các tác vụ phức tạp như thiết kế hình ảnh, render video,... trên các ứng dụng nhà Adobe hay thoả sức chiến các tựa game hot như CS:GO, GTA V,... nhờ trang bị chip Intel Core i5 Alder Lake 12450H cùng card rời NVIDIA RTX 3050, 4 GB.
& RAM 8 GB chuẩn DDR5 tiên tiến, mang đến khả năng đa nhiệm mượt mà. SSD 512 GB hỗ trợ truy xuất dữ liệu nhanh, rút ngắn thời gian chờ. Ngoài ra, máy này cũng hỗ trợ nâng cấp để gia tăng năng suất làm việc của bạn. Màn hình 15.6 inch phủ tấm nền IPS có khả năng tái tạo màu tốt, mở rộng góc nhìn lên đến 178 độ. Công nghệ Anti Glare hỗ trợ chống chói, loá mờ trên màn hình, bảo vệ thị giác người dùng.
& Làm chủ mọi trận game, giảm độ trễ nhờ tần số quét 144 Hz kết hợp công nghệ Adaptive-Sync đồng bộ tốc độ khung hình với card rời RTX 30 series trên laptop Asus giúp loại bỏ những vấn đề như giật, xé hình mang lại cho bạn trải nghiệm giải trí, chơi game ổn định hơn bao giờ hết.
& Được chế tác từ vỏ nhựa cứng cáp đi kèm là sắc xám hiện đại với những đường cắt tinh xảo, khơi nguồn cảm hứng chiến game. Khối lượng chỉ 2 kg sẵn sàng bên cạnh phục vụ bạn mọi lúc, trên mọi chiến trường ảo. HD Webcam hỗ trợ các cuộc gọi video hay học trực tuyến dễ dàng hơn nhờ chất lượng hình ảnh ổn định. Đèn nền đơn sắc cũng được tích hợp trên bàn phím laptop.
& Đạt chuẩn Hi-Res Audio cùng công nghệ âm vòm Dolby Atmos cung cấp âm thanh sống động từ mọi hướng, lấp đầy không gian với độ rõ, chi tiết và chiều sâu đáng kinh ngạc. Truyền tải dữ liệu, kết nối nhanh với các thiết bị ngoại vi nhờ các cổng giao tiếp: USB 3.2 Gen 2 Type-C, 2 x USB 3.2, HDMI, LAN (RJ45), Thunderbolt 4.', N'lap61_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000062', N'Laptop LG gram 2022 i7 1260P (17Z90Q-G.AX78A5) sẽ là một siêu phẩm laptop cao cấp - sang trọng đáng để bạn sở hữu bởi ngoại hình mỏng nhẹ, thời thượng cùng hiệu năng vượt bậc từ con chip Intel Gen 12, hứa hẹn mang đến những trải nghiệm làm việc và giải trí trọn vẹn nhất cho người dùng là sinh viên, nhân viên hay doanh nhân.', N'Sự xuất hiện của con chip Intel Core i7 1260P cùng card đồ họa Intel Iris Xe Graphics đã mang đến cho chiếc laptop LG này hiệu năng xử lý vượt trội không chỉ những tác vụ học tập, văn phòng cơ bản mà còn đáp ứng tốt những công việc liên quan đến chỉnh ảnh, thiết kế trên Canva, Lightroom, Photoshop,...  
& Laptop RAM 16 GB cho phép người dùng làm việc cùng lúc trên nhiều cửa sổ ứng dụng khác nhau nhưng vẫn đảm bảo chuyển động mượt mà, hạn chế giật lag. Ổ cứng SSD 1 TB cùng khe cắm SSD M.2 PCIe mở rộng mang đến không gian lưu trữ thoải mái, bên cạnh đó gia tăng tốc độ mở máy và truy cập các ứng dụng nhanh hơn chỉ trong vài giây.
& Chinh phục mọi ánh nhìn của những người xung quanh nhờ lớp vỏ kim loại sang trọng, thời thượng, cùng với đó là khối lượng 1.435 kg cho độ linh hoạt cao giúp bạn dễ dàng mang máy theo bên mình mà không lo cồng kềnh, nặng nhọc.   
& Camera IR hồng ngoại kết hợp với tính năng mở khóa khuôn mặt cho phép người dùng mở máy nhanh hơn so với các kiểu nhập mật khẩu thông thường, hạn chế tối đa việc bị mất dữ liệu cá nhân. Gia tăng độ bền bỉ, hạn chế trầy xước máy do các va đập không mong muốn hằng ngày nhờ độ bền chuẩn quân đội MIL STD 810G. Laptop có đèn bàn phím giúp bạn làm việc trong môi trường thiếu sáng tốt hơn.   
& Các cổng kết nối như USB 3.2, Jack tai nghe, USB Type C, khe Micro SD và HDMI được trang bị trên laptop vừa mang đến sự tối giản, đẹp mắt cho máy vừa hỗ trợ truyền tải và kết xuất dữ liệu được nhanh chóng hơn. Kích thước màn hình 17 inch cùng tấm nền IPS giúp bạn quan sát bao quát toàn bộ nội dung được hiển thị trên máy mà không lo bỏ lỡ chi tiết nào. Độ phân giải WQXGA (2560 x 1600) cho các gam màu sắc được tươi tắn, rõ nét hơn.
& Làm việc hay học tập tốt hơn dù ở môi trường có cường độ ánh sáng cao nhờ độ sáng 350 nits, độ phủ màu 99% DCI-P3 tái tạo không gian màu sống động, có chiều sâu, giúp bạn hòa mình vào những thước phim bom tấn kịch tính. 
& Công nghệ âm thanh High Definition (HD) kết hợp với DTS X:Ultra mang đến chất lượng âm thanh to rõ, độ khuếch đại lớn, các thanh âm trầm bổng được hiển thị rõ ràng, chân thực, cho những phút giây giải trí trọn vẹn nhất.', N'lap62_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000063', N'Laptop LG gram 2022 i7 1260P (16Z90Q-G.AH78A5) là một tân binh laptop cao cấp - sang trọng được nhà LG cho ra mắt nhằm hỗ trợ tối đa các tác vụ hằng ngày từ cơ bản đến nâng cao của sinh viên, nhân viên hay các doanh nhân kỹ tính khi sở hữu thiết kế sang trọng cùng hiệu năng vượt trội. ', N'Không chỉ đáp ứng tốt các tác vụ học tập, văn phòng thường ngày mà còn cân luôn những công việc thiết kế đồ họa trên Lightroom, Photoshop, Illustrator,... một cách chuyên nghiệp nhờ sự kết hợp của bộ vi xử lý Intel Core i7 1260P cùng card đồ họa Intel Iris Xe Graphics.
& Laptop RAM 16 GB chuẩn LPDDR5 cho khả năng đa nhiệm mạnh mẽ hay mở cùng lúc nhiều cửa sổ ứng dụng khác nhau nhưng vẫn hạn chế tối đa hiện tượng giật lag. Không gian lưu trữ rộng rãi để người dùng tải các tệp tài liệu hay những tập phim yêu thích nhờ ổ cứng 1 TB SSD.
& Không gian hiển thị rộng rãi cho phép người dùng quan sát bao quát toàn bộ khung hình nhờ kích thước lớn 16 inch kết hợp tấm nền IPS, cùng với đó là độ phân giải WQXGA (2560 x 1600) và 99% DCI-P3 cho các mảng màu sắc có chiều sâu, giúp những khung ảnh trở nên sống động hơn.
& Tự tin khi sử dụng máy ở nhiều điều kiện ánh sáng khác nhau nhưng vẫn nhìn rõ nội dung được hiển thị trên màn hình nhờ độ sáng 350 nits, chuyển động khung ảnh tương đối mượt mà nhờ tần số quét 60 Hz.    
& Sự cộng hưởng giữa 2 công nghệ âm thanh High Definition (HD) và DTS X:Ultra đắm chìm người dùng vào những trải nghiệm giải trí như nghe nhạc, xem phim,... một cách trọn vẹn nhờ chất lượng âm thanh chân thực cùng độ khuếch tán cao.
& Laptop LG được bao bọc bởi lớp vỏ kim loại màu xám cùng cân nặng 1.285 kg mang đến vẻ ngoài sang trọng, thời thượng cùng độ linh hoạt cực cao sẵn sàng đồng hành cùng bạn trên mọi chuyến công tác xa.  
& Mở khóa hay khởi động máy nhanh chóng hơn bằng chính gương mặt của mình dù trong điều kiện thiếu sáng nhờ tính năng mở khóa khuôn mặt kết hợp camera IR hồng ngoại tân tiến, đồng thời gia tăng thêm độ bảo mật cho máy. 
& Độ bền bỉ của máy được gia tăng hơn đáng kể nhờ laptop LG Gram đạt độ bền chuẩn quân đội MIL STD 810G, hạn chế tối đa việc hư hỏng máy do tác động của các va đập không mong muốn hằng ngày.  
& Dọc hai bên laptop là các cổng kết nối thông dụng như USB 3.2, Jack tai nghe 3.5 mm, USB Type C (có USB PD, cổng hiển thị, Thunderbolt 4), HDMI và khe Micro SD cho khả năng truyền xuất dữ liệu đến các thiết bị ngoại vi khác nhanh chóng hơn.
& Laptop có đèn bàn phím hỗ trợ tối đa cho người dùng làm việc tốt hơn trong bóng tối. Hệ điều hành Windows 11 Home SL thiết kế giao diện đẹp mắt, cho các thao tác sử dụng được dễ dàng hơn.', N'lap63lg_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000064', N'Laptop LG gram 2022 i7 1260P (16Z90Q-G.AH76A5) là thế hệ laptop cao cấp - sang trọng mới được LG cho ra mắt với lối thiết kế hiện đại cùng hiệu năng mạnh mẽ, xứng danh trợ thủ đắc lực cho mọi đối tượng người dùng.', N'Laptop LG gram 16 thách thức mọi định luật về trọng lực nhờ vào khối lượng nhẹ đến không thể tin được, đánh lừa thị giác ngay từ lần đầu tiên mình lấy máy ra khỏi hộp đựng với cảm giác cầm nắm thực sự nhẹ, như chỉ có một chiếc khung không chứa linh kiện bên trong.
&Bằng cách sử dụng hợp kim ma-giê - loại vật liệu thường được sử dụng trong ngành hàng không mà con số cân nặng của máy chỉ vỏn vẹn ở mức 1.285 kg.
&Không chỉ có khối lượng siêu nhẹ mà các kỹ sư thiết kế của LG còn nỗ lực tạo ra một thiết bị đáp ứng đủ các tiêu chuẩn độ bền chuẩn quân đội MIL STD 810G, có thể hoạt động bền bỉ và chống chịu được những va đập hay các yếu tố khắc nghiệt từ môi trường. Do đó mang đến một chiếc laptop có độ bền cao, đáp ứng hoàn hảo cho nhu cầu di chuyển, đặc biệt là đối tượng người dùng doanh nhân.
&Khi mở nắp máy lên, chúng ta có một màn hình tràn viền đúng nghĩa với viền ở tất cả các cạnh đều được làm cực kỳ mỏng nhưng LG vẫn tích hợp được một Webcam Full HD cùng cảm biến Camera IR trên khu vực viền trên của màn hình, cho phép mình thực hiện các cuộc họp trực tuyến với chất lượng hình ảnh sắc nét, đồng thời sử dụng chính khuôn mặt của mình để mở khóa nhanh thiết bị từ màn hình khóa.
& Dù có thân máy mỏng 16.8 mm nhưng LG gram 16 vẫn sở hữu đầy đủ những cổng kết nối mà một người dùng doanh nhân cần đến như: HDMI, Jack tai nghe 3.5 mm, USB 3.2 và USB Type C (có USB PD, cổng hiển thị, Thunderbolt 4). Đặc biệt là cổng HDMI giúp xuất nhanh nội dung lên máy chiếu, rất tiện lợi khi cần báo cáo những số liệu trong các cuộc họp.
&Với kích thước lớn 16 inch, mình không có gì ngạc nhiên khi LG thiết kế bàn phím kích thước đầy đủ, có cả cụm phím số để mình nhập liệu số liệu nhanh chóng hơn và đặc biệt hữu ích cho những bạn nào làm về ngành tài chính hay ngân hàng. Phím bấm có độ nảy cao, hành trình tương đối sâu, khoảng cách giữa các phím hợp lý và hỗ trợ cả đèn nền để mình làm việc về đêm.
&Bàn di chuột có kích thước lớn, thoải mái thao tác và di vuốt kể cả những bạn nam có bàn tay to. Khi sử dụng thông thường mình cũng ít khi phải dùng đến chuột rời, chỉ cần xách chiếc máy ra quán cà phê làm việc mà không cần đem thêm bất kỳ một phụ kiện rườm rà nào khác.', N'lap64lg_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000065', N'Laptop LG gram 2022 i7 1260P (14Z90Q-G.AH75A5) xứng danh một chiếc laptop cao cấp - sang trọng khi có ngoại hình mỏng nhẹ thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ hỗ trợ bạn hoàn thành mọi tác vụ công việc.', N'Mang trong mình bộ vi xử lý Intel Core i7 1260P với hiệu năng mạnh mẽ hơn đến 40% so với thế hệ trước cùng card đồ họa tích hợp Intel Iris Xe hỗ trợ bạn xử lý mọi tác vụ công việc từ nhẹ đến nặng, giải trí và chơi game cũng đều thoải mái không bị giới hạn.
& Laptop RAM 16 GB chuẩn LPDDR5 thế hệ mới chạy Dual Channel, tối ưu mang đến tốc độ xử lý cao, tăng khả năng đa nhiệm và hiệu quả công việc. Không gian ổ cứng 512 GB cho phép bạn lưu nhiều tài liệu quan trọng với tốc độ truy xuất vượt trội, hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng để bạn thỏa thích lưu trữ.
& Laptop được cài đặt sẵn hệ điều hành Windows 11 với giao diện hiện đại, tối ưu để mang đến sự linh hoạt khi sử dụng, đồng thời cải thiện hiệu suất, tạo cho bạn không gian làm việc thuận lợi nhất.
& Làm việc và giải trí thêm thú vị với màn hình 14 inch độ phân giải WUXGA (1920 x 1200) có khả năng hiển thị siêu sắc nét với màu sắc chân thực, sống động. Tỷ lệ khung hình 16:10 lớn hơn 11% so với tỷ lệ 16:9 mang đến không gian rộng lớn để bạn làm việc thêm thoải mái.
& Không gian màu đạt 99% DCI-P3 không chỉ nâng cao trải nghiệm xem với những hình ảnh rực rỡ mà còn thỏa mãn luôn được niềm đam mê sáng tạo, thiết kế của bạn. Tấm nền IPS nâng góc nhìn lên 178 độ cùng độ sáng 350 nits đảm bảo hiển thị rõ nét kể cả khi bạn làm việc ở ngoài trời. 
& Giải trí đầy mãn nhãn nhờ công nghệ High Definition (HD) Audio mang đến chất âm to rõ, chân thực và mạnh mẽ, đi kèm công nghệ DTS X:Ultra Audio cho hiệu ứng 3D siêu thực khi bạn chơi game hoặc xem phim.
& Ngoại hình đẹp mắt, linh hoạt với thiết kế vỏ kim loại siêu mỏng, gọn và nhẹ với khối lượng chỉ 0.999 kg cùng độ dày 16.8 mm, hỗ trợ bạn làm việc hay giải trí ở bất kỳ nơi đâu. Bàn phím hỗ trợ đèn nền mang đến sự tiện lợi khi bạn làm việc khi về đêm. An tâm hơn khi sử dụng với độ bền chuẩn quân đội MIL STD 810G có thể chịu được áp suất thấp, sốc vận chuyển, nhiệt độ cao,...
& Mở khóa nhanh chóng hơn so với các kiểu nhập mật khẩu thông thường đồng thời đảm bảo độ an toàn cho dữ liệu cá nhân nhờ tính năng mở khóa khuôn mặt kết hợp với Camera IR hồng ngoại. 
& Cổng USB 3.2, Jack tai nghe 3.5 mm, 2 x USB Type C (có USB PD, cổng hiển thị, Thunderbolt 4) và HDMI không chỉ cho phép bạn kết nối với các thiết bị ngoại vi thông thường mà còn có thể xuất hình ảnh lên màn hình 5K đầy sắc nét.', N'lap65lg_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000066', N'Sở hữu một vẻ ngoài độc đáo, mạnh mẽ phù hợp với mọi game thủ, chiếc laptop MSI Gaming GF63 Thin 11UD i7 11800H (648VN) được trang bị dòng chip Intel thế hệ 11 hiệu năng mạnh mẽ vượt trội khi đi cùng card rời RTX 30 series sẵn sàng chiến mượt bất kì tựa game phổ biến hay thiết kế đồ họa chuyên sâu.', N'Sở hữu CPU Intel Core i7 11800H kết hợp cùng card màn hình NVIDIA RTX 3050Ti Max-Q 4 GB mang lại trải nghiệm giải trí cực đã với các tựa game đình đám như GTA V, CS:GO, FIFA,... Bên cạnh đó khả năng xử lý đồ họa chuyên sâu cũng sẽ là lợi thế của dòng card RTX này.
& Laptop MSI được trang bị bộ nhớ SSD 512 GB kết hợp RAM 8 GB cho khả năng lưu trữ dữ liệu đủ dùng, tốc độ truy xuất dữ liệu, ghi chép dữ liệu cũng như khởi động máy nhanh chóng.
& Chiếc laptop MSI GF được trang bị màn hình 15.6 inch có độ phủ màu 100% sRGB kết hợp tấm nền IPS mang lại chất lượng hình ảnh sắc nét, sống động cùng góc nhìn rộng lên đến 178 độ. Tính năng được tích hợp đi kèm là chống chói Anti-Glare giúp bảo vệ mắt của bạn sau một thời gian dài sử dụng.
& Diện mạo đậm chất laptop gaming được hoàn thiện từ lớp vỏ kim loại bền bỉ, khối lượng chỉ 1.86 kg và dày 21.7 mm dễ dàng đồng hành cùng bạn trong mọi không gian chiến game.
& Đa dạng cổng kết nối giúp bạn dễ dàng kết nối với các thiết bị ngoại vi mọi lúc như: 3 x Type-A USB 3.2 Gen 1, HDMI, LAN (RJ45), USB Type-C.
& Công nghệ Realtek High Definition Audio trên laptop cung cấp chất lượng âm thanh ổn định, ngoài ra còn có tính năng khuếch đại khi xem phim, nghe nhạc, giải trí, tăng sự phấn khích khi chiến game.', N'lap66msi_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000067', N'Laptop MSI Modern 14 B11SBU i5 (669VN) mang lối thiết kế thời thượng, hiện đại cùng những thông số kỹ thuật ổn định, sẽ là một trong những sự lựa chọn xứng đáng dành cho bạn, hứa hẹn đáp ứng tốt nhu cầu học tập, làm việc hàng ngày. ', N'Laptop MSI Modern sang trọng, gây sức hút cho chủ sở hữu khi được hoàn thiện từ chất liệu kim loại bền chắc, phủ sắc đen hiện đại, phù hợp với đa dạng đối tượng người dùng bất kể là phái mạnh hay phái đẹp.
& Máy có khối lượng ấn tượng chỉ nhẹ 1.3 kg và mỏng 16.9 mm tối ưu tính linh động cho máy, giúp bạn tiện lợi di chuyển máy linh hoạt mọi lúc đến trường học, văn phòng, công tác xa, quán cà phê,... đều dễ dàng, không lo nặng nhọc.
& Bàn phím chế tác đẹp mắt, thẩm mỹ, hành trình phím sâu, nút bấm êm, độ nảy tốt tạo cảm giác thoải mái, êm tay khi nhập liệu, soạn thảo, tăng khả năng gõ nhanh và chính xác từng mặt chữ. Bên cạnh đó, laptop MSI còn tích hợp đèn nền đơn sắc cho bạn tiện sử dụng ở môi trường thiếu sáng. 
& Tiện lợi hơn với thiết kế bản lề 180 độ, bạn có thể thoải mái sử dụng nhiều tư thế mà bạn muốn và dễ dàng chia sẻ dữ liệu, thông tin với mọi người xung quanh.
& Dọc hai thân laptop là dãy cổng kết nối: USB Type-C, 2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm và khe thẻ Micro SD hỗ trợ liên kết dễ dàng, chia sẻ thông tin nhanh chóng chuẩn xác đến các thiết bị ngoại vi tương thích như loa, chuột, máy in,... 
& Chiếc laptop MSI này sở hữu con chip Intel Core i5 Tiger Lake 1155G7 cấu trúc 4 nhân 8 luồng, khả năng xử lý tốt các tác vụ học tập, văn phòng cơ bản thông qua các công cụ Word, Excel, PowerPoint, Note,... đến thiết kế đồ họa đơn giản cũng như xem phim chơi game giải trí nhẹ nhàng với tốc độ xung nhịp trung bình 2.50 GHz, đạt tối đa Turbo Boost 4.5 GHz.
& Laptop RAM 8 GB chuẩn DDR4 1 khe tốc độ Bus RAM 3200 MHz đa nhiệm mượt mà nhiều tác vụ cùng lúc, tăng cao năng suất công việc khi bạn vừa sử dụng phần mềm tin học vừa tra cứu thông tin trên trình duyệt web và nghe nhạc thư giãn mà không có hiện tượng giật lag, đứng máy. Bên cạnh đó còn hỗ trợ nâng cấp tối đa 32 GB khi bạn có nhu cầu.', N'lap67msi_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000068', N'Bạn cần chiếc máy chơi game ngon, cấu hình ổn để làm việc, học tập, laptop MSI Gaming Bravo 15 B5DD R5 (279VN) với thiết kế hầm hố, hiệu năng mạnh mẽ của chip AMD sẵn sàng cùng bạn chinh phục mọi đấu trường ảo.', N'Laptop MSI mang trong mình CPU AMD Ryzen 5 5600H mạnh mẽ kết hợp cùng card màn hình rời AMD Radeon RX 5500M 4 GB. Mình đã thực hiện đánh giá cấu hình máy thông qua phần mềm Cinebench R23, số điểm đơn nhân, đa nhân lần lượt là 1358 và 8888 điểm. Với kết quả đo được, mình nghĩ chiếc máy có thể đáp ứng tốt nhu cầu chơi ổn định các tựa game hiện hành như: GTA V, LOL, CS:GO,...
& Đến với card đồ họa AMD RX 5500M, theo dữ liệu mình có thu thập được, card đồ họa này là đối thủ xứng tầm với card đồ hoạ đến từ nhà NVIDIA đó là GTX 1650 Ti. Điểm khác biệt mình có thể thấy là RX 5500M được sản xuất trên tiến trình 7 nm từ đó sẽ tiết kiệm điện năng khi sử dụng. Bên cạnh đó, tốc độ xung RX 5500M cũng nhỉnh hơn một xíu so với GTX 1650 Ti là 1645 MHz, nhờ vậy khả năng chơi game, làm việc 3D cũng sẽ tối ưu hơn.
& Trên lý thuyết là như vậy, còn chơi game thực tế sẽ ra sao? Mình đã trải nghiệm chơi thử tựa game Liên Minh Huyền Thoại, tốc độ khung hình ổn định khoảng 170 FPS. Lúc chơi mình không gặp tình trạng bị giật, đứng hình khi tung chiêu. Các thao tác mượt mà chuẩn xác trên từng phát bấm.
& Sau đó, mình đã chơi thử tựa game CS:GO. Đến với tựa game bắn súng này, mình nhận thấy laptop MSI Bravo đã hoạt động nhiều hơn. Để ổn định từng phát bắn, chơi game trơn tru thì hệ thống tản nhiệt đã làm việc năng suất hơn, mình nghe được tiếng quạt tản nhiệt bắt đầu chạy, phần thân máy gần bản lề sẽ hơi ấm lên một xíu.
& Tuy nhiên, với một tựa game đòi hỏi cấu hình cao hơn nên nhiệt độ máy hơi ấm lên là điều bình thường với mình, không ảnh hưởng đến trải nghiệm sử dụng.
& Laptop AMD Ryzen 5 được trang bị RAM 8 GB (1 khe 8 GB + 1 khe rời) hỗ trợ nâng cấp lên đến 64 GB. Sau thời gian sử dụng, khả năng đa nhiệm mình thấy khá ổn với mình vì đáp ứng tốt các công việc hằng ngày như soạn thảo văn bản, học online, chơi game, nghe nhạc,...
& Tuy nhiên, để bạn có một trải nghiệm chơi game sướng hơn, mình khuyến khích các bạn nên nâng cấp RAM để hiệu năng được chạy hết mức cũng như phục vụ cho nhu cầu làm thiết kế chỉnh sửa ảnh 3D được ổn định hơn.', N'lap68msi_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000069', N'Laptop MSI Gaming Pulse GL66 11UDK i7 (816VN) xuất hiện với một diện mạo ấn tượng cùng CPU Intel dòng H và card rời RTX 30 series, sẵn sàng cùng mình chinh phục những tựa game hấp dẫn hay hoàn thành công việc với hiệu suất cao hơn.', N'Mang trong mình sức mạnh từ bộ vi xử lý Intel Core i7 Tiger Lake 11800H mạnh mẽ cùng card đồ họa rời NVIDIA GeForce RTX 3050Ti 4 GB mang đến hiệu suất cao và nhanh hơn, hỗ trợ mình xử lý mọi tác vụ từ các phần mềm render đồ họa cho đến chiến những tựa game máu lửa. 
& Nhờ có hệ thống tản nhiệt Cooler Boost 5 được laptop MSI thiết kế cụm tản nhiệt riêng cho CPU và GPU, bao gồm 6 ống dẫn nhiệt và 2 quạt tăng kích thước đường kính kết hợp keo tản nhiệt độc quyền nên trong quá trình chơi máy không hề bị nóng lên quá cao, nhưng quạt tản nhiệt lại kêu hơi ồn, bạn nên cân nhắc tinh chỉnh mức độ quạt khi sử dụng ở những nơi công cộng như quán cà phê hay thư viện.
&Laptop RAM 16 GB chuẩn DDR4 2 khe đáp ứng tốt nhu cầu sử dụng thường ngày của mình khi có thể vừa chơi game nặng vừa nghe nhạc Remix trên YouTube hoặc Spotify mà không hề bị giật lag. Máy còn có khả năng nâng cấp đến 64 GB RAM nên sẽ hỗ trợ mình thực hiện đa tác vụ từ công việc đến giải trí khi cần phải chạy những ứng dụng nặng phục vụ cho việc học tập của mình.
&Ổ cứng 512 GB SSD chuẩn NVMe PCIe có thể tháo lắp thanh khác tối đa 2 TB, giúp mình linh hoạt hơn theo nhu cầu lưu trữ tài liệu, hình ảnh, file dung lượng lớn,... Ngoài ra thì SSD còn có khả năng giúp khởi động máy hay mở ứng dụng đều cực nhanh chỉ trong vài giây.
&Ý tưởng thiết kế laptop MSI Gaming GL66 được lấy cảm hứng từ những bộ phim khoa học viễn tưởng, lớp vỏ kim loại màu đen huyền bí được bao bọc bằng đường viền góc cạnh tinh tế và mặt đáy lục giác tạo nên sự khác biệt, ghi điểm trong mắt mình bởi sự hầm hố nam tính.
&Với khối lượng 2.25 kg và dày 23.95 mm thì có thể nói cũng khá gọn gàng đối với một chiếc laptop gaming và có thể đồng hành cùng mình đến nhiều nơi, giải quyết công việc hay tham gia các cuộc chiến game khi có nhu cầu.
&Đèn nền bàn phím đổi màu RGB tạo nên phong cách khác biệt cũng như thể hiện cá tính riêng khi có thể tùy chỉnh trong phần mềm MSI Center, sự cộng hưởng của màu sắc cũng sẽ góp phần giúp mình nổi bật hoặc tăng cảm hứng sáng tạo. Mình hơi tiếc một chút khi đèn LED RGB chỉ để được một màu toàn bàn phím mà không thể chỉnh các chế độ như Rainbow (cầu vồng) nên sẽ hơi nhàm chán khi chơi game trong thời gian dài.
&Laptop được trang bị khá đầy đủ các cổng kết nối phổ biến nhất hiện nay như 2 cổng USB 3.2, HDMI, LAN (RJ45), USB 2.0 và USB Type-C tương thích với nhiều thiết bị ngoại vi, hỗ trợ cho mình trong việc truyền xuất dữ liệu hay chia sẻ thông tin dễ dàng.', N'lap69msi_ts.jpg')
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
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000048', N'Bút cảm ứng Apple Pencil 1 MK0C2 với kiểu dáng như một chiếc bút thông thường nhưng lại nổi bật với màu trắng sang trọng. ', N'Thân bút thon dài, trọng lượng chỉ khoảng 20.7 g mang lại cho người dùng cảm giác thoải mái khi sử dụng, cầm rất vừa tay. Điểm ấn tượng nhất của chiếc bút cảm ứng Apple này là cảm ứng lực nhấn cực nhạy. Bạn có thể tùy ý phác họa các nét đậm, nhạy, dày hoặc thanh mảnh giống như dùng một chiếc bút chì trên giấy thông thường. Lực đạo tùy chỉnh của bút phụ thuộc vào độ mạnh nhẹ ở lực tay của bạn.
& Bạn có thể sạc pin cho bút thông qua cổng lightning nằm ở phần đuôi bút và có nắp đậy. Bên cạnh đó, còn hỗ trợ sạc nhanh, chỉ 15 giây sạc cho 30 phút sử dụng. Việc này giúp ích rất nhiều khi bạn đang có việc gấp cần dùng.
& Cập nhật vào tháng 12/2021: Apple Pen 1 tương thích với các dòng iPad bao gồm iPad Pro 12.9 inch (Gen 1,2), iPad Pro 10.5 inch, iPad Pro 9.7 inch, iPad Air (Gen 3), iPad (Gen 6,7,8,9), iPad mini 5.
& Bút cảm ứng Apple Pencil 1 MK0C2 là một phụ kiện thông minh được thiết kế để dành riêng cho iPad với nhiều tính năng vượt trội, nó chắc chắn sẽ mang đến nhiều trải nghiệm tuyệt vời hơn cho các tín đồ của Apple.', N'pk48_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000049', N'Thiết kế tai nghe AirPods Pro 2 gọn nhẹ, kiểu dáng hiện đại', N'Về phần thiết kế, nhà Apple vẫn giữ nguyên kiểu dáng quen thuộc của những phiên bản tiền nhiệm trước đó như: Thiết kế gọn nhẹ, đường bo góc tinh tế, gam màu trắng trang nhã bao bọc trọn vẹn tai nghe và hộp sạc.
& Ở phiên bản này, hộp sạc được trang bị thêm phần khoen để móc dây treo tiện lợi. Nhờ đó, bạn có thể dễ dàng treo vào balo và mang đi bất kỳ đâu mà không cần dùng tới túi đựng AirPods chuyên dụng.  Loa tích hợp trên hộp sạc có thể phát âm thanh giúp bạn dễ dàng xác định vị trí khi vô tình đánh rơi và phát ra âm cảnh báo khi pin yếu hoặc quá trình ghép nối hoàn tất.
& Ngoài ra, trong mỗi hộp tai nghe Apple này sẽ có bốn cặp đệm tai với các kích cỡ XS, S, M, L cho người dùng thoải mái lựa chọn đệm tai phù hợp. Đệm tai làm từ chất liệu silicone cao cấp cũng sẽ cho bạn cảm giác mềm mại, vừa vặn khi đeo.
& AirPods Pro 2 được tích hợp con chip Apple H2 có thể mang lại dải âm rõ ràng, chi tiết với khả năng hiển thị từng nốt cao và âm bass sâu một cách đầy đủ. Mọi âm thanh thông qua Airpods Pro 2 đều sống động hơn bao giờ hết. Ngoài ra, Chip Apple H2 còn mang đến khả năng khử tiếng ồn thông minh và giúp kéo dài tuổi thọ pin ấn tượng.
& Tính năng Adaptive EQ có thể dễ dàng điều chỉnh sao cho phù hợp với từng bản nhạc bạn đang nghe nhằm cá nhân hóa trải nghiệm nghe nhạc của bạn. Micro tích hợp sẵn với các thuật toán nâng cao cho phép tai nghe tự động nhận biết và thu nhận giọng nói tốt hơn.
& Công nghệ kết nối không dây Bluetooth 5.3 không chỉ cho kết nối ổn định, mượt mà trong khoảng cách lên tới 10 m mà còn giúp thiết bị tiết kiệm pin đáng kể nhờ khả năng tiêu thụ năng lượng thấp, từ đó, giúp thời gian sử dụng thiết bị lâu hơn.', N'pk49_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000050', N'Tai nghe Bluetooth AirPods 2 Apple MV7N2 - được mệnh danh là một chiếc AirPods huyền thoại quốc dân rất được lòng của các fan nhà táo. Sau thành công vang dội của AirPods đời đầu thì phiên bản đời thứ 2 này của nhà Apple có gì cải tiến để có thể vượt qua người tiền nhiệm và cho tới thời điểm hiện tại vẫn còn nhận được nhiều sự ưa chuộng với các bạn trẻ đến vậy?', N'Đầu tiên, nhắc đến điểm cải tiến đáng "ăn tiền" nhất trên chiếc tai nghe này chính là AirPods 2 được tích hợp chip xử lý H1 thế hệ mới cho thời gian chuyển đổi kết nối giữa các thiết bị nhanh hơn gấp 2 lần so với phiên bản cũ.
& Đồng thời, trang bị công nghệ Bluetooth 5.0 cho kết nối nhanh chóng, ổn định, độ trễ ít, AirPods 2 cho tốc độ kết nối tới cuộc gọi thoại nhanh gấp 1.5 lần so với bình thường, giảm độ trễ âm thanh khi gọi thoại, chơi game,…Với khả năng cho tốc độ kết nối nhanh và đáp ứng độ trễ âm thanh tốt thì AirPods 2 vẫn là một ứng cử viên sáng giá cho những bạn chuộng hệ sinh thái nhà Apple.
& Tiếp theo, một trong những lý do khiến nhiều người dùng vẫn luôn “săn đón" chiếc tai nghe này là khả năng đàm thoại với mic khử tiếng ồn tốt, đem đến một chất âm sạch, trong trẻo dễ nghe.
& Mình đã thử sử dụng tai nghe trong phòng máy lạnh (loại máy lạnh công nghiệp). Tất nhiên, như những gì đã đề cập ở trên, AirPods 2 thu âm tiếng cực kỳ trong và rõ, không bị trộn tạp âm hay tiếng ồn phà phà hơi gió của máy lạnh vào micro, rất phù hợp cho những bạn thường xuyên phải sử dụng tai nghe để họp hay làm việc trực tuyến khi ở trong môi trường có nhiều người. Đây là một ưu điểm rất lớn mà cho dù đã ra mắt khá lâu nhưng về chất lượng sản phẩm mà hãng Apple đem lại thì luôn làm hài lòng người dùng.
& Đối với những bạn sử dụng điện thoại Android, chiếc tai nghe này vẫn có khả năng kết nối đầy đủ và sử dụng bình thường. Tuy nhiên, tốc độ kết nối sẽ bị chậm và tai nghe cũng sẽ không hoạt động hết tối đa công suất của nó, tất nhiên đây vẫn là sự ưu tiên đến từ mục đích “những sản phẩm trong hệ sinh thái độc quyền của nhà Apple”. 
AirPods 2 giữ nguyên thiết kế của người tiền nhiệm, vẫn là vỏ hộp đựng bo tròn được làm bằng nhựa trơn bóng, kết hợp là bản lề đóng mở nắp hộp mang lại sự hoàn thiện cao, 2 tay hay 1 tay sử dụng đóng mở nắp hộp vẫn rất tiện lợi, cho cảm giác cầm nắm gọn trong lòng bàn tay và dễ dàng bỏ vào túi quần, túi áo, balo, túi xách để mang theo sử dụng mọi lúc.
& Ở phần đèn LED và nút bấm, giống như thế hệ “đàn anh" vị trí đèn LED vẫn nằm ở trong hộp, nút bấm vẫn nằm ở vị trí cũ là phía sau hộp, khi bấm nút nhận diện kết nối thì đèn có màu trắng. Ở tình trạng gần hết pin, đèn sẽ chuyển báo hiệu cho bạn thấy màu cam và khi được sạc đầy thì lại hiển thị về màu xanh. 
& Về thiết kế tai nghe dù không thay đổi gì nhiều, nhưng tai nghe Apple lại mang đến sự trải nghiệm thoải mái bậc nhất trên thị trường tai nghe không dây. Tai nghe nhỏ nhưng khó rơi, vừa vặn và không gây khó chịu hay bị bí tai khi đeo thời gian dài.
& “Housing tai nghe” này cũng là một điểm “đáng tiền” vì phần lớn ở giai đoạn những năm trước đây, các hãng đều cho ra mắt các loại tai nghe in-ears và có một khoảng người dùng không thích kiểu tai nghe nhét này, mình cũng nằm trong số đó. Apple vào thời điểm đó đem tới đúng cái người dùng cần là dạng form tai nghe earbuds, nên đó là lý do vì sao hệ sản phẩm của họ vẫn luôn “on top” về mặt “đáng mua” và “đáng dùng”. ', N'pk50_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000051', N'Thiết kế cao cấp, đeo vừa vặn với nút tai silicone', N'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3 trắng được chế tác với vẻ ngoài tinh giản, gam màu trắng trẻ trung, sáng đẹp, phối hợp tuyệt vời với mọi trang phục từ đời thường đến công sở, dự tiệc của bạn. 
& Kích thước housing nhỏ nhắn đi kèm 3 kích cỡ nút tai mềm mại khác nhau cho bạn dễ dàng lựa chọn để đảm bảo đeo tai nghe dạng in-ear thoải mái, bám chặt vào khổ tai và hỗ trợ loại bỏ tiếng ồn tối ưu. Mặt khác, hộp sạc có dạng hình chữ nhật đặt tai nghe kiểu đứng gọn gàng, an toàn với bản lề thiết kế vừa khít.
&Chip H1 do Apple thiết kế giảm độ trễ âm thanh xuống thấp, xử lý âm thanh kỹ thuật số tinh vi cho các dải âm tinh khiết, âm trầm mạnh mẽ. Adaptive EQ tự động điều chỉnh dải tần số thấp và trung để bài hát bạn đang thưởng thức tương thích cho cấu tạo tai của bạn, mang đến trải nghiệm nhất quán, phong phú hơn.
&Tai nghe Bluetooth Apple có khả năng tương thích cao với các thiết bị hoạt động trên hệ điều hành iOS (iPhone), iPadOS (iPad), MacOS (Macbook, iMac), với sức mạnh của con chip H1 kết hợp chuẩn Bluetooth 5.0 cung cấp kết nối cực mượt trong phạm vi đến 10 m đồng thời giúp giảm tiêu thụ năng lượng đáng kể.
&- Chống ồn chủ động (Active Noise Cancellation): Tai nghe sẽ loại bỏ âm thanh môi trường bằng cách sử dụng 2 micro, 1 micro hướng ra ngoài và 1 micro hướng vào trong, để tạo hiệu ứng khử tiếng ồn. Nhờ đó đôi tai bạn không bị xao nhãng bởi các tạp âm xung quanh, cho bạn chìm đắm vào thế giới âm nhạc của riêng mình hoặc thực hiện cuộc gọi quan trọng tập trung hơn.
&- Xuyên âm (Transparency mode): Ở chế độ này, AirPods Pro cho phép âm thanh bên ngoài lọt vào tai bạn, tạo sự kết nối với môi trường xung quanh nhanh chóng, micro hướng ra ngoài và hướng vào trong hoàn tác hiệu ứng cách ly âm thanh của các nút tai silicone để bạn nghe thấy mọi thứ một cách tự nhiên. Hỗ trợ Conversation Boost tập trung AirPods Pro vào người đang nói chuyện trực tiếp trước mặt bạn để bạn nghe rõ họ nói gì ngay cả khi xung quanh rất ồn ào.
&Cụ thể hơn, tai nghe Apple dùng nghe nhạc lên đến 4.5 giờ, đàm thoại 3.5 giờ khi bật chế độ chống ồn chủ động và xuyên âm. Khi tắt 2 chế độ này thì thời gian dùng được 5 giờ, đàm thoại 3.5 giờ qua 1 lần sạc đầy.
&Trong khi kết hợp với hộp sạc cho tổng thời gian 24 giờ nghe nhạc, 18 giờ đàm thoại, hỗ trợ sạc nhanh 5 phút cho khoảng 1 giờ nghe gọi hoặc đàm thoại.', N'pk51_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000052', N'Nổi bật với thiết kế đậm chất "Xuân 2023'''' cùng độ nhạy cao, chuột Không dây Bluetooth Silent Rapoo M650 hứa hẹn sẽ là món phụ kiện đáng đầu tư, đáp ứng hầu hết các yêu cầu khi làm việc và học tập hàng ngày của bạn.', N'Thiết kế bên ngoài vô cùng gọn gàng, màu đỏ chủ đạo nổi bật cùng hoạ tiết chú mèo thần tài dễ thương đem sắc xuân ngập tràn đến cho không gian làm việc của bạn.
& Chuột được chế tác tỉ mỉ, vỏ ngoài chắc chắn cùng kiểu thiết kế mỏng giúp quá trình cất giữ thêm phần tiện lợi.
& Chuột Rapoo với độ phân giải đạt 1300 DPI, cho phép chơi game hay thực hiện các tác vụ chỉnh sửa hình ảnh thông thường vô cùng tốt, đáp ứng yêu cầu cơ bản hàng ngày của bạn.
& Kết nối không dây với 2 cách sau: Sử dụng đầu thu USB hoặc kết nối qua Bluetooth hiện đại, đa dạng sự lựa chọn cho người dùng. Kết nối dễ dàng cho hầu hết các dòng máy trên thị trường nhờ khả năng tương thích với các thiết bị sử dụng hệ điều hành Windows và macOS.
& Chuột Silent cho phép nhấp chuột êm ái, hạn chế tối đa tiếng ồn, giúp bạn tập trung vào công việc, hạn chế ảnh hưởng đến người xung quanh.
& Cuộn con lăn dễ dàng, xem tài liệu, đọc báo,... nhanh chóng, sử dụng chuột thoải mái trong mọi tình huống.', N'pk52_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000053', N'Chuột Không dây Bluetooth Silent Rapoo M650 Brazil thiết kế gọn nhẹ, sử dụng tiện lợi và dễ mang theo, độ phân giải cao cho phản hồi nhanh chóng.', N'Khối lượng gọn nhẹ, chuột Rapoo nổi bật với những đường cong được bo tròn tinh tế, chất liệu láng mịn giúp cảm giác sử dụng thoải mái.
& Con lăn được làm từ cao su mềm mại, thoải mái khi sử dụng lâu mà không gây đau nhức đầu ngón tay.
& Độ phân giải 1300 DPI, phản hồi từng tác động nhỏ khi sử dụng chuột, tối ưu trải nghiệm của người dùng.
& Luân chuyển kết nối tiện lợi nhờ khả năng lưu thông tin kết nối ở 3 thiết bị cùng lúc.
& Nút nhấn không gây tiếng động khi gõ, không gây khó chịu cho bạn và người xung quanh.
& Với viên pin được trang bị sẵn, bạn sẽ có khoảng 9 tháng sử dụng. Khi hết, có thể dễ dàng thay thế bằng viên pin AA khác.', N'pk53_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000054', N'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen với chân đế gaming vững vàng ngay bên dưới phím Space Bar đem đến sự vững vàng, chống trượt khi chơi game.', N'Thiết kế phím nổi chống nước không chỉ giúp bàn phím đẹp hơn, mà còn giúp cho bạn dễ dàng lau chùi bàn phím hơn khi dính bẩn.
& Bàn phím MSI được trang bị các switch tịnh tiến tương tự switch cơ học với ba bộ phận đem đến trải nghiệm gõ phím chắc chắn với độ bền hơn 12 triệu lần nhấn.
& Thông qua phần mềm MSI Center bạn có thể tuỳ biến bàn phím gaming với hàng triệu màu sắc và đến 7 hiệu ứng đèn trên 6 khu vực.
& Ngoài ra, với các phím tắt tiện lợi bạn dễ dàng thay đổi nhanh tốc độ, hướng hay chế độ đèn mà không cần cài đặt phần mềm. Phía trên của bàn phím là dãy phím tắt điều chỉnh âm lượng.
& Bàn phím có dây kết nối nhanh chóng với PC, Laptop qua cổng USB với đầu nối mạ vàng, dây dài 1.85 m.', N'pk54_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000055', N'Bàn phím có dây Gaming Asus TUF K1 với thiết kế có phần kê cổ tay tiện dụng, có thể tháo rời để mang lại sự thoải mái dài lâu.', N'Bàn phím được trang bị các phím bấm có độ phản hồi êm ái với mỗi lần nhấn.
& Các phím bấm này được đặt trong một khung chống thấm nước 300 ml, được gia công bằng một lớp phủ chuyên dụng và được chứng nhận đáp ứng hoạt động trong môi trường khắc nghiệt.
& Bàn phím gaming được thiết kế với ghi nhận 19 phím bấm cùng lúc (NKRO), nhờ đó đảm bảo độ chính xác vượt trội và không bị bỏ lỡ lần nhấn phím nào.
& Bàn phím Asus có năm vùng chiếu sáng riêng biệt và các thanh RGB nổi bật ở cả hai bên bàn phím, người dùng có thể lựa chọn toàn bộ phổ màu để tùy chỉnh riêng từng vùng, nhờ đó giúp bạn điều khiển dàn máy của mình sáng theo đúng ý muốn.
& Núm chỉnh âm lượng chuyên dụng ở góc trên bên phải, Asus TUF K1 giúp bạn điều khiển âm thanh trong game một cách nhanh chóng và dễ dàng. Bạn có thể dễ dàng vặn núm mà vẫn bám sát từng hành động trên màn hình.
& Phần mềm ASUS Armoury Crate hợp nhất các cơ chế điều khiển hệ thống và đèn để bạn có thể nhanh chóng điều chỉnh các cài đặt thiết yếu trong một tiện ích duy nhất.', N'pk55_ts.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'PKC000056', N'DareU EK868 - Mẫu bàn phím bluetooth của hãng DareU, sở hữu thiết kế cứng cáp, màu sắc trẻ trung cùng keycap thiết kế theo kiểu low-profile độc đáo. Là kiểu rút gọn 68 phím, sử dụng Blue switch mang lại cảm giác gõ nhẹ nhàng và âm thanh cực kỳ bắt tai. Cùng mình tìm hiểu cách sử dụng bàn phím này nhé!', N'Hướng dẫn kết nối có dây
& Bước 1: Ở cạnh trên của bàn phím, bạn chuyển thanh gạt vật lý đầu tiên về hệ điều hành Mac/Windows cho phù hợp với máy tính bạn đang sử dụng.
& Bước 2: Chuyển thanh gạt bên cạnh về chế độ A (chế độ A dành cho kết nối có dây).
& Bước 3: Kết nối bàn phím với máy tính qua dây cáp USB Type-C.
& Hướng dẫn kết nối qua bluetooth
& Bàn phím EK868 hỗ trợ kết nối trên các hệ điều hành khác nhau như: MacOS, Windows, iOS, Android, bạn có thể chuyển đổi giữa các thiết bị bằng cách thao tác trên thanh gạt vật lý cạnh trên bàn phím, sau đó tiến hành kết nối như sau:
& *Ở bài viết này hướng dẫn kết nối trên hệ điều hành Windows.
& Bước 1: Trên bàn phím bạn chuyển thanh gạt vật lý lên nấc số 1 hoặc 2 hoặc 3 (nấc 1, 2, 3 dành cho kết nối không dây, mỗi nấc có thể kết nối với 1 thiết bị).
& Bước 2: Nhấn giữ tổ hợp phím “Fn + Q” 3 giây để reset kết nối cho đến khi góc đèn nhấp nháy màu tím.
& Bước 3: Trên máy tính, bạn mở cài đặt bluetooth, chọn thêm thiết bị (1) và tìm thiết bị muốn kết nối tìm tên “EK868 BT Keyboard” và chọn kết nối.', N'pk56_ts.jpg')
GO
SET IDENTITY_INSERT [dbo].[Detail] ON 

INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (54, N'LAP000031', N'Apple M1 Pro', N'8', N'Hãng không công bố', N'200GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'16 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 512 GB', N'14.2 inch', N'Liquid Retina XDR display (3024 x 1964)', N'up to 120Hz', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 14 core-GPU', N'Wide stereo sound Hệ thống âm thanh 6 loa Dolby Atmos', N'3 x Thunderbolt 4 USB-C Jack tai nghe 3.5 mm HDMI', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 312.6 mm - Rộng 221.2 mm - Dày 15.5 mm - Nặng 1.6 kg', N'Vỏ kim loại nguyên khối', N'Khoảng 10 tiếng', N'Mac OS', N'10/2021')
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
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (141, N'LAP000034', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 256 GB', N'13.3 inch', N'Retina (2560 x 1600)', N'Hãng không công bố', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 10 nhân GPU', N'Wide stereo sound 3 microphones Loa kép (2 kênh) Dolby Atmos', N'2 x Thunderbolt 3 Jack tai nghe 3.5 mm', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'720p FaceTime Camera', N'Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (142, N'LAP000058', N'Intel Core i5 Comet Lake - 10300H', N'4', N'8', N'2.50 GHz', N'Turbo Boost 4.5 GHz', N'8 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe rời)', N'2933 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS  Chống chói Anti Glare  250 nits', N'Card rời - NVIDIA GeForce GTX 1650 4 GB', N'DTS X:Ultra Audio', N'Jack tai nghe 3.5 mm  1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC  2 x USB 3.2  HDMI  LAN (RJ45)  USB 2.0', N'Bluetooth 5.2Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg', N'Vỏ nhựa', N'3-cell Li-ion, 48 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (143, N'LAP000059', N'Intel Core i5 Alder Lake - 12500H', N'12', N'16', N'2.50 GHz', N'Turbo Boost 4.5 GHz', N'18 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB onboard + 1 khe trống)', N'3200 MHz', N'16 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác không giới hạn dung lượng)', N'15.6 inch', N'Full HD (1920 x 1080) OLED', N'60 Hz', N'Độ sáng 600 nits  100% DCI-P3  Chuẩn DisplayHDR True Black 600  Màn hình bảo vệ mắt EyeCare  Thời gian phản hồi 0.2 ms  Low Blue Light  Màn hình OLED  1.07 tỷ màu', N'Card tích hợp - Intel UHD Graphics (Iris Xe Graphics chỉ hoạt động với RAM kênh đôi)', N'SonicMaster audio', N'HDMI  1 x USB 2.0  Jack tai nghe 3.5 mm  2 x USB 3.2  USB Type-C', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'HD webcam', N'Độ bền chuẩn quân đội MIL STD 810H  Bản lề mở 180 độ  Bảo mật vân tay  Công tắc khóa camera', N'Có', N'Dài 356.8 mm - Rộng 227.6 mm - Dày 19.9 mm - Nặng 1.7 kg', N'Vỏ nhựa', N'3-cell Li-ion, 70 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (144, N'LAP000060', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (Onboard)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'13.3 inch', N'Full HD (1920 x 1080) OLED', N'60 Hz', N'100% DCI-P3  550 nits  Màn hình bảo vệ mắt EyeCare  Thời gian phản hồi 0.2 ms  Màn hình OLED', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'HDMI  2 x Thunderbolt 4 USB-C  1 x USB 3.2', N'Bluetooth 5.0Wi-Fi 6 (802.11ax)', N'HD webcamCamera IR', N'Tiêu chuẩn Nền Intel Evo  Độ bền chuẩn quân đội MIL STD 810G  Mở khóa khuôn mặt', N'Có', N'Dài 304.2 mm - Rộng 203 mm - Dày 13.9 mm - Nặng 1.14 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (145, N'LAP000061', N'Intel Core i5 Alder Lake - 12450H', N'8', N'12', N'2.00 GHz', N'Turbo Boost 4.4 GHz', N'12 MB', N'8 GB', N'DDR5 2 khe (1 khe 8 GB + 1 khe trống)', N'4800 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Chống chói Anti Glare  Công nghệ IPS  Adaptive-Sync  250 nits', N'Card rời - NVIDIA GeForce RTX 3050, 4 GB', N'Hi-Res certificationDolby Atmos', N'Thunderbolt 4  Jack tai nghe 3.5 mm  1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC  2 x USB 3.2  HDMI  LAN (RJ45)', N'Bluetooth 5.2Wi-Fi 6 (802.11ax)', N'HD webcam', N'', N'Có', N'Dài 354 mm - Rộng 251 mm - Dày 20.7 mm - Nặng 2 kg', N'Vỏ nhựa', N'4-cell Li-ion, 76 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (146, N'LAP000062', N'Intel Core i7 Alder Lake - 1260P', N'12', N'16', N'2.10 GHz', N'Turbo Boost 4.7 GHz', N'18 MB', N'16 GB', N'LPDDR5 (8 GB Onboard + 8 GB Onboard)', N'5200 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSDHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'17 inch', N'WQXGA (2560 x 1600)', N'60 Hz', N'350 nits  99% DCI-P3  Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'High Definition (HD) AudioDTS X:Ultra Audio', N'Jack tai nghe 3.5 mm  2 x USB 3.2  HDMI  2 x USB Type-C', N'Wi-Fi 6E (802.11ax)Bluetooth 5.1', N'Full HD WebcamCamera IR', N'Độ bền chuẩn quân đội MIL STD 810GMở khóa khuôn mặt', N'Có', N'Dài 378.8 mm - Rộng 258.8 mm - Dày 17.7 mm - Nặng 1.435 kg', N'Vỏ kim loại', N'80 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (147, N'LAP000063', N'Intel Core i7 Alder Lake - 1260P', N'12', N'16', N'2.10 GHz', N'Turbo Boost 4.7 GHz', N'18 MB', N'16 GB', N'LPDDR5 (8 GB Onboard + 8 GB Onboard)', N'5200 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSDHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'16 inch', N'WQXGA (2560 x 1600)', N'60 Hz', N'350 nits  99% DCI-P3  Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'High Definition (HD) AudioDTS X:Ultra Audio', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2  2 x USB Type C (có USB PD, cổng hiển thị, Thunderbolt 4)', N'Wi-Fi 6E (802.11ax)Bluetooth 5.1', N'Full HD WebcamCamera IR', N'Độ bền chuẩn quân đội MIL STD 810GMở khóa khuôn mặt', N'Có', N'Dài 354.5 mm - Rộng 242.1 mm - Dày 16.8 mm - Nặng 1.285 kg', N'Vỏ kim loại', N'80 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (148, N'LAP000064', N'Intel Core i7 Alder Lake - 1260P', N'12', N'16', N'2.10 GHz', N'Turbo Boost 4.7 GHz', N'18 MB', N'16 GB', N'LPDDR5 (8 GB Onboard + 8 GB Onboard)', N'5200 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'16 inch', N'WQXGA (2560 x 1600)', N'60 Hz', N'350 nits  99% DCI-P3  Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'High Definition (HD) AudioDTS X:Ultra Audio', N'Jack tai nghe 3.5 mm  2 x USB 3.2  HDMI  2 x USB Type C (có USB PD, cổng hiển thị, Thunderbolt 4)', N'Wi-Fi 6E (802.11ax)Bluetooth 5.1', N'Full HD WebcamCamera IR', N'Tiêu chuẩn Nền Intel Evo  Độ bền chuẩn quân đội MIL STD 810G  Mở khóa khuôn mặt', N'Có', N'Dài 354.5 mm - Rộng 242.1 mm - Dày 16.8 mm - Nặng 1.285 kg', N'Vỏ kim loại', N'80 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (149, N'LAP000065', N'Intel Core i7 Alder Lake - 1260P', N'12', N'16', N'2.10 GHz', N'Turbo Boost 4.7 GHz', N'18 MB', N'16 GB', N'LPDDR5 (8 GB Onboard + 8 GB Onboard)', N'5200 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'14 inch', N'WUXGA (1920 x 1200)', N'60 Hz', N'350 nits  99% DCI-P3  Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'High Definition (HD) AudioDTS X:Ultra Audio', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2  2 x USB Type C (có USB PD, cổng hiển thị, Thunderbolt 4)', N'Wi-Fi 6E (802.11ax)Bluetooth 5.1', N'Full HD WebcamCamera IR', N'Độ bền chuẩn quân đội MIL STD 810GMở khóa khuôn mặt', N'Có', N'Dài 312 mm - Rộng 213.9 mm - Dày 16.8 mm - Nặng 0.999 kg', N'Vỏ kim loại', N'Li-ion, 72 Wh', N'Windows 11 Home SL', N'2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (150, N'LAP000066', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe rời)', N'3200 MHz', N'64 GB', N'Hỗ trợ khe cắm HDD SATA 2.5 inch mở rộng (nâng cấp tối đa 2 TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Tấm nền IPS  Chống chói Anti Glare  100% sRGB', N'Card rời - NVIDIA GeForce RTX 3050Ti Max-Q, 4GB', N'Realtek High Definition Audio', N'HDMI  Jack tai nghe 3.5 mm  3x Type-A USB 3.2 Gen 1  LAN (RJ45)  USB Type-C', N'Bluetooth 5.2Wi-Fi 6 (802.11ax)', N'HD webcam', N'', N'Có', N'Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg', N'Vỏ kim loại', N'3-cell Li-ion, 51 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (151, N'LAP000067', N'Intel Core i5 Tiger Lake - 1155G7', N'4', N'8', N'2.50 GHz', N'Turbo Boost 4.5 GHz', N'8 MB', N'8 GB', N'DDR4 (1 khe)', N'3200 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti GlareCông nghệ IPS', N'Card rời - NVIDIA GeForce MX450, 2 GB', N'Hi-Res AudioNahimic Audio', N'Jack tai nghe 3.5 mm  2 x USB 3.2  HDMI  USB Type-C', N'Wi-Fi 6 (802.11ax)Bluetooth 5.1', N'HD webcam', N'Nút bật/tắt camera', N'Có', N'Dài 319 mm - Rộng 219 mm - Dày 16.9 mm - Nặng 1.3 Kg', N'Vỏ kim loại', N'3-cell Li-ion, 39 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (152, N'LAP000068', N'AMD Ryzen 5 - 5600H', N'6', N'12', N'3.30 GHz', N'Turbo Boost 4.2 GHz', N'16 MB', N'8 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe rời)', N'3200 MHz', N'64 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)Không hỗ trợ khe cắm HDD', N'15.6 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Chống chói Anti GlareCông nghệ IPS', N'Card rời - AMD Radeon RX 5500M, 4GB', N'Hi-Res AudioNahimic Audio', N'HDMI  Jack tai nghe 3.5 mm  2 x USB 3.2  LAN (RJ45)  USB 2.0  USB Type-C', N'Wi-Fi 6E (802.11ax)Bluetooth 5.1', N'HD webcam', N'', N'Có', N'Dài 359 mm - Rộng 259 mm - Dày 24.95 mm - Nặng 2.35 kg', N'Vỏ nhựa', N'3-cell, 52 Wh', N'Windows 11 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (153, N'LAP000069', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'16 GB', N'DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)', N'3200 MHz', N'64 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2 TB)Không hỗ trợ khe cắm HDD', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Chống chói Anti Glare  Công nghệ IPS  100% sRGB', N'Card rời - NVIDIA GeForce RTX 3050Ti, 4 GB', N'Hi-Res AudioNahimic Audio', N'USB Type-C  Jack tai nghe 3.5 mm  2 x USB 3.2  HDMI  LAN (RJ45)  USB 2.0', N'Bluetooth 5.2Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 359 mm - Rộng 259 mm - Dày 23.95 mm - Nặng 2.25 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3 cell, 53.5 Wh', N'Windows 10 Home SL', N'2021')
SET IDENTITY_INSERT [dbo].[Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[DetailsOrders] ON 

INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1015, 1013, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1017, 1014, N'LAP000033', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 37789500, 1, 37789500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1020, 1015, N'LAP000039', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 24709700, 1, 24709700, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1022, 1016, N'LAP000054', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 27529800, 1, 27529800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1029, 1019, N'LAP000048', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 20177700, 2, 40355400, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1032, 1022, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 2, 111300000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1036, 1026, N'LAP000056', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 36199800, 1, 36199800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1039, 1020, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 50785800, 1, 50785800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1041, 1027, N'LAP000048', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 20177700, 2, 40355400, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1042, 1027, N'LAP000058', N'Số 55 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 17533800, 1, 17533800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1043, 1027, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1044, 1028, N'LAP000036', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 25189500, 1, 25189500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1045, 1028, N'LAP000037', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 14065800, 1, 14065800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1046, 1029, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1047, 1029, N'LAP000038', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 13147800, 1, 13147800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1048, 1030, N'LAP000034', N'Số 85 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 34650000, 1, 34650000, 1006)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1049, 1031, N'LAP000033', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 37789500, 1, 37789500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1051, 1033, N'LAP000034', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 34650000, 1, 34650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1052, 1034, N'LAP000033', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 37789500, 1, 37789500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1053, 1035, N'LAP000034', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 34650000, 1, 34650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1054, 1036, N'LAP000034', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 34650000, 1, 34650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1055, 1036, N'PKC000049', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 6721800, 1, 6721800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1056, 1036, N'PKC000047', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 2220750, 1, 2220750, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1057, 1037, N'LAP000061', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 24163800, 1, 24163800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1058, 1037, N'PKC000055', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 1009800, 1, 1009800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1059, 1038, N'LAP000034', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 34650000, 1, 34650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1060, 1038, N'PKC000053', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 408000, 1, 408000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1061, 1038, N'PKC000054', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 989400, 1, 989400, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1062, 1038, N'PKC000051', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 5089800, 1, 5089800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1063, 1039, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1008)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1064, 1039, N'PKC000044', N'Số 95 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 3927000, 1, 3927000, 1008)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1065, 1041, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1066, 1042, N'LAP000055', N'Số 95 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 6415800, 1, 6415800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1067, 1043, N'LAP000033', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 37789500, 1, 37789500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1068, 1044, N'PKC000047', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 2220750, 1, 2220750, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1069, 1044, N'LAP000036', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 25189500, 1, 25189500, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1070, 1044, N'LAP000066', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 24163800, 1, 24163800, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1082, 1056, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 1, 55650000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1083, 1057, N'LAP000031', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 55650000, 2, 111300000, 1009)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1084, 1058, N'LAP000060', N'114 Mong', 26203800, 1, 26203800, 1010)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1087, 1061, N'PKC000047', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 2220750, 1, 2220750, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1088, 1062, N'LAP000059', N'114 Mong, Xã Nhân Mục, Huyện Hàm Yên, Tỉnh Tuyên Quang', 18247800, 1, 18247800, 1008)
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
SET IDENTITY_INSERT [dbo].[HUI] ON 

INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (898, N'LAP000036,LAP000037,', 2399000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (899, N'LAP000031,', 2650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (900, N'LAP000031,LAP000038,', 5300000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (901, N'LAP000038,', 2650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (902, N'PKC000049,', 1650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (903, N'PKC000049,PKC000047,', 3300000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (904, N'PKC000047,', 1650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (905, N'LAP000034,', 1650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (906, N'LAP000034,PKC000053,', 3300000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (907, N'LAP000034,PKC000053,PKC000054,', 4950000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (908, N'LAP000034,PKC000053,PKC000054,PKC000051,', 6600000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (909, N'PKC000053,', 1650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (910, N'PKC000053,PKC000054,', 3300000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (911, N'PKC000053,PKC000054,PKC000051,', 4950000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (912, N'PKC000054,', 1650000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (913, N'PKC000054,PKC000051,', 3300000)
INSERT [dbo].[HUI] ([id], [itemset], [Util]) VALUES (914, N'PKC000051,', 1650000)
SET IDENTITY_INSERT [dbo].[HUI] OFF
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'lap31.png', 1, CAST(N'2023-02-04T14:06:01.107' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'lap31_copy.png', 0, CAST(N'2023-02-04T14:06:15.663' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_1.jpg', 0, CAST(N'2022-11-18T14:33:49.720' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_2.jpg', 0, CAST(N'2022-11-18T14:34:08.343' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_3.jpg', 0, CAST(N'2022-11-18T14:34:24.370' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_4.jpg', 0, CAST(N'2022-11-18T14:34:38.077' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg', 0, CAST(N'2022-11-18T15:35:10.577' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-2-1-650x650_3.jpg', 0, CAST(N'2022-11-18T15:35:19.413' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-3-1-650x650_4.jpg', 0, CAST(N'2022-11-18T15:35:29.147' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-4-1-650x650_5.jpg', 0, CAST(N'2022-11-18T15:35:41.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000034', N'lap34.png', 1, CAST(N'2023-02-04T13:23:02.730' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000034', N'lap34_copy.png', 0, CAST(N'2023-02-04T13:24:37.823' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-2-1-650x650_3.jpg', 0, CAST(N'2022-11-18T17:02:24.003' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-3-1-650x650_4.jpg', 0, CAST(N'2022-11-18T17:02:32.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-4-1-650x650_5.jpg', 0, CAST(N'2022-11-18T17:02:41.737' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'lap35.png', 1, CAST(N'2023-02-04T13:26:49.003' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'lap35_copy.png', 0, CAST(N'2023-02-04T13:27:10.943' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36.jpg', 1, CAST(N'2023-02-04T13:31:27.870' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_3.jpg', 0, CAST(N'2022-11-24T18:20:26.507' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_4.jpg', 0, CAST(N'2022-11-24T18:20:36.670' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_5.jpg', 0, CAST(N'2022-11-24T18:20:47.173' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'lap36_copy.jpg', 0, CAST(N'2023-02-04T13:31:44.447' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'Laptop HP Gaming Victus 16-D0292TX 5Z9R3PA_2.jpg', 0, CAST(N'2022-11-24T18:17:12.657' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000036', N'LaptopHPGamingVictus16-D0292TX5Z9R3PA_copy.jpg', 0, CAST(N'2022-11-24T17:40:11.187' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37.jpg', 1, CAST(N'2023-02-04T13:33:18.250' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_2.jpg', 0, CAST(N'2022-11-24T18:22:19.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_3.jpg', 0, CAST(N'2022-11-24T18:22:29.993' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_4.jpg', 0, CAST(N'2022-11-24T18:22:40.150' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_5.jpg', 0, CAST(N'2022-11-24T18:22:50.797' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000037', N'lap37_copy.jpg', 0, CAST(N'2023-02-04T13:33:30.820' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38.jpg', 1, CAST(N'2023-02-04T13:34:33.853' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_2.jpg', 0, CAST(N'2022-11-24T18:23:56.430' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_3.jpg', 0, CAST(N'2022-11-24T18:24:06.363' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_4.jpg', 0, CAST(N'2022-11-24T18:24:16.847' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_5.jpg', 0, CAST(N'2022-11-24T18:24:26.257' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000038', N'lap38_copy.jpg', 0, CAST(N'2023-02-04T13:34:51.060' AS DateTime))
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
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_2.jpg', 0, CAST(N'2022-12-05T14:31:44.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_3.jpg', 0, CAST(N'2022-12-05T14:31:56.353' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_4.jpg', 0, CAST(N'2022-12-05T14:32:06.380' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_5.jpg', 0, CAST(N'2022-12-05T14:32:15.757' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000053', N'lap53_6.jpg', 0, CAST(N'2022-12-05T14:32:25.210' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54 - Copy.jpg', 0, CAST(N'2022-12-05T15:05:08.583' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54.jpg', 1, CAST(N'2022-12-05T15:04:58.247' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_1.jpg', 0, CAST(N'2022-12-05T15:05:21.290' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000054', N'lap54_2.jpg', 0, CAST(N'2022-12-05T15:05:32.493' AS DateTime))
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
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus - Copy.jpg', 0, CAST(N'2023-01-30T15:54:59.967' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus.jpg', 1, CAST(N'2023-01-30T15:54:04.767' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus_1.jpg', 0, CAST(N'2023-01-30T15:55:20.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus_2.jpg', 0, CAST(N'2023-01-30T15:55:38.617' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus_3.jpg', 0, CAST(N'2023-01-30T15:55:55.230' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus_4.jpg', 0, CAST(N'2023-01-30T15:56:12.750' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000058', N'lap58asus_5.jpg', 0, CAST(N'2023-01-30T15:56:26.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus - Copy.jpg', 0, CAST(N'2023-01-30T16:07:24.313' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus.jpg', 1, CAST(N'2023-01-30T16:07:11.073' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus_1.jpg', 0, CAST(N'2023-01-30T16:07:44.253' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus_2.jpg', 0, CAST(N'2023-01-30T16:07:57.447' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus_3.jpg', 0, CAST(N'2023-01-30T16:08:10.550' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus_4.jpg', 0, CAST(N'2023-01-30T16:08:22.093' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus_5.jpg', 0, CAST(N'2023-01-30T16:08:33.037' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000059', N'lap59asus_6.jpg', 0, CAST(N'2023-01-30T16:08:44.733' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus - Copy.jpg', 0, CAST(N'2023-01-30T16:17:33.000' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus.jpg', 1, CAST(N'2023-01-30T16:17:15.493' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus_1.jpg', 0, CAST(N'2023-01-30T16:17:44.193' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus_2.jpg', 0, CAST(N'2023-01-30T16:17:55.360' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus_3.jpg', 0, CAST(N'2023-01-30T16:18:07.200' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus_4.jpg', 0, CAST(N'2023-01-30T16:18:18.133' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000060', N'lap60asus_5.jpg', 0, CAST(N'2023-01-30T16:18:29.323' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_ - Copy.jpg', 0, CAST(N'2023-01-30T16:29:16.980' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_.jpg', 1, CAST(N'2023-01-30T16:28:56.890' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_1.jpg', 0, CAST(N'2023-01-30T16:29:34.110' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_2.jpg', 0, CAST(N'2023-01-30T16:29:44.770' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_3.jpg', 0, CAST(N'2023-01-30T16:29:55.023' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_4.jpg', 0, CAST(N'2023-01-30T16:30:05.563' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000061', N'lap61asus_5.jpg', 0, CAST(N'2023-01-30T16:30:16.037' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000062', N'lap62lg - Copy.jpg', 0, CAST(N'2023-01-31T11:37:47.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000062', N'lap62lg.jpg', 1, CAST(N'2023-01-31T11:37:35.203' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000062', N'lap62lg_1.jpg', 0, CAST(N'2023-01-31T11:38:00.850' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000062', N'lap62lg_2.jpg', 0, CAST(N'2023-01-31T11:38:13.177' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000062', N'lap62lg_3.jpg', 0, CAST(N'2023-01-31T11:38:24.647' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000062', N'lap62lg_4.jpg', 0, CAST(N'2023-01-31T11:38:36.513' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000063', N'lap63lg - Copy.jpg', 0, CAST(N'2023-01-31T11:47:12.147' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000063', N'lap63lg.jpg', 1, CAST(N'2023-01-31T11:46:59.303' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000063', N'lap63lg_1.jpg', 0, CAST(N'2023-01-31T11:47:26.797' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000063', N'lap63lg_2.jpg', 0, CAST(N'2023-01-31T11:47:38.113' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000063', N'lap63lg_3.jpg', 0, CAST(N'2023-01-31T11:47:49.083' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000063', N'lap63lg_4.jpg', 0, CAST(N'2023-01-31T11:48:01.110' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg - Copy.jpg', 0, CAST(N'2023-01-31T11:56:40.463' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg.jpg', 1, CAST(N'2023-01-31T11:56:28.967' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg_1.jpg', 0, CAST(N'2023-01-31T11:56:51.053' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg_2.jpg', 0, CAST(N'2023-01-31T11:57:03.223' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg_3.jpg', 0, CAST(N'2023-01-31T11:57:13.983' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg_4.jpg', 0, CAST(N'2023-01-31T11:57:24.867' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000064', N'lap64lg_5.jpg', 0, CAST(N'2023-01-31T11:57:34.907' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000065', N'lap65lg - Copy.jpg', 0, CAST(N'2023-01-31T12:03:44.513' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000065', N'lap65lg.jpg', 1, CAST(N'2023-01-31T12:03:30.900' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000065', N'lap65lg_1.jpg', 0, CAST(N'2023-01-31T12:03:57.753' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000065', N'lap65lg_2.jpg', 0, CAST(N'2023-01-31T12:04:08.743' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000065', N'lap65lg_3.jpg', 0, CAST(N'2023-01-31T12:04:19.773' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000065', N'lap65lg_4.jpg', 0, CAST(N'2023-01-31T12:04:32.353' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi - Copy.jpg', 0, CAST(N'2023-01-31T12:32:46.517' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi.jpg', 1, CAST(N'2023-01-31T12:32:32.673' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi_1.jpg', 0, CAST(N'2023-01-31T12:36:15.443' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi_2.jpg', 0, CAST(N'2023-01-31T12:36:28.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi_3.jpg', 0, CAST(N'2023-01-31T12:36:38.767' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi_4.jpg', 0, CAST(N'2023-01-31T12:36:50.937' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000066', N'lap66msi_5.jpg', 0, CAST(N'2023-01-31T12:37:02.173' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000067', N'lap67msi - Copy.jpg', 0, CAST(N'2023-01-31T12:45:32.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000067', N'lap67msi.jpg', 1, CAST(N'2023-01-31T12:45:22.480' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000067', N'lap67msi_1.jpg', 0, CAST(N'2023-01-31T12:45:43.577' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000067', N'lap67msi_2.jpg', 0, CAST(N'2023-01-31T12:45:54.580' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000067', N'lap67msi_3.jpg', 0, CAST(N'2023-01-31T12:46:22.357' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000067', N'lap67msi_4.jpg', 0, CAST(N'2023-01-31T12:46:34.517' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi - Copy.jpg', 0, CAST(N'2023-01-31T12:53:32.243' AS DateTime))
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi.jpg', 1, CAST(N'2023-01-31T12:53:20.470' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi_1.jpg', 0, CAST(N'2023-01-31T12:53:43.520' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi_2.jpg', 0, CAST(N'2023-01-31T12:54:10.347' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi_3.jpg', 0, CAST(N'2023-01-31T12:54:21.003' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi_4.jpg', 0, CAST(N'2023-01-31T12:54:33.170' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000068', N'lap68msi_5.jpg', 0, CAST(N'2023-01-31T12:54:43.847' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi - Copy.jpg', 0, CAST(N'2023-01-31T13:01:10.760' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi.jpg', 1, CAST(N'2023-01-31T13:01:01.300' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi_1.jpg', 0, CAST(N'2023-01-31T13:01:22.077' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi_2.jpg', 0, CAST(N'2023-01-31T13:01:30.993' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi_3.jpg', 0, CAST(N'2023-01-31T13:01:40.913' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi_4.jpg', 0, CAST(N'2023-01-31T13:01:50.667' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000069', N'lap69msi_5.jpg', 0, CAST(N'2023-01-31T13:02:01.350' AS DateTime))
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
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000048', N'pk48 - Copy.jpg', 0, CAST(N'2023-02-01T12:42:21.927' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000048', N'pk48.jpg', 1, CAST(N'2023-02-01T12:42:05.897' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000048', N'pk48_1.jpg', 0, CAST(N'2023-02-01T12:42:36.247' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000048', N'pk48_2.jpg', 0, CAST(N'2023-02-01T12:42:46.857' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000048', N'pk48_3.jpg', 0, CAST(N'2023-02-01T12:43:01.397' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000049', N'pk49 - Copy.jpg', 0, CAST(N'2023-02-01T13:20:25.860' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000049', N'pk49.jpg', 1, CAST(N'2023-02-01T13:20:10.670' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000049', N'pk49_1.jpg', 0, CAST(N'2023-02-01T13:20:38.140' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000049', N'pk49_2.jpg', 0, CAST(N'2023-02-01T13:21:03.740' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000049', N'pk49_3.jpg', 0, CAST(N'2023-02-01T13:21:15.147' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000049', N'pk49_4.jpg', 0, CAST(N'2023-02-01T13:21:29.077' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000050', N'pk50 - Copy.jpg', 0, CAST(N'2023-02-01T14:12:32.907' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000050', N'pk50.jpg', 1, CAST(N'2023-02-01T14:12:21.597' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000050', N'pk50_1.jpg', 0, CAST(N'2023-02-01T14:12:42.923' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000050', N'pk50_2.jpg', 0, CAST(N'2023-02-01T14:12:54.310' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000050', N'pk50_3.jpg', 0, CAST(N'2023-02-01T14:13:06.070' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000051', N'pk49_1.jpg', 0, CAST(N'2023-02-01T14:22:31.850' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000051', N'pk49_2.jpg', 0, CAST(N'2023-02-01T14:22:44.973' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000051', N'pk51 - Copy.jpeg', 0, CAST(N'2023-02-01T14:22:13.997' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000051', N'pk51.jpeg', 1, CAST(N'2023-02-01T14:22:02.413' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000052', N'pk52 - Copy.jpg', 0, CAST(N'2023-02-01T14:36:20.157' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000052', N'pk52.jpg', 1, CAST(N'2023-02-01T14:36:09.817' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000052', N'pk52_1.jpg', 0, CAST(N'2023-02-01T14:36:30.810' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000052', N'pk52_2.jpg', 0, CAST(N'2023-02-01T14:36:40.993' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000052', N'pk52_3.jpg', 0, CAST(N'2023-02-01T14:36:50.520' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000053', N'pk53 - Copy.jpg', 0, CAST(N'2023-02-01T14:44:55.983' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000053', N'pk53.jpg', 1, CAST(N'2023-02-01T14:44:43.870' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000053', N'pk53_1.jpg', 0, CAST(N'2023-02-01T14:45:11.607' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000053', N'pk53_2.jpg', 0, CAST(N'2023-02-01T14:45:23.150' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000053', N'pk53_3.jpg', 0, CAST(N'2023-02-01T14:45:34.243' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000053', N'pk53_4.jpg', 0, CAST(N'2023-02-01T14:45:45.130' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000054', N'pk54 - Copy.jpg', 0, CAST(N'2023-02-01T14:57:18.720' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000054', N'pk54.jpg', 1, CAST(N'2023-02-01T14:57:07.623' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000054', N'pk54_1.jpg', 0, CAST(N'2023-02-01T14:57:31.377' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000054', N'pk54_2.jpg', 0, CAST(N'2023-02-01T14:57:43.280' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000054', N'pk54_3.jpg', 0, CAST(N'2023-02-01T14:57:54.487' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000055', N'pk55 - Copy.jpg', 0, CAST(N'2023-02-01T15:07:07.447' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000055', N'pk55.jpg', 1, CAST(N'2023-02-01T15:06:56.010' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000055', N'pk55_1.jpg', 0, CAST(N'2023-02-01T15:07:18.313' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000056', N'pk56 - Copy.jpg', 0, CAST(N'2023-02-01T15:15:01.773' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000056', N'pk56.jpg', 1, CAST(N'2023-02-01T15:14:44.703' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000056', N'pk56_1.jpg', 0, CAST(N'2023-02-01T15:15:12.123' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000056', N'pk56_2.jpg', 0, CAST(N'2023-02-01T15:15:22.750' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'PKC000056', N'pk56_3.jpg', 0, CAST(N'2023-02-01T15:15:33.533' AS DateTime))
GO
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (1, N'Đang chờ xác nhận')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (2, N'Đang chuẩn bị hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (3, N'Đang chờ vận chuyển')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (4, N'Đang giao hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (5, N'Giao hàng thành công')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (6, N'Đã hủy')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (7, N'Đã giao hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (8, N'Trả hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (9, N'Đang vận chuyển hàng trả')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1013, CAST(N'2022-12-30T19:28:28.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1014, CAST(N'2022-12-31T14:09:40.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1015, CAST(N'2022-12-31T14:11:42.233' AS DateTime), N'Đã hủy', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1016, CAST(N'2023-01-05T15:02:46.793' AS DateTime), N'Đã hủy', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1019, CAST(N'2023-01-07T11:49:44.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1020, CAST(N'2023-01-10T13:52:37.873' AS DateTime), N'Đã hủy', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1022, CAST(N'2023-01-10T14:07:13.000' AS DateTime), N'Đã giao hàng', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1026, CAST(N'2023-01-10T14:27:24.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1027, CAST(N'2023-02-02T21:13:09.000' AS DateTime), N'Trả hàng', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1028, CAST(N'2023-02-03T18:27:27.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1029, CAST(N'2023-02-03T18:30:55.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1030, CAST(N'2023-02-04T13:50:43.710' AS DateTime), N'Đang chờ xác nhận', NULL, 1006)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1031, CAST(N'2023-02-04T13:55:00.780' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1033, CAST(N'2023-02-05T18:22:49.350' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1034, CAST(N'2023-02-05T18:39:42.000' AS DateTime), N'Đang giao hàng', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1035, CAST(N'2023-02-05T18:47:30.310' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1036, CAST(N'2023-02-06T16:23:01.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1037, CAST(N'2023-02-06T16:25:21.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1038, CAST(N'2023-02-06T19:50:03.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1039, CAST(N'2023-02-07T04:10:08.717' AS DateTime), N'Đang chờ xác nhận', NULL, 1008)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1041, CAST(N'2023-02-13T11:04:14.243' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1042, CAST(N'2023-02-13T11:06:57.097' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1043, CAST(N'2023-02-13T11:07:19.907' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1044, CAST(N'2023-02-13T11:09:41.780' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1056, CAST(N'2023-02-13T11:39:50.170' AS DateTime), N'Đang chờ xác nhận', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1057, CAST(N'2023-02-15T20:58:33.157' AS DateTime), N'Đang chờ xác nhận', NULL, 1009)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1058, CAST(N'2023-02-15T21:13:40.513' AS DateTime), N'Đang chờ xác nhận', NULL, 1010)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1061, CAST(N'2023-02-15T21:29:21.000' AS DateTime), N'Đang giao hàng', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (1062, CAST(N'2023-02-15T21:30:53.000' AS DateTime), N'Đang giao hàng', NULL, 1003)
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
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (29, N'Thời gian sạc đầy', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (30, N'Thời gian sử dụng pin', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (31, N'Thời lượng pin tai nghe', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (32, N'Thời lượng pin hộp sạc', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (33, N'Phím điều khiển', 3)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (34, N'Công nghệ âm thanh', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (35, N'Kết nối cùng lúc', 1)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (36, N'Công nghệ kết nối', 1)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (37, N'Điều khiển', 1)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (38, N'Hãng', 4)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (39, N'Loại switch', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (40, N'Kiểu bàn phím', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (41, N'Số phím', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (42, N'Phần mềm hỗ trợ', 2)
INSERT [dbo].[parameter] ([paraID], [paraName], [tt_id]) VALUES (43, N'Đèn LED', 2)
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
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1302023PN000033 ', 1, CAST(N'2023-01-30T15:45:21.193' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1302023PN000034 ', 1, CAST(N'2023-01-30T16:01:16.487' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1302023PN000035 ', 1, CAST(N'2023-01-30T16:12:29.273' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1302023PN000036 ', 1, CAST(N'2023-01-30T16:23:23.250' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000037 ', 1, CAST(N'2023-01-31T11:32:05.087' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000038 ', 1, CAST(N'2023-01-31T11:43:18.670' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000039 ', 1, CAST(N'2023-01-31T11:51:32.420' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000040 ', 1, CAST(N'2023-01-31T12:00:14.850' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000041 ', 1, CAST(N'2023-01-31T12:28:22.717' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000042 ', 1, CAST(N'2023-01-31T12:41:24.177' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000043 ', 1, CAST(N'2023-01-31T12:49:24.627' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'1312023PN000044 ', 1, CAST(N'2023-01-31T12:57:25.297' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000045  ', 1, CAST(N'2023-02-01T12:34:00.390' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000046  ', 1, CAST(N'2023-02-01T13:15:47.830' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000047  ', 1, CAST(N'2023-02-01T14:08:32.543' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000048  ', 1, CAST(N'2023-02-01T14:18:06.387' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000049  ', 1, CAST(N'2023-02-01T14:33:11.847' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000050  ', 1, CAST(N'2023-02-01T14:41:03.363' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000051  ', 1, CAST(N'2023-02-01T14:53:37.913' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000052  ', 1, CAST(N'2023-02-01T15:03:55.267' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'212023PN000053  ', 1, CAST(N'2023-02-01T15:11:32.870' AS DateTime))
GO
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000031', N'MacBook Pro 14 inch M1 Pro 2021 14-Core GPU', 87, 16, CAST(55650000 AS Decimal(32, 0)), 1, N'lap31.png', 1, 51)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000033', N'MacBook Pro 13 inch M2 2022', 94, 12, CAST(37789500 AS Decimal(32, 0)), 1, N'lap33.png', 1, 23)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000034', N'MacBook Pro 13 inch M1 2020', 197, 14, CAST(34650000 AS Decimal(32, 0)), 1, N'lap34.png', 1, 57)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000035', N'MacBook Pro 13 inch M2 2022', 200, 0, CAST(43050000 AS Decimal(32, 0)), 1, N'lap35.png', 1, 28)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000036', N'Laptop HP Gaming Victus 16-D0292TX 5Z9R3PA', 197, 5, CAST(25189500 AS Decimal(32, 0)), 3, N'lap36.jpg', 1, 30)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000037', N'Laptop HP 15s fq2662TU i3 1115G4/4GB/256GB/Win11 (6K795PA)', 37, 2, CAST(14065800 AS Decimal(32, 0)), 3, N'lap37.jpg', 1, 20)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000038', N'Laptop HP 240 G8 i3 1005G1/4GB/512GB/Win11 (617K6PA)', 179, 2, CAST(13147800 AS Decimal(32, 0)), 3, N'lap38.jpg', 1, 9)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000039', N'Laptop Lenovo Yoga Slim 7 14ITL05 i7 1165G7/8GB/512GB/Win10 (82A300DQVN)', 39, 2, CAST(24709700 AS Decimal(32, 0)), 4, N'lap39.jpg', 1, 12)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000040', N'Laptop Dell Gaming G15 5515 R5 5600H/16GB/512GB/4GB RTX3050/120Hz/OfficeHS/Win11 (P105F004DGR)', 239, 3, CAST(23551800 AS Decimal(32, 0)), 6, N'lap40.jpg', 1, 31)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000047', N'Laptop Dell Inspiron 15 3511 i3 1115G4/4GB/256GB/Office H&S/Win11 (P112F001CBL)', 50, 0, CAST(12331800 AS Decimal(32, 0)), 6, N'lap47.jpg', 1, 7)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000048', N'Laptop Dell Vostro 3510 i5 1135G7/8GB/512GB/2GB MX350/OfficeHS/Win11 (P112F002BBL)', 68, 8, CAST(20177700 AS Decimal(32, 0)), 6, N'lap48.jpg', 1, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000049', N'Laptop Dell Gaming G15 5511 i5 11400H/8GB/256GB/4GB RTX3050/120Hz/OfficeHS/Win11 (70266676)', 100, 0, CAST(28039800 AS Decimal(32, 0)), 6, N'lap49.jpg', 1, 23)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000050', N'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QBMSV.006)', 40, 0, CAST(19471800 AS Decimal(32, 0)), 5, N'lap50.jpg', 1, 14)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000051', N'Laptop Acer Aspire 7 Gaming A715 42G R4XX R5 5500U/8GB/256GB/4GB GTX1650/Win11 (NH.QAYSV.008)', 60, 0, CAST(15027700 AS Decimal(32, 0)), 5, N'lap51.jpg', 1, 4)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000052', N'Laptop Acer Aspire 3 A315 58 52KT i5 1135G7/8GB/512GB/Win11 (NX.AM0SV.006)', 20, 0, CAST(14881800 AS Decimal(32, 0)), 5, N'lap52.jpg', 1, 4)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000053', N'Laptop Acer Aspire A315 56 32TP i3 1005G1/4GB/256GB/Win11 (NX.HS5SV.00K)', 20, 0, CAST(10189800 AS Decimal(32, 0)), 5, N'lap53.jpg', 1, 14)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000054', N'Laptop HP Envy 13 ba1535TU i7 1165G7/8GB/512GB/Win11 (4U6M4PA)', 38, 3, CAST(27529800 AS Decimal(32, 0)), 3, N'lap54.jpg', 1, 14)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000055', N'Laptop Lenovo Ideapad 1 11IGL05 N5030/4GB/256GB/Win11 (81VT006FVN)', 29, 2, CAST(6415800 AS Decimal(32, 0)), 4, N'lap55.jpg', 1, 37)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000056', N'Laptop Lenovo Yoga Duet 7 13ITL6 i7 1165G7/16GB/1TB SSD/Touch/Pen/Win10 (82MA003UVN)', 50, 0, CAST(36199800 AS Decimal(32, 0)), 4, N'lap56.jpg', 1, 6)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000057', N'Laptop Lenovo IdeaPad 5 Pro 16IHU6 i5 11300H/16GB/512GB/2GB MX450/120Hz/Win11 (82L9004XVN)', 60, 0, CAST(27529800 AS Decimal(32, 0)), 4, N'lap57.jpg', 1, 14)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000058', N'Laptop Asus TUF Gaming F15 FX506LHB i5 10300H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN188W)', 49, 4, CAST(17533800 AS Decimal(32, 0)), 2, N'lap58asus.jpg', 1, 6)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000059', N'Laptop Asus VivoBook 15X OLED A1503ZA i5 12500H/8GB/512GB/Win11', 29, 2, CAST(18247800 AS Decimal(32, 0)), 2, N'lap59asus.jpg', 1, 8)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000060', N'Laptop Asus ZenBook UX325EA i7 1165G7/16GB/512GB/Cáp/Túi/Win11 (KG658W)', 30, 1, CAST(26203800 AS Decimal(32, 0)), 2, N'lap60asus.jpg', 1, 4)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000061', N'Laptop Asus Gaming TUF Dash F15 FX517ZC i5 12450H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN077W)', 19, 2, CAST(24163800 AS Decimal(32, 0)), 2, N'lap61asus_.jpg', 1, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000062', N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (17Z90Q-G.AH78A5)', 20, 0, CAST(44563800 AS Decimal(32, 0)), 8, N'lap62lg.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000063', N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (16Z90Q-G.AH78A5)', 20, 0, CAST(42727800 AS Decimal(32, 0)), 8, N'lap63lg.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000064', N'Laptop LG gram 2022 i7 1260P/16GB/512GB/Win11 (16Z90Q-G.AH76A5)', 20, 0, CAST(40891800 AS Decimal(32, 0)), 8, N'lap64lg.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000065', N'Laptop LG gram 2022 i7 1260P/16GB/512GB/Win11 (14Z90Q-G.AH75A5)', 20, 0, CAST(32548200 AS Decimal(32, 0)), 8, N'lap65lg.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000066', N'Laptop MSI Gaming GF63 Thin 11UD i7 11800H/8GB/512GB/4GB RTX3050Ti Max-Q/Balo/Chuột/Win11 (648VN)', 19, 2, CAST(24163800 AS Decimal(32, 0)), 7, N'lap66msi.jpg', 1, 30)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000067', N'Laptop MSI Modern 14 B11SBU i5 1155G7/8GB/512GB/2GB MX450/Túi/Chuột/Win10 (669VN)', 20, 0, CAST(16717800 AS Decimal(32, 0)), 7, N'lap67msi.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000068', N'Laptop MSI Gaming Bravo 15 B5DD R5 5600H/8GB/512GB/4GB RX5500M/Balo/Chuột/Win11 (279VN)', 20, 0, CAST(15289800 AS Decimal(32, 0)), 7, N'lap68msi.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000069', N'Laptop MSI Gaming Pulse GL66 11UDK i7 11800H/16GB/512GB/4GB RTX3050Ti/144Hz/Balo/Chuột/Win10 (816VN)', 20, 0, CAST(30079800 AS Decimal(32, 0)), 7, N'lap69msi.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000041', N'Cáp sạc USB-C 1m', 199, 1, CAST(525000 AS Decimal(32, 0)), 10, N'use_c_1m_white.png', 6, 20)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000042', N'Cáp sạc USB-C MM093 1m', 38, 6, CAST(550000 AS Decimal(32, 0)), 10, N'pk42.png', 6, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000043', N'Chuột Bluetooth Apple MMMQ3', 150, 0, CAST(2667000 AS Decimal(32, 0)), 10, N'pk43.png', 5, 6)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000044', N'Magic Keyboard với Touch ID và Numeric Keypad', 200, 2, CAST(3927000 AS Decimal(32, 0)), 10, N'pk44.png', 4, 20)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000045', N'Tai nghe chụp tai Bluetooth Sony WH-XB910N', 200, 0, CAST(4095000 AS Decimal(32, 0)), 10, N'pk45.jpg', 3, 7)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000046', N'Túi chống sốc Laptop 14 inch Targus Pulse Sleeve TSS94804EU-50', 200, 0, CAST(309750 AS Decimal(32, 0)), 10, N'tui_chong_soc.png', 7, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000047', N'Magic Mouse', 18, 6, CAST(2220750 AS Decimal(32, 0)), 10, N'pk47.png', 5, 22)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000048', N'Bút cảm ứng Apple Pencil 1 MK0C2', 20, 0, CAST(2356200 AS Decimal(32, 0)), 10, N'pk48.jpg', 7, 17)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000049', N'Tai nghe Bluetooth AirPods Pro (2nd Gen) MagSafe Charge Apple MQD83', 20, 2, CAST(6721800 AS Decimal(32, 0)), 10, N'pk49.jpg', 3, 10)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000050', N'Tai nghe Bluetooth AirPods 2 Lightning Charge Apple MV7N2', 20, 0, CAST(3457800 AS Decimal(32, 0)), 10, N'pk50.jpg', 3, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000051', N'Tai nghe Bluetooth AirPods Pro MagSafe Charge Apple MLWK3', 20, 2, CAST(5089800 AS Decimal(32, 0)), 10, N'pk51.jpeg', 3, 9)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000052', N'Chuột Không dây Bluetooth Silent Rapoo M650 Lucky Cat ', 20, 0, CAST(408000 AS Decimal(32, 0)), 10, N'pk52.jpg', 5, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000053', N'Chuột Không dây Bluetooth Silent Rapoo M650 Brazil', 20, 2, CAST(408000 AS Decimal(32, 0)), 10, N'pk53.jpg', 5, 4)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000054', N'Bàn phím Có dây Gaming MSI Vigor GK30 US Đen', 20, 2, CAST(989400 AS Decimal(32, 0)), 10, N'pk54.jpg', 4, 2)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000055', N'Bàn phím có dây Gaming Asus TUF K1', 19, 2, CAST(1009800 AS Decimal(32, 0)), 10, N'pk55.jpg', 4, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'PKC000056', N'Bàn Phím Bluetooth DareU EK868 Đen', 20, 0, CAST(1193400 AS Decimal(32, 0)), 10, N'pk56.jpg', 4, 0)
GO
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (1, N'Máy tính')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (2, N'Điện thoại')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (3, N'Tai nghe')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (4, N'Bàn phím')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (5, N'Chuột')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (6, N'Cục sạc')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (7, N'Phụ Kiện máy tính')
GO
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000036', CAST(N'2023-02-07' AS Date), CAST(N'2023-03-07' AS Date), CAST(500000 AS Decimal(32, 0)), CAST(24689500 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000054', CAST(N'2022-12-30' AS Date), CAST(N'2023-04-04' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(26529800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000055', CAST(N'2022-12-30' AS Date), CAST(N'2023-04-02' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(5415800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000056', CAST(N'2022-12-30' AS Date), CAST(N'2023-05-02' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(35199800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000057', CAST(N'2022-12-30' AS Date), CAST(N'2023-03-03' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(26529800 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'PKC000049', CAST(N'2023-02-07' AS Date), CAST(N'2023-03-07' AS Date), CAST(100000 AS Decimal(32, 0)), CAST(6621800 AS Decimal(32, 0)))
GO
SET IDENTITY_INSERT [dbo].[returnProduct] ON 

INSERT [dbo].[returnProduct] ([id], [id_order], [reason], [nameImage], [tt]) VALUES (5, 1026, N'không thích', N'lap000000.jpg', N'Đang giao hàng')
INSERT [dbo].[returnProduct] ([id], [id_order], [reason], [nameImage], [tt]) VALUES (6, 1027, N'không thích', N'lap000000.jpg', N'Đang chờ xác nhận')
SET IDENTITY_INSERT [dbo].[returnProduct] OFF
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
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [fk_add_pro] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [fk_add_pro]
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
ON DELETE CASCADE
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
ALTER TABLE [dbo].[returnProduct]  WITH CHECK ADD  CONSTRAINT [fk_rePro_Or] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([orderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[returnProduct] CHECK CONSTRAINT [fk_rePro_Or]
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

--GO
--CREATE TRIGGER tg_AutoUpdateCarttt on Cart
--for insert
--as
--	Begin 
--		Update Cart
--		set tt = 1
--	END
	
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


