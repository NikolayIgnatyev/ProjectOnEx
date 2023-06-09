USE [master]
GO
/****** Object:  Database [Exam]    Script Date: 22.06.2023 15:28:39 ******/
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
/****** Object:  Table [dbo].[Markers]    Script Date: 22.06.2023 15:28:39 ******/
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
/****** Object:  Table [dbo].[PerDataUsers]    Script Date: 22.06.2023 15:28:39 ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 22.06.2023 15:28:39 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 22.06.2023 15:28:39 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 22.06.2023 15:28:39 ******/
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

INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1328, 1, CAST(N'2023-05-03' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1329, 1, CAST(N'2023-05-04' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1330, 1, CAST(N'2023-05-05' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1331, 1, CAST(N'2023-05-06' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1332, 1, CAST(N'2023-05-07' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1333, 1, CAST(N'2023-05-08' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1334, 1, CAST(N'2023-05-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1335, 1, CAST(N'2023-05-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1336, 1, CAST(N'2023-05-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1337, 1, CAST(N'2023-05-12' AS Date), N'0')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1338, 1, CAST(N'2023-05-13' AS Date), N'0')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1339, 1, CAST(N'2023-05-14' AS Date), N'0')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1340, 9, CAST(N'2023-05-01' AS Date), N'З')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1565, 1, CAST(N'2023-10-01' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1566, 1, CAST(N'2023-10-02' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1567, 1, CAST(N'2023-10-03' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1568, 1, CAST(N'2023-10-04' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1569, 1, CAST(N'2023-10-05' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1570, 1, CAST(N'2023-10-06' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1571, 1, CAST(N'2023-10-07' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1572, 1, CAST(N'2023-10-08' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1573, 1, CAST(N'2023-10-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1574, 1, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1575, 1, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1576, 1, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1577, 1, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1578, 1, CAST(N'2023-10-14' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1579, 1, CAST(N'2023-10-15' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1580, 1, CAST(N'2023-10-16' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1581, 1, CAST(N'2023-10-17' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1582, 1, CAST(N'2023-10-18' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1583, 1, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1584, 1, CAST(N'2023-10-20' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1585, 1, CAST(N'2023-10-21' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1586, 1, CAST(N'2023-10-22' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1587, 1, CAST(N'2023-10-23' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1588, 1, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1589, 1, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1590, 1, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1591, 1, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1592, 1, CAST(N'2023-10-28' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1593, 1, CAST(N'2023-10-29' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1594, 1, CAST(N'2023-10-30' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1595, 9, CAST(N'2023-10-01' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1596, 9, CAST(N'2023-10-02' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1597, 9, CAST(N'2023-10-03' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1598, 9, CAST(N'2023-10-04' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1599, 9, CAST(N'2023-10-05' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1600, 9, CAST(N'2023-10-06' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1601, 9, CAST(N'2023-10-07' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1602, 9, CAST(N'2023-10-08' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1603, 9, CAST(N'2023-10-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1604, 9, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1605, 9, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1606, 9, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1607, 9, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1608, 9, CAST(N'2023-10-14' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1609, 9, CAST(N'2023-10-15' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1610, 9, CAST(N'2023-10-16' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1611, 9, CAST(N'2023-10-17' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1612, 9, CAST(N'2023-10-18' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1613, 9, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1614, 9, CAST(N'2023-10-20' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1615, 9, CAST(N'2023-10-21' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1616, 9, CAST(N'2023-10-22' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1617, 9, CAST(N'2023-10-23' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1618, 9, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1619, 9, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1620, 9, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1621, 9, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1622, 9, CAST(N'2023-10-28' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1623, 9, CAST(N'2023-10-29' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1624, 9, CAST(N'2023-10-30' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1625, 1005, CAST(N'2023-10-01' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1626, 1005, CAST(N'2023-10-02' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1627, 1005, CAST(N'2023-10-03' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1628, 1005, CAST(N'2023-10-04' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1629, 1005, CAST(N'2023-10-05' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1630, 1005, CAST(N'2023-10-06' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1631, 1005, CAST(N'2023-10-07' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1632, 1005, CAST(N'2023-10-08' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1633, 1005, CAST(N'2023-10-09' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1634, 1005, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1635, 1005, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1636, 1005, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1637, 1005, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1638, 1005, CAST(N'2023-10-14' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1639, 1005, CAST(N'2023-10-15' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1640, 1005, CAST(N'2023-10-16' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1641, 1005, CAST(N'2023-10-17' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1642, 1005, CAST(N'2023-10-18' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1643, 1005, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1644, 1005, CAST(N'2023-10-20' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1645, 1005, CAST(N'2023-10-21' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1646, 1005, CAST(N'2023-10-22' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1647, 1005, CAST(N'2023-10-23' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1648, 1005, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1649, 1005, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1650, 1005, CAST(N'2023-10-26' AS Date), N'+')
GO
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1651, 1005, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1652, 1005, CAST(N'2023-10-28' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1653, 1005, CAST(N'2023-10-29' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1654, 1005, CAST(N'2023-10-30' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1655, 1006, CAST(N'2023-10-01' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1656, 1006, CAST(N'2023-10-02' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1657, 1006, CAST(N'2023-10-03' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1658, 1006, CAST(N'2023-10-04' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1659, 1006, CAST(N'2023-10-05' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1660, 1006, CAST(N'2023-10-06' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1661, 1006, CAST(N'2023-10-07' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1662, 1006, CAST(N'2023-10-08' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1663, 1006, CAST(N'2023-10-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1664, 1006, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1665, 1006, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1666, 1006, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1667, 1006, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1668, 1006, CAST(N'2023-10-14' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1669, 1006, CAST(N'2023-10-15' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1670, 1006, CAST(N'2023-10-16' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1671, 1006, CAST(N'2023-10-17' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1672, 1006, CAST(N'2023-10-18' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1673, 1006, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1674, 1006, CAST(N'2023-10-20' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1675, 1006, CAST(N'2023-10-21' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1676, 1006, CAST(N'2023-10-22' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1677, 1006, CAST(N'2023-10-23' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1678, 1006, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1679, 1006, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1680, 1006, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1681, 1006, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1682, 1006, CAST(N'2023-10-28' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1683, 1006, CAST(N'2023-10-29' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1684, 1006, CAST(N'2023-10-30' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1685, 1007, CAST(N'2023-10-01' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1686, 1007, CAST(N'2023-10-02' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1687, 1007, CAST(N'2023-10-03' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1688, 1007, CAST(N'2023-10-04' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1689, 1007, CAST(N'2023-10-05' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1690, 1007, CAST(N'2023-10-06' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1691, 1007, CAST(N'2023-10-07' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1692, 1007, CAST(N'2023-10-08' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1693, 1007, CAST(N'2023-10-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1694, 1007, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1695, 1007, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1696, 1007, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1697, 1007, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1698, 1007, CAST(N'2023-10-14' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1699, 1007, CAST(N'2023-10-15' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1700, 1007, CAST(N'2023-10-16' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1701, 1007, CAST(N'2023-10-17' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1702, 1007, CAST(N'2023-10-18' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1703, 1007, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1704, 1007, CAST(N'2023-10-20' AS Date), N'н')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1705, 1007, CAST(N'2023-10-21' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1706, 1007, CAST(N'2023-10-22' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1707, 1007, CAST(N'2023-10-23' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1708, 1007, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1709, 1007, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1710, 1007, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1711, 1007, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1712, 1007, CAST(N'2023-10-28' AS Date), N'н')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1713, 1007, CAST(N'2023-10-29' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1714, 1007, CAST(N'2023-10-30' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1715, 1008, CAST(N'2023-10-17' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1716, 1008, CAST(N'2023-10-18' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1717, 1008, CAST(N'2023-10-19' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1718, 1008, CAST(N'2023-10-20' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1719, 1008, CAST(N'2023-10-21' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1720, 1008, CAST(N'2023-10-22' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1721, 1008, CAST(N'2023-10-23' AS Date), N'б')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1722, 1008, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1723, 1008, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1724, 1008, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1725, 1008, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1726, 1008, CAST(N'2023-10-28' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1727, 1008, CAST(N'2023-10-29' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1728, 1008, CAST(N'2023-10-30' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1729, 1009, CAST(N'2023-10-01' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1730, 1009, CAST(N'2023-10-02' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1731, 1009, CAST(N'2023-10-03' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1732, 1009, CAST(N'2023-10-04' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1733, 1009, CAST(N'2023-10-05' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1734, 1009, CAST(N'2023-10-06' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1735, 1009, CAST(N'2023-10-07' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1736, 1009, CAST(N'2023-10-08' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1737, 1009, CAST(N'2023-10-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1738, 1009, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1739, 1009, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1740, 1009, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1741, 1009, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1742, 1009, CAST(N'2023-10-14' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1743, 1009, CAST(N'2023-10-15' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1744, 1009, CAST(N'2023-10-16' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1745, 1009, CAST(N'2023-10-17' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1746, 1009, CAST(N'2023-10-18' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1747, 1009, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1748, 1009, CAST(N'2023-10-20' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1749, 1009, CAST(N'2023-10-21' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1750, 1009, CAST(N'2023-10-22' AS Date), N'+')
GO
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1751, 1009, CAST(N'2023-10-23' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1752, 1009, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1753, 1009, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1754, 1009, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1755, 1009, CAST(N'2023-10-27' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1756, 1009, CAST(N'2023-10-28' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1757, 1009, CAST(N'2023-10-29' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1758, 1009, CAST(N'2023-10-30' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1759, 1010, CAST(N'2023-10-01' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1760, 1010, CAST(N'2023-10-02' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1761, 1010, CAST(N'2023-10-03' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1762, 1010, CAST(N'2023-10-04' AS Date), N'н')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1763, 1010, CAST(N'2023-10-05' AS Date), N'н')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1764, 1010, CAST(N'2023-10-06' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1765, 1010, CAST(N'2023-10-07' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1766, 1010, CAST(N'2023-10-08' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1767, 1010, CAST(N'2023-10-09' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1768, 1010, CAST(N'2023-10-10' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1769, 1010, CAST(N'2023-10-11' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1770, 1010, CAST(N'2023-10-12' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1771, 1010, CAST(N'2023-10-13' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1772, 1010, CAST(N'2023-10-14' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1773, 1010, CAST(N'2023-10-15' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1774, 1010, CAST(N'2023-10-16' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1775, 1010, CAST(N'2023-10-17' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1776, 1010, CAST(N'2023-10-18' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1777, 1010, CAST(N'2023-10-19' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1778, 1010, CAST(N'2023-10-20' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1779, 1010, CAST(N'2023-10-21' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1780, 1010, CAST(N'2023-10-22' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1781, 1010, CAST(N'2023-10-23' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1782, 1010, CAST(N'2023-10-24' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1783, 1010, CAST(N'2023-10-25' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1784, 1010, CAST(N'2023-10-26' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1785, 1010, CAST(N'2023-10-27' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1786, 1010, CAST(N'2023-10-28' AS Date), N'+')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1787, 1010, CAST(N'2023-10-29' AS Date), N'3')
INSERT [dbo].[Markers] ([IDMarker], [id_Student], [date], [mark]) VALUES (1788, 1010, CAST(N'2023-10-30' AS Date), N'+')
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
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (11, N'313')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (12, N'314')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (13, N'315')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (14, N'316')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (15, N'318')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (16, N'321')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (17, N'322')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (18, N'323')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (19, N'324')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (20, N'327')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (21, N'328')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (22, N'329')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (23, N'330')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (24, N'331')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (25, N'332')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (26, N'333')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (27, N'334')
INSERT [dbo].[Rooms] ([IDRoom], [numRoom]) VALUES (28, N'335')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1, N'Константин', N'Майер', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (9, N'Евгений', N'Колбас', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1005, N'Алексей', N'Зуев', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1006, N'Андрей', N'Ярцев', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1007, N'Алесандр', N'Коновалов', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1008, N'Даниил', N'Халин', 1)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1009, N'Максим', N'Нейфельд', 2)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1010, N'Данил', N'Подгорбунский', 2)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1011, N'Виктор', N'Мясников', 3)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1012, N'Николай', N'Смолкин', 3)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1013, N'Илья', N'Погребников', 3)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1014, N'Кирилл', N'Усольцев', 3)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1015, N'Александр', N'Кротов', 3)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1016, N'Антон', N'Арлахов', 4)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1017, N'Михаил', N'Павленко', 4)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1018, N'Семен', N'Надоля', 4)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1019, N'Шахриёр', N'Шерализода', 4)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1020, N'Полина', N'Гужавина', 5)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1021, N'Роза', N'Чурсина', 5)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1022, N'Валерия', N'Ядыкина', 6)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1023, N'Александра', N'Шаравина', 6)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1024, N'Евгения', N'Здерева', 6)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1025, N'Серафима', N'Кондакова', 6)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1026, N'Тимофей', N'Резвих', 7)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1027, N'Николай', N'Игнатьев', 7)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1028, N'Вячеслав', N'Струщенко', 7)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1029, N'Сергей', N'Глотов', 7)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1030, N'Анастасия', N'Маскалева', 8)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1031, N'Светлана', N'Сенченко', 8)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1032, N'Ангелина', N'Рояк', 8)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1033, N'Диана', N'Борисова', 8)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1034, N'Алексей', N'Радионов', 9)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1035, N'Данил', N'Кондратьев', 9)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1036, N'Роман', N'Ковалев', 9)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1037, N'Владислав', N'Тиканов', 9)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1038, N'Данил', N'Головцов', 10)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1039, N'Антон', N'Шарапов', 10)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1040, N'Амыр', N'Ооржак', 10)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1041, N'Ринат', N'Яныканов', 10)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1042, N'Мария', N'Богданова', 11)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1043, N'Николь', N'Воробьева', 11)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1044, N'Анастасия', N'Захарова', 11)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1045, N'София', N'Аильчиева', 12)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1046, N'Арина', N'Авдошина', 12)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1047, N'Елизавета', N'Архипова', 12)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1048, N'Дарья', N'Смольникова', 13)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1049, N'Елизавета', N'Зоткина', 13)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1050, N'Екатерина', N'Пакушина', 13)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1051, N'Ангелина', N'Байрамова', 14)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1052, N'Дарья', N'Корнилова', 14)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1053, N'Алинда', N'Шанданова', 14)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1054, N'Кристина', N'Ионова', 15)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1055, N'Мадина', N'Кропочева', 15)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1056, N'Надежда', N'Говорина', 15)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1057, N'Юлия', N'Шерембеева', 16)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1058, N'Замира', N'Масловская', 16)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1059, N'Анастасия', N'Деткова', 17)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1060, N'Александра', N'Киселёва', 17)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1061, N'Наталья', N'Цокова', 17)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1062, N'Неля', N'Габова', 18)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1063, N'Юлия', N'Саламова', 18)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1064, N'Маргарита', N'Кратюк', 19)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1065, N'Кристина', N'Иванова', 19)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1066, N'Маргарита', N'Калугина', 19)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1067, N'Яна', N'Саблина', 20)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1068, N'Анна', N'Самойлова', 20)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1069, N'Марина', N'Тохнина', 20)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1070, N'Ирина', N'Мосина', 20)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1071, N'Валерия', N'Шевцова', 21)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1072, N'Асем', N'Бутабай', 21)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1073, N'Анастасия', N'Красноперова', 21)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1074, N'Дарья', N'Карманова', 21)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1075, N'Анастасия', N'Логвиненко', 22)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1076, N'Анастасия', N'Паутова', 22)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1077, N'Анастасия', N'Логинова', 22)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1078, N'Василина', N'Рябцева', 22)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1079, N'Руслана', N'Феделеш', 22)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1080, N'Виолетта', N'Олейник', 23)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1081, N'Виктория', N'Шапорева', 23)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1082, N'Валентина', N'Соломина', 23)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1083, N'Яна', N'Стребкова', 24)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1084, N'Анна', N'Шаталова', 24)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1085, N'Дарина', N'Опарина', 25)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1086, N'Елизавета', N'Куянова', 25)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1087, N'Виктория', N'Садова', 25)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1088, N'Ульяна', N'Брютова', 25)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1089, N'Юлия', N'Продьма', 26)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1090, N'Златислава', N'Горбунова', 26)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1091, N'Дарья', N'Ламанова', 26)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1092, N'Алиса', N'Данишевская', 26)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1093, N'Лия', N'Мельникова', 27)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1094, N'Валерия', N'Потапова', 27)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1095, N'Ксения', N'Фазулова', 27)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1096, N'Арина', N'Корпейко', 27)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1097, N'Ирина', N'Манулиц', 28)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1098, N'Ульяна', N'Серебренникова', 28)
INSERT [dbo].[Students] ([IDStudent], [name], [family], [id_Room]) VALUES (1099, N'Ксения', N'Слащёва', 28)
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
