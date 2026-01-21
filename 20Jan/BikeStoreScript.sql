-- Problem statement : https://www.sqlservertutorial.net/getting-started/sql-server-sample-database/

USE [master]
GO
/****** Object:  Database [BikeStores]    Script Date: 21-01-2026 16:10:06 ******/
CREATE DATABASE [BikeStores]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BikeStores', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BikeStores.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BikeStores_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BikeStores_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BikeStores] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BikeStores].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BikeStores] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BikeStores] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BikeStores] SET ARITHABORT OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BikeStores] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BikeStores] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BikeStores] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BikeStores] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BikeStores] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BikeStores] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BikeStores] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BikeStores] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BikeStores] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BikeStores] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BikeStores] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BikeStores] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BikeStores] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BikeStores] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BikeStores] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BikeStores] SET RECOVERY FULL 
GO
ALTER DATABASE [BikeStores] SET  MULTI_USER 
GO
ALTER DATABASE [BikeStores] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BikeStores] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BikeStores] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BikeStores] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BikeStores] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BikeStores] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BikeStores', N'ON'
GO
ALTER DATABASE [BikeStores] SET QUERY_STORE = ON
GO
ALTER DATABASE [BikeStores] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BikeStores]
GO
/****** Object:  Schema [production]    Script Date: 21-01-2026 16:10:06 ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 21-01-2026 16:10:06 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  Table [production].[brands]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[categories]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[products]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[stocks]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[customers]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[order_items]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[orders]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[staffs]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [bit] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[stores]    Script Date: 21-01-2026 16:10:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [production].[brands] ON 

INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (1, N'Trek')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (2, N'Giant')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (3, N'Specialized')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (4, N'Cannondale')
SET IDENTITY_INSERT [production].[brands] OFF
GO
SET IDENTITY_INSERT [production].[categories] ON 

INSERT [production].[categories] ([category_id], [category_name]) VALUES (1, N'Mountain Bikes')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (2, N'Road Bikes')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (3, N'Electric Bikes')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [production].[categories] OFF
GO
SET IDENTITY_INSERT [production].[products] ON 

INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (1, N'Trek Marlin 7', 1, 1, 2024, CAST(55000.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (2, N'Giant Escape 3', 2, 2, 2023, CAST(42000.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (3, N'Specialized Turbo Vado', 3, 3, 2024, CAST(125000.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (4, N'Cannondale Helmet', 4, 4, 2023, CAST(3500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [production].[products] OFF
GO
INSERT [production].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 1, 10)
INSERT [production].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 2, 5)
INSERT [production].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 3, 7)
INSERT [production].[stocks] ([store_id], [product_id], [quantity]) VALUES (2, 4, 20)
GO
SET IDENTITY_INSERT [sales].[customers] ON 

INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Rahul', N'Kumar', N'777-111-2222', N'rahul@gmail.com', N'Street 1', N'Delhi', N'DL', N'110001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Priya', N'Malhotra', N'777-333-4444', N'priya@gmail.com', N'Street 2', N'Mumbai', N'MH', N'400001')
SET IDENTITY_INSERT [sales].[customers] OFF
GO
INSERT [sales].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 1, 1, 1, CAST(55000.00 AS Decimal(10, 2)), CAST(0.05 AS Decimal(4, 2)))
INSERT [sales].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (1, 2, 4, 2, CAST(3500.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(4, 2)))
INSERT [sales].[order_items] ([order_id], [item_id], [product_id], [quantity], [list_price], [discount]) VALUES (2, 1, 3, 1, CAST(125000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(4, 2)))
GO
SET IDENTITY_INSERT [sales].[orders] ON 

INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1, 1, 1, CAST(N'2025-01-10' AS Date), CAST(N'2025-01-15' AS Date), CAST(N'2025-01-12' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (2, 2, 2, CAST(N'2025-01-11' AS Date), CAST(N'2025-01-16' AS Date), NULL, 2, 4)
SET IDENTITY_INSERT [sales].[orders] OFF
GO
SET IDENTITY_INSERT [sales].[staffs] ON 

INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (1, N'Amit', N'Sharma', N'amit@bikestores.com', N'999-111-2222', 1, 1, NULL)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (2, N'Rohit', N'Verma', N'rohit@bikestores.com', N'999-333-4444', 1, 2, NULL)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (3, N'Neha', N'Singh', N'neha@bikestores.com', N'888-111-2222', 1, 1, 1)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (4, N'Karan', N'Mehta', N'karan@bikestores.com', N'888-333-4444', 1, 2, 2)
SET IDENTITY_INSERT [sales].[staffs] OFF
GO
SET IDENTITY_INSERT [sales].[stores] ON 

INSERT [sales].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Downtown Bikes', N'111-222-3333', N'downtown@bikestores.com', N'12 Main St', N'Delhi', N'DL', N'110001')
INSERT [sales].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'City Cycles', N'444-555-6666', N'city@bikestores.com', N'45 Market Rd', N'Mumbai', N'MH', N'400001')
SET IDENTITY_INSERT [sales].[stores] OFF
GO
ALTER TABLE [sales].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_brands] FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
GO
ALTER TABLE [production].[products] CHECK CONSTRAINT [FK_products_brands]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
GO
ALTER TABLE [production].[products] CHECK CONSTRAINT [FK_products_categories]
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD  CONSTRAINT [FK_stocks_products] FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
GO
ALTER TABLE [production].[stocks] CHECK CONSTRAINT [FK_stocks_products]
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD  CONSTRAINT [FK_stocks_stores] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [production].[stocks] CHECK CONSTRAINT [FK_stocks_stores]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_orders] FOREIGN KEY([order_id])
REFERENCES [sales].[orders] ([order_id])
GO
ALTER TABLE [sales].[order_items] CHECK CONSTRAINT [FK_order_items_orders]
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_products] FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
GO
ALTER TABLE [sales].[order_items] CHECK CONSTRAINT [FK_order_items_products]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customer_id])
REFERENCES [sales].[customers] ([customer_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_staffs] FOREIGN KEY([staff_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [FK_orders_staffs]
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_stores] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [sales].[orders] CHECK CONSTRAINT [FK_orders_stores]
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD  CONSTRAINT [FK_staffs_manager] FOREIGN KEY([manager_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs] CHECK CONSTRAINT [FK_staffs_manager]
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD  CONSTRAINT [FK_staffs_stores] FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
GO
ALTER TABLE [sales].[staffs] CHECK CONSTRAINT [FK_staffs_stores]
GO
USE [master]
GO
ALTER DATABASE [BikeStores] SET  READ_WRITE 
GO
