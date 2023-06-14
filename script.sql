USE [master]
GO
/****** Object:  Database [Exam]    Script Date: 14.06.2023 20:55:29 ******/
CREATE DATABASE [Exam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Exam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Exam.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Exam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Exam_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Exam] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Exam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Exam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Exam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Exam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Exam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Exam] SET ARITHABORT OFF 
GO
ALTER DATABASE [Exam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Exam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Exam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Exam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Exam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Exam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Exam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Exam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Exam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Exam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Exam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Exam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Exam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Exam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Exam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Exam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Exam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Exam] SET  MULTI_USER 
GO
ALTER DATABASE [Exam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Exam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Exam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Exam] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Exam] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Exam] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Exam] SET QUERY_STORE = OFF
GO
USE [Exam]
GO
/****** Object:  Table [dbo].[Markers]    Script Date: 14.06.2023 20:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markers](
	[IDMarker] [int] IDENTITY(1,1) NOT NULL,
	[id_Student] [int] NOT NULL,
	[date] [date] NOT NULL,
	[mark] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Markers] PRIMARY KEY CLUSTERED 
(
	[IDMarker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerDataUsers]    Script Date: 14.06.2023 20:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerDataUsers](
	[IDPerDataUser] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[family] [nvarchar](50) NULL,
 CONSTRAINT [PK_PerDataUsers] PRIMARY KEY CLUSTERED 
(
	[IDPerDataUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 14.06.2023 20:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[IDRoom] [int] IDENTITY(1,1) NOT NULL,
	[numRoom] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[IDRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 14.06.2023 20:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[IDStudent] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[family] [nvarchar](50) NULL,
	[id_Room] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[IDStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.06.2023 20:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](24) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[persData] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Markers] ON 

INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (2, 1, CAST(N'2023-05-22' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (3, 4, CAST(N'2023-07-15' AS Date), N'O')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (4, 2, CAST(N'2023-05-01' AS Date), N'3')
SET IDENTITY_INSERT [dbo].[Markers] OFF
GO
SET IDENTITY_INSERT [dbo].[PerDataUsers] ON 

INSERT [dbo].[PerDataUsers] ([IDPerDataUser], [name], [family]) VALUES (1, N'Николай', N'Игнатьев')
INSERT [dbo].[PerDataUsers] ([IDPerDataUser], [name], [family]) VALUES (2, N'Александра', N'Кратюк')
INSERT [dbo].[PerDataUsers] ([IDPerDataUser], [name], [family]) VALUES (3, N'Гость', N'')
INSERT [dbo].[PerDataUsers] ([IDPerDataUser], [name], [family]) VALUES (4, N'Наталья', N'Пухова')
INSERT [dbo].[PerDataUsers] ([IDPerDataUser], [name], [family]) VALUES (9, N'Валентина', N'Ширина')
SET IDENTITY_INSERT [dbo].[PerDataUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (1, N'303')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (2, N'304')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (3, N'305')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (4, N'306')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (5, N'307')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (6, N'308')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (7, N'309')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (8, N'310')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (9, N'311')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (10, N'312')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1, N'Майер', N'Константин', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (2, N'Евгений', N'Колбас', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (4, N'Николай', N'Игнатьев', 5)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IDUser], [login], [password], [role], [persData]) VALUES (1, N'chair', N'123', N'chair', 1)
INSERT [dbo].[Users] ([IDUser], [login], [password], [role], [persData]) VALUES (2, N'educator', N'123', N'educator', 2)
INSERT [dbo].[Users] ([IDUser], [login], [password], [role], [persData]) VALUES (3, N'guest', N'123', N'guest', 3)
INSERT [dbo].[Users] ([IDUser], [login], [password], [role], [persData]) VALUES (4, N'admin', N'123', N'admin', 4)
INSERT [dbo].[Users] ([IDUser], [login], [password], [role], [persData]) VALUES (7, N'cmd', N'123', N'commandant', 9)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Markers]  WITH CHECK ADD  CONSTRAINT [FK_Markers_Students] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Students] ([IDStudent])
GO
ALTER TABLE [dbo].[Markers] CHECK CONSTRAINT [FK_Markers_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Rooms] FOREIGN KEY([id_Room])
REFERENCES [dbo].[Rooms] ([IDRoom])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Rooms]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_PerDataUsers1] FOREIGN KEY([persData])
REFERENCES [dbo].[PerDataUsers] ([IDPerDataUser])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_PerDataUsers1]
GO
USE [master]
GO
ALTER DATABASE [Exam] SET  READ_WRITE 
GO
