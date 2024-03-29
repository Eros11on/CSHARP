USE [master]
GO
/****** Object:  Database [ATM]    Script Date: 2020/12/21 22:17:20 ******/
CREATE DATABASE [ATM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATM', FILENAME = N'E:\SQL SEVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATM_log', FILENAME = N'E:\SQL SEVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ATM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATM] SET RECOVERY FULL 
GO
ALTER DATABASE [ATM] SET  MULTI_USER 
GO
ALTER DATABASE [ATM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ATM', N'ON'
GO
ALTER DATABASE [ATM] SET QUERY_STORE = OFF
GO
USE [ATM]
GO
/****** Object:  Table [dbo].[cardinfo]    Script Date: 2020/12/21 22:17:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cardinfo](
	[cardID] [varchar](16) NOT NULL,
	[curType] [varchar](20) NULL,
	[savingType] [varchar](20) NOT NULL,
	[openDate] [datetime] NULL,
	[openMoney] [float] NOT NULL,
	[balance] [float] NOT NULL,
	[pass] [varchar](6) NULL,
	[IsReportLoss] [bit] NULL,
	[customerID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transInfo]    Script Date: 2020/12/21 22:17:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transInfo](
	[transDate] [datetime] NOT NULL,
	[cardID] [varchar](16) NOT NULL,
	[transType] [nchar](10) NOT NULL,
	[transMoney] [float] NOT NULL,
	[remark] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userInfo]    Script Date: 2020/12/21 22:17:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userInfo](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [varchar](20) NOT NULL,
	[pID] [varchar](18) NOT NULL,
	[telephone] [varchar](13) NOT NULL,
	[address] [varchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[cardinfo] ([cardID], [curType], [savingType], [openDate], [openMoney], [balance], [pass], [IsReportLoss], [customerID]) VALUES (N'1010357612121134', N'RMB', N'定期', CAST(N'2020-12-13T18:02:32.000' AS DateTime), 1, 20712, N'555555', 0, 2)
INSERT [dbo].[cardinfo] ([cardID], [curType], [savingType], [openDate], [openMoney], [balance], [pass], [IsReportLoss], [customerID]) VALUES (N'1010357612121140', N'RMB', N'活期', CAST(N'2020-12-16T23:43:35.000' AS DateTime), 200, 1200, N'123456', 0, 4)
INSERT [dbo].[cardinfo] ([cardID], [curType], [savingType], [openDate], [openMoney], [balance], [pass], [IsReportLoss], [customerID]) VALUES (N'1010357612121154', N'RMB', N'活期', CAST(N'2020-12-16T23:54:57.000' AS DateTime), 800, 800, N'666666', 0, 5)
INSERT [dbo].[cardinfo] ([cardID], [curType], [savingType], [openDate], [openMoney], [balance], [pass], [IsReportLoss], [customerID]) VALUES (N'1010357612121164', N'RMB', N'活期', CAST(N'2020-05-15T23:32:17.000' AS DateTime), 1, 1, N'123456', 0, 4)
INSERT [dbo].[cardinfo] ([cardID], [curType], [savingType], [openDate], [openMoney], [balance], [pass], [IsReportLoss], [customerID]) VALUES (N'1010357612121174', N'RMB', N'定活两便', CAST(N'2020-05-15T23:35:23.000' AS DateTime), 1, 1, N'333333', 0, 4)
INSERT [dbo].[cardinfo] ([cardID], [curType], [savingType], [openDate], [openMoney], [balance], [pass], [IsReportLoss], [customerID]) VALUES (N'1010357612345678', N'RMB', N'活期', CAST(N'2020-03-13T18:01:32.000' AS DateTime), 1000, 1000, N'888888', 0, 1)
GO
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-16T23:43:35.000' AS DateTime), N'1010357612121140', N'存入        ', 200, N'开户存入')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-16T23:54:57.000' AS DateTime), N'1010357612121154', N'存入        ', 800, N'开户存入')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-18T21:19:31.000' AS DateTime), N'1010357612121134', N'存入        ', 1000, NULL)
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-18T21:19:53.000' AS DateTime), N'1010357612121134', N'支取        ', 200, NULL)
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-18T21:24:21.000' AS DateTime), N'1010357612121134', N'存入        ', 2000, NULL)
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-18T21:24:29.000' AS DateTime), N'1010357612121134', N'支取        ', 111, NULL)
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-18T21:24:35.000' AS DateTime), N'1010357612121134', N'存入        ', 20000, NULL)
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-03-20T19:16:47.000' AS DateTime), N'1010357612121134', N'存入        ', 22, NULL)
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-05-15T23:32:17.000' AS DateTime), N'1010357612121164', N'存入        ', 1, N'开户存入')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-05-15T23:35:23.000' AS DateTime), N'1010357612121174', N'存入        ', 1, N'开户存入')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T20:37:01.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T20:39:10.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T20:39:20.000' AS DateTime), N'1010357612121134', N'存入        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T20:39:42.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'给1010357612121140转账支出')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:14:32.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:14:41.000' AS DateTime), N'1010357612121134', N'存入        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:14:51.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'给1010357612121134转账支出')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:17:29.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:17:38.000' AS DateTime), N'1010357612121134', N'存入        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:23:36.000' AS DateTime), N'1010357612121134', N'支取        ', 1000, N'无')
INSERT [dbo].[transInfo] ([transDate], [cardID], [transType], [transMoney], [remark]) VALUES (CAST(N'2020-12-21T21:23:44.000' AS DateTime), N'1010357612121134', N'存入        ', 1000, N'无')
GO
SET IDENTITY_INSERT [dbo].[userInfo] ON 

INSERT [dbo].[userInfo] ([customerID], [customerName], [pID], [telephone], [address]) VALUES (1, N'张三', N'123456789022212345', N'010-67898978', N'北京海淀')
INSERT [dbo].[userInfo] ([customerID], [customerName], [pID], [telephone], [address]) VALUES (2, N'李四', N'321245678912345678', N'0478-44443333', N'上海')
INSERT [dbo].[userInfo] ([customerID], [customerName], [pID], [telephone], [address]) VALUES (4, N'王五', N'342111198810191322', N'15976021214', N'武汉')
INSERT [dbo].[userInfo] ([customerID], [customerName], [pID], [telephone], [address]) VALUES (5, N'李六', N'232323198901011632', N'15976021214', N'杭州')
SET IDENTITY_INSERT [dbo].[userInfo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_cardinfo]    Script Date: 2020/12/21 22:17:20 ******/
ALTER TABLE [dbo].[cardinfo] ADD  CONSTRAINT [PK_cardinfo] PRIMARY KEY NONCLUSTERED 
(
	[cardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_transInfo]    Script Date: 2020/12/21 22:17:20 ******/
ALTER TABLE [dbo].[transInfo] ADD  CONSTRAINT [PK_transInfo] PRIMARY KEY NONCLUSTERED 
(
	[transDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [PK_userInfo]    Script Date: 2020/12/21 22:17:20 ******/
ALTER TABLE [dbo].[userInfo] ADD  CONSTRAINT [PK_userInfo] PRIMARY KEY NONCLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cardinfo] ADD  DEFAULT (N'RMB') FOR [curType]
GO
ALTER TABLE [dbo].[cardinfo] ADD  DEFAULT (getdate()) FOR [openDate]
GO
ALTER TABLE [dbo].[cardinfo] ADD  DEFAULT ((0)) FOR [openMoney]
GO
ALTER TABLE [dbo].[cardinfo] ADD  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[cardinfo] ADD  DEFAULT ((888888)) FOR [pass]
GO
ALTER TABLE [dbo].[cardinfo] ADD  DEFAULT ((0)) FOR [IsReportLoss]
GO
ALTER TABLE [dbo].[transInfo] ADD  DEFAULT (getdate()) FOR [transDate]
GO
USE [master]
GO
ALTER DATABASE [ATM] SET  READ_WRITE 
GO
