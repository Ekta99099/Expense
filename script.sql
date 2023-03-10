USE [master]
GO
/****** Object:  Database [expense]    Script Date: 11-01-2023 00:15:44 ******/
CREATE DATABASE [expense]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'expense', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS04\MSSQL\DATA\expense.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'expense_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS04\MSSQL\DATA\expense_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [expense] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [expense].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [expense] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [expense] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [expense] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [expense] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [expense] SET ARITHABORT OFF 
GO
ALTER DATABASE [expense] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [expense] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [expense] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [expense] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [expense] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [expense] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [expense] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [expense] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [expense] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [expense] SET  DISABLE_BROKER 
GO
ALTER DATABASE [expense] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [expense] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [expense] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [expense] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [expense] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [expense] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [expense] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [expense] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [expense] SET  MULTI_USER 
GO
ALTER DATABASE [expense] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [expense] SET DB_CHAINING OFF 
GO
ALTER DATABASE [expense] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [expense] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [expense] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [expense] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [expense] SET QUERY_STORE = OFF
GO
USE [expense]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11-01-2023 00:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Categoryname] [varchar](50) NOT NULL,
	[Categorylimit] [int] NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expenselimit]    Script Date: 11-01-2023 00:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expenselimit](
	[Id] [int] NOT NULL,
	[Expensetotal] [int] NOT NULL,
	[Expenselimit] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expenses]    Script Date: 11-01-2023 00:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expenses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Amount] [int] NOT NULL,
	[Cid] [int] NOT NULL,
 CONSTRAINT [PK_expenses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([Cid], [Categoryname], [Categorylimit]) VALUES (5, N'travel', 500)
INSERT [dbo].[category] ([Cid], [Categoryname], [Categorylimit]) VALUES (7, N'clothes', 1500)
INSERT [dbo].[category] ([Cid], [Categoryname], [Categorylimit]) VALUES (9, N'shop', 2100)
INSERT [dbo].[category] ([Cid], [Categoryname], [Categorylimit]) VALUES (12, N'spports', 2000)
INSERT [dbo].[category] ([Cid], [Categoryname], [Categorylimit]) VALUES (15, N'games', 2000)
INSERT [dbo].[category] ([Cid], [Categoryname], [Categorylimit]) VALUES (20, N'food', 5000)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[expenses] ON 

INSERT [dbo].[expenses] ([Id], [Title], [Description], [Date], [Amount], [Cid]) VALUES (18, N'cricket', N'in spports ground ', CAST(N'2023-01-10T21:49:25.513' AS DateTime), 500, 12)
INSERT [dbo].[expenses] ([Id], [Title], [Description], [Date], [Amount], [Cid]) VALUES (19, N'panipuri', N'naitri panipuri in rajkot', CAST(N'2023-01-10T21:51:02.447' AS DateTime), 200, 20)
INSERT [dbo].[expenses] ([Id], [Title], [Description], [Date], [Amount], [Cid]) VALUES (20, N'icecream ', N'from rangoli icecream', CAST(N'2023-01-10T21:51:48.533' AS DateTime), 500, 20)
INSERT [dbo].[expenses] ([Id], [Title], [Description], [Date], [Amount], [Cid]) VALUES (21, N'jeans', N'from zudio', CAST(N'2023-01-10T21:52:35.940' AS DateTime), 1000, 7)
SET IDENTITY_INSERT [dbo].[expenses] OFF
GO
ALTER TABLE [dbo].[expenses]  WITH CHECK ADD  CONSTRAINT [FK_expenses_category] FOREIGN KEY([Cid])
REFERENCES [dbo].[category] ([Cid])
GO
ALTER TABLE [dbo].[expenses] CHECK CONSTRAINT [FK_expenses_category]
GO
USE [master]
GO
ALTER DATABASE [expense] SET  READ_WRITE 
GO
