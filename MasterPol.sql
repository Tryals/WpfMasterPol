USE [master]
GO
/****** Object:  Database [MasterPol]    Script Date: 15.01.2025 11:22:16 ******/
CREATE DATABASE [MasterPol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterPol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterPol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterPol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MasterPol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MasterPol] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterPol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterPol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterPol] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterPol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterPol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterPol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterPol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterPol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterPol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterPol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterPol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterPol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterPol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterPol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterPol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterPol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterPol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterPol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterPol] SET  MULTI_USER 
GO
ALTER DATABASE [MasterPol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterPol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterPol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterPol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterPol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterPol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterPol] SET QUERY_STORE = ON
GO
ALTER DATABASE [MasterPol] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MasterPol]
GO
/****** Object:  Table [dbo].[partner_type]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partner_type](
	[id_partner_type] [int] IDENTITY(1,1) NOT NULL,
	[name_partner] [nvarchar](50) NULL,
 CONSTRAINT [PK_partner_type] PRIMARY KEY CLUSTERED 
(
	[id_partner_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partners]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partners](
	[id_partners] [int] IDENTITY(1,1) NOT NULL,
	[id_partner_type] [int] NULL,
	[name_company] [nvarchar](max) NULL,
	[ur_adress] [nvarchar](max) NULL,
	[INN] [nvarchar](max) NULL,
	[Director_name] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[logo] [image] NULL,
	[rating] [int] NULL,
	[places_sales] [nvarchar](max) NULL,
	[history] [nvarchar](max) NULL,
	[id_manager] [int] NULL,
 CONSTRAINT [PK_partners] PRIMARY KEY CLUSTERED 
(
	[id_partners] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zayavka]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zayavka](
	[id_zayavka] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_partners] [int] NULL,
	[count_products] [int] NULL,
	[data] [date] NULL,
	[Percentage]  AS (case when [count_products]<(10000) then (0) when [count_products]<(50000) then (5) when [count_products]<(300000) then (10) else (15) end),
 CONSTRAINT [PK_zayavka] PRIMARY KEY CLUSTERED 
(
	[id_zayavka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Partners]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Partners]
AS
SELECT        dbo.partner_type.name_partner, dbo.partners.name_company, dbo.partners.Director_name, dbo.partners.phone, dbo.partners.rating, dbo.zayavka.Percentage
FROM            dbo.partner_type INNER JOIN
                         dbo.partners ON dbo.partner_type.id_partner_type = dbo.partners.id_partner_type INNER JOIN
                         dbo.zayavka ON dbo.partners.id_partners = dbo.zayavka.id_partners
GO
/****** Object:  Table [dbo].[cadrs]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cadrs](
	[id_cadr] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_cadrs] PRIMARY KEY CLUSTERED 
(
	[id_cadr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dostups]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dostups](
	[id_dostup] [int] IDENTITY(1,1) NOT NULL,
	[dataTime] [datetime] NULL,
	[id_employee] [int] NULL,
 CONSTRAINT [PK_dostups] PRIMARY KEY CLUSTERED 
(
	[id_dostup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employes]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employes](
	[id_employee] [int] IDENTITY(1,1) NOT NULL,
	[Fio] [nvarchar](max) NULL,
	[date_of_birth] [date] NULL,
	[pasport] [int] NULL,
	[banks_rekv] [nvarchar](max) NULL,
	[having_a_family] [nvarchar](max) NULL,
	[health_status] [nvarchar](max) NULL,
 CONSTRAINT [PK_employes] PRIMARY KEY CLUSTERED 
(
	[id_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managers]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managers](
	[id_manager] [int] IDENTITY(1,1) NOT NULL,
	[id_employee] [int] NULL,
 CONSTRAINT [PK_managers] PRIMARY KEY CLUSTERED 
(
	[id_manager] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_type]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_type](
	[id_type_mat] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[percent_break] [nvarchar](max) NULL,
 CONSTRAINT [PK_material_type] PRIMARY KEY CLUSTERED 
(
	[id_type_mat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materials]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materials](
	[id_material] [int] IDENTITY(1,1) NOT NULL,
	[id_type_mat] [int] NULL,
	[title_mat] [nvarchar](max) NULL,
	[id_postav] [int] NULL,
	[count_box] [int] NULL,
	[unit] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[picture] [image] NULL,
	[price] [decimal](18, 0) NULL,
	[count_sklad] [int] NULL,
	[min_count] [int] NULL,
	[history_count_mat] [nvarchar](max) NULL,
	[id_sklad] [int] NULL,
 CONSTRAINT [PK_materials] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postav_type]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postav_type](
	[id_postav_type] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_postav_type] PRIMARY KEY CLUSTERED 
(
	[id_postav_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postavshiks]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postavshiks](
	[id_postav] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[INN] [nvarchar](max) NULL,
	[history_postav] [nvarchar](max) NULL,
	[id_type_postav] [int] NULL,
 CONSTRAINT [PK_postavshiks] PRIMARY KEY CLUSTERED 
(
	[id_postav] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[id_type] [int] IDENTITY(1,1) NOT NULL,
	[name_type] [nvarchar](50) NULL,
	[koef_type] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[id_type] [int] NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[picture] [image] NULL,
	[min_price] [decimal](18, 0) NULL,
	[size_box] [nvarchar](max) NULL,
	[weight_no_box] [nvarchar](max) NULL,
	[weight_box] [nvarchar](max) NULL,
	[license] [image] NULL,
	[number_standart] [nvarchar](max) NULL,
	[history_min_price] [nvarchar](max) NULL,
	[time] [datetime] NULL,
	[sebeprice] [decimal](18, 0) NULL,
	[number_cesh] [int] NULL,
	[count_people] [int] NULL,
	[id_material] [int] NULL,
	[id_proiz] [int] NULL,
	[articul] [nvarchar](max) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proizvodstvos]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proizvodstvos](
	[id_proiz] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[id_cadr] [int] NULL,
 CONSTRAINT [PK_proizvodstvos] PRIMARY KEY CLUSTERED 
(
	[id_proiz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sklads]    Script Date: 15.01.2025 11:22:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sklads](
	[id_sklad] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_sklads] PRIMARY KEY CLUSTERED 
(
	[id_sklad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[material_type] ON 

INSERT [dbo].[material_type] ([id_type_mat], [name], [percent_break]) VALUES (1, N'Тип материала 1', N'0,10%')
INSERT [dbo].[material_type] ([id_type_mat], [name], [percent_break]) VALUES (2, N'Тип материала 2', N'0,95%')
INSERT [dbo].[material_type] ([id_type_mat], [name], [percent_break]) VALUES (3, N'Тип материала 3', N'0,28%')
INSERT [dbo].[material_type] ([id_type_mat], [name], [percent_break]) VALUES (4, N'Тип материала 4', N'0,55%')
INSERT [dbo].[material_type] ([id_type_mat], [name], [percent_break]) VALUES (5, N'Тип материала 5', N'0,34%')
SET IDENTITY_INSERT [dbo].[material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[partner_type] ON 

INSERT [dbo].[partner_type] ([id_partner_type], [name_partner]) VALUES (1, N'ЗАО
')
INSERT [dbo].[partner_type] ([id_partner_type], [name_partner]) VALUES (2, N'ООО
')
INSERT [dbo].[partner_type] ([id_partner_type], [name_partner]) VALUES (3, N'ПАО
')
INSERT [dbo].[partner_type] ([id_partner_type], [name_partner]) VALUES (4, N'ОАО
')
SET IDENTITY_INSERT [dbo].[partner_type] OFF
GO
SET IDENTITY_INSERT [dbo].[partners] ON 

INSERT [dbo].[partners] ([id_partners], [id_partner_type], [name_company], [ur_adress], [INN], [Director_name], [phone], [email], [logo], [rating], [places_sales], [history], [id_manager]) VALUES (1, 1, N'База Строитель', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2222455179
', N'Иванова Александра Ивановна', N'493 123 45 67', N'aleksandraivanova@ml.ru', NULL, 7, NULL, NULL, NULL)
INSERT [dbo].[partners] ([id_partners], [id_partner_type], [name_company], [ur_adress], [INN], [Director_name], [phone], [email], [logo], [rating], [places_sales], [history], [id_manager]) VALUES (2, 2, N'Паркет 29', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3333888520
', N'Петров Василий Петрович', N'987 123 56 78', N'vppetrov@vl.ru', NULL, 7, NULL, NULL, NULL)
INSERT [dbo].[partners] ([id_partners], [id_partner_type], [name_company], [ur_adress], [INN], [Director_name], [phone], [email], [logo], [rating], [places_sales], [history], [id_manager]) VALUES (3, 3, N'Стройсервис', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4440391035
', N'Соловьев Андрей Николаевич', N'812 223 32 00', N'ansolovev@st.ru', NULL, 7, NULL, NULL, NULL)
INSERT [dbo].[partners] ([id_partners], [id_partner_type], [name_company], [ur_adress], [INN], [Director_name], [phone], [email], [logo], [rating], [places_sales], [history], [id_manager]) VALUES (4, 4, N'Ремонт и отделка', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1111520857', N'Воробьева Екатерина Валерьевна', N'444 222 33 11', N'ekaterina.vorobeva@ml.ru', NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[partners] ([id_partners], [id_partner_type], [name_company], [ur_adress], [INN], [Director_name], [phone], [email], [logo], [rating], [places_sales], [history], [id_manager]) VALUES (5, 1, N'МонтажПро', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5552431140
', N'Степанов Степан Сергеевич', N'912 888 33 33', N'stepanov@stepan.ru', NULL, 10, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([id_type], [name_type], [koef_type]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[Product_type] ([id_type], [name_type], [koef_type]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(18, 2)))
INSERT [dbo].[Product_type] ([id_type], [name_type], [koef_type]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(18, 2)))
INSERT [dbo].[Product_type] ([id_type], [name_type], [koef_type]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product_type] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id_product], [id_type], [name], [description], [picture], [min_price], [size_box], [weight_no_box], [weight_box], [license], [number_standart], [history_min_price], [time], [sebeprice], [number_cesh], [count_people], [id_material], [id_proiz], [articul]) VALUES (2, 3, N'Паркетная доска Ясень темный однополосная 14 мм', NULL, NULL, CAST(4457 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'8758385')
INSERT [dbo].[products] ([id_product], [id_type], [name], [description], [picture], [min_price], [size_box], [weight_no_box], [weight_box], [license], [number_standart], [history_min_price], [time], [sebeprice], [number_cesh], [count_people], [id_material], [id_proiz], [articul]) VALUES (3, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', NULL, NULL, CAST(7331 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'8858958')
INSERT [dbo].[products] ([id_product], [id_type], [name], [description], [picture], [min_price], [size_box], [weight_no_box], [weight_box], [license], [number_standart], [history_min_price], [time], [sebeprice], [number_cesh], [count_people], [id_material], [id_proiz], [articul]) VALUES (4, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', NULL, NULL, CAST(1799 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'7750282')
INSERT [dbo].[products] ([id_product], [id_type], [name], [description], [picture], [min_price], [size_box], [weight_no_box], [weight_box], [license], [number_standart], [history_min_price], [time], [sebeprice], [number_cesh], [count_people], [id_material], [id_proiz], [articul]) VALUES (5, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', NULL, NULL, CAST(3890 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'7028748')
INSERT [dbo].[products] ([id_product], [id_type], [name], [description], [picture], [min_price], [size_box], [weight_no_box], [weight_box], [license], [number_standart], [history_min_price], [time], [sebeprice], [number_cesh], [count_people], [id_material], [id_proiz], [articul]) VALUES (6, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', NULL, NULL, CAST(5451 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'5012543')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[zayavka] ON 

INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (1, 2, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (2, 4, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (3, 5, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (4, 3, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (5, 6, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (6, 4, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (7, 2, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (8, 2, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (9, 3, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (10, 5, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (11, 4, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (12, 2, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (13, 4, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (14, 5, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (15, 2, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[zayavka] ([id_zayavka], [id_product], [id_partners], [count_products], [data]) VALUES (16, 3, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[zayavka] OFF
GO
ALTER TABLE [dbo].[dostups]  WITH CHECK ADD  CONSTRAINT [FK_dostups_employes] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employes] ([id_employee])
GO
ALTER TABLE [dbo].[dostups] CHECK CONSTRAINT [FK_dostups_employes]
GO
ALTER TABLE [dbo].[managers]  WITH CHECK ADD  CONSTRAINT [FK_managers_employes] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employes] ([id_employee])
GO
ALTER TABLE [dbo].[managers] CHECK CONSTRAINT [FK_managers_employes]
GO
ALTER TABLE [dbo].[materials]  WITH CHECK ADD  CONSTRAINT [FK_materials_material_type] FOREIGN KEY([id_type_mat])
REFERENCES [dbo].[material_type] ([id_type_mat])
GO
ALTER TABLE [dbo].[materials] CHECK CONSTRAINT [FK_materials_material_type]
GO
ALTER TABLE [dbo].[materials]  WITH CHECK ADD  CONSTRAINT [FK_materials_postavshiks] FOREIGN KEY([id_postav])
REFERENCES [dbo].[postavshiks] ([id_postav])
GO
ALTER TABLE [dbo].[materials] CHECK CONSTRAINT [FK_materials_postavshiks]
GO
ALTER TABLE [dbo].[materials]  WITH CHECK ADD  CONSTRAINT [FK_materials_sklads] FOREIGN KEY([id_sklad])
REFERENCES [dbo].[sklads] ([id_sklad])
GO
ALTER TABLE [dbo].[materials] CHECK CONSTRAINT [FK_materials_sklads]
GO
ALTER TABLE [dbo].[partners]  WITH CHECK ADD  CONSTRAINT [FK_partners_managers] FOREIGN KEY([id_manager])
REFERENCES [dbo].[managers] ([id_manager])
GO
ALTER TABLE [dbo].[partners] CHECK CONSTRAINT [FK_partners_managers]
GO
ALTER TABLE [dbo].[partners]  WITH CHECK ADD  CONSTRAINT [FK_partners_partner_type] FOREIGN KEY([id_partner_type])
REFERENCES [dbo].[partner_type] ([id_partner_type])
GO
ALTER TABLE [dbo].[partners] CHECK CONSTRAINT [FK_partners_partner_type]
GO
ALTER TABLE [dbo].[postavshiks]  WITH CHECK ADD  CONSTRAINT [FK_postavshiks_postav_type] FOREIGN KEY([id_type_postav])
REFERENCES [dbo].[postav_type] ([id_postav_type])
GO
ALTER TABLE [dbo].[postavshiks] CHECK CONSTRAINT [FK_postavshiks_postav_type]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_materials] FOREIGN KEY([id_material])
REFERENCES [dbo].[materials] ([id_material])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_materials]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_Product_type] FOREIGN KEY([id_type])
REFERENCES [dbo].[Product_type] ([id_type])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_Product_type]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_proizvodstvos] FOREIGN KEY([id_proiz])
REFERENCES [dbo].[proizvodstvos] ([id_proiz])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_proizvodstvos]
GO
ALTER TABLE [dbo].[proizvodstvos]  WITH CHECK ADD  CONSTRAINT [FK_proizvodstvos_cadrs] FOREIGN KEY([id_cadr])
REFERENCES [dbo].[cadrs] ([id_cadr])
GO
ALTER TABLE [dbo].[proizvodstvos] CHECK CONSTRAINT [FK_proizvodstvos_cadrs]
GO
ALTER TABLE [dbo].[zayavka]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_partners] FOREIGN KEY([id_partners])
REFERENCES [dbo].[partners] ([id_partners])
GO
ALTER TABLE [dbo].[zayavka] CHECK CONSTRAINT [FK_zayavka_partners]
GO
ALTER TABLE [dbo].[zayavka]  WITH CHECK ADD  CONSTRAINT [FK_zayavka_products1] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id_product])
GO
ALTER TABLE [dbo].[zayavka] CHECK CONSTRAINT [FK_zayavka_products1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[2] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "partner_type"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 139
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "partners"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 300
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "zayavka"
            Begin Extent = 
               Top = 33
               Left = 605
               Bottom = 235
               Right = 891
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Partners'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Partners'
GO
USE [master]
GO
ALTER DATABASE [MasterPol] SET  READ_WRITE 
GO
