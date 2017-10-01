USE [MeetingsDB]
GO
/****** Object:  StoredProcedure [dbo].[UserCreate]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP PROCEDURE [dbo].[UserCreate]
GO
/****** Object:  StoredProcedure [dbo].[CityGetAll]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP PROCEDURE [dbo].[CityGetAll]
GO
/****** Object:  StoredProcedure [dbo].[CityGet]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP PROCEDURE [dbo].[CityGet]
GO
ALTER TABLE [dbo].[UsersInterests] DROP CONSTRAINT [FK_UsersInterests_User]
GO
ALTER TABLE [dbo].[UsersInterests] DROP CONSTRAINT [FK_UsersInterests_Interest]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_User]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Photo]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Goal]
GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_City]
GO
ALTER TABLE [dbo].[PairUser] DROP CONSTRAINT [FK_PairUser_User]
GO
ALTER TABLE [dbo].[PairUser] DROP CONSTRAINT [FK_PairUser_Pairs]
GO
/****** Object:  Table [dbo].[UsersInterests]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[UsersInterests]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Tokens]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Tokens]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Requirement]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Requirement]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Photo]
GO
/****** Object:  Table [dbo].[PairUser]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[PairUser]
GO
/****** Object:  Table [dbo].[Pairs]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Pairs]
GO
/****** Object:  Table [dbo].[Interest]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Interest]
GO
/****** Object:  Table [dbo].[Goal]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[Goal]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP TABLE [dbo].[City]
GO
/****** Object:  User [app]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP USER [app]
GO
USE [master]
GO
/****** Object:  Database [MeetingsDB]    Script Date: 10/1/2017 12:32:26 PM ******/
DROP DATABASE [MeetingsDB]
GO
/****** Object:  Database [MeetingsDB]    Script Date: 10/1/2017 12:32:26 PM ******/
CREATE DATABASE [MeetingsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MeetingsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS01\MSSQL\DATA\MeetingsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MeetingsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS01\MSSQL\DATA\MeetingsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MeetingsDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MeetingsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MeetingsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MeetingsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MeetingsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MeetingsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MeetingsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MeetingsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MeetingsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MeetingsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MeetingsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MeetingsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MeetingsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MeetingsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MeetingsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MeetingsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MeetingsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MeetingsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MeetingsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MeetingsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MeetingsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MeetingsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MeetingsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MeetingsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MeetingsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MeetingsDB] SET  MULTI_USER 
GO
ALTER DATABASE [MeetingsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MeetingsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MeetingsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MeetingsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MeetingsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MeetingsDB] SET QUERY_STORE = OFF
GO
USE [MeetingsDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MeetingsDB]
GO
/****** Object:  User [app]    Script Date: 10/1/2017 12:32:26 PM ******/
CREATE USER [app] FOR LOGIN [app] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [app]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goal]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Goal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Interest]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Interest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pairs]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pairs](
	[id] [int] NOT NULL,
	[dateStart] [datetime] NOT NULL,
	[dateEnd] [datetime] NULL,
 CONSTRAINT [PK_Pairs_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PairUser]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PairUser](
	[userId] [int] NOT NULL,
	[pairId] [int] NOT NULL,
 CONSTRAINT [PK_PairUser] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[pairId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [varbinary](max) NOT NULL,
	[mimetype] [nvarchar](max) NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requirement]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requirement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cityId] [int] NULL,
	[interestId] [int] NULL,
	[ageBefore] [int] NULL,
	[ageAfter] [int] NULL,
	[sex] [int] NULL,
 CONSTRAINT [PK_Requirement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tokens]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[userId] [int] NOT NULL,
	[token] [nvarchar](max) NOT NULL,
	[creationDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[salt] [nvarchar](max) NOT NULL,
	[token] [nvarchar](max) NOT NULL,
	[accessDate] [datetime] NOT NULL,
	[role] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[birthday] [datetime] NOT NULL,
	[sex] [int] NOT NULL,
	[cityId] [int] NOT NULL,
	[photoId] [int] NULL,
	[goalId] [int] NOT NULL,
	[requirementsId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInterests]    Script Date: 10/1/2017 12:32:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInterests](
	[userId] [int] NOT NULL,
	[interestId] [int] NOT NULL,
 CONSTRAINT [PK_UsersInterests] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[interestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [value]) VALUES (3, N'Белгород')
INSERT [dbo].[City] ([id], [value]) VALUES (4, N'Губкин')
INSERT [dbo].[City] ([id], [value]) VALUES (5, N'Старый Оскол')
INSERT [dbo].[City] ([id], [value]) VALUES (6, N'Шебекино')
INSERT [dbo].[City] ([id], [value]) VALUES (7, N'Брянск')
INSERT [dbo].[City] ([id], [value]) VALUES (8, N'Клинцы')
INSERT [dbo].[City] ([id], [value]) VALUES (9, N'Новозыбков')
INSERT [dbo].[City] ([id], [value]) VALUES (10, N'Сельцо')
INSERT [dbo].[City] ([id], [value]) VALUES (11, N'Владимир')
INSERT [dbo].[City] ([id], [value]) VALUES (12, N'Гусь-Хрустальный')
INSERT [dbo].[City] ([id], [value]) VALUES (13, N'Ковров')
INSERT [dbo].[City] ([id], [value]) VALUES (14, N'Муром')
INSERT [dbo].[City] ([id], [value]) VALUES (15, N'Радужный')
INSERT [dbo].[City] ([id], [value]) VALUES (16, N'Воронеж')
INSERT [dbo].[City] ([id], [value]) VALUES (17, N'Воронеж-45')
INSERT [dbo].[City] ([id], [value]) VALUES (18, N'Нововоронеж')
INSERT [dbo].[City] ([id], [value]) VALUES (19, N'Иваново')
INSERT [dbo].[City] ([id], [value]) VALUES (20, N'Калуга')
INSERT [dbo].[City] ([id], [value]) VALUES (21, N'Обнинск')
INSERT [dbo].[City] ([id], [value]) VALUES (22, N'Волгореченск')
INSERT [dbo].[City] ([id], [value]) VALUES (23, N'Курск')
INSERT [dbo].[City] ([id], [value]) VALUES (24, N'Елец')
INSERT [dbo].[City] ([id], [value]) VALUES (25, N'Липецк')
INSERT [dbo].[City] ([id], [value]) VALUES (26, N'Зеленоград')
INSERT [dbo].[City] ([id], [value]) VALUES (27, N'Троицк')
INSERT [dbo].[City] ([id], [value]) VALUES (28, N'Щербинка')
INSERT [dbo].[City] ([id], [value]) VALUES (29, N'Бронницы')
INSERT [dbo].[City] ([id], [value]) VALUES (30, N'Дзержинский')
INSERT [dbo].[City] ([id], [value]) VALUES (31, N'Долгопрудный')
INSERT [dbo].[City] ([id], [value]) VALUES (32, N'Домодедово')
INSERT [dbo].[City] ([id], [value]) VALUES (33, N'Дубна')
INSERT [dbo].[City] ([id], [value]) VALUES (34, N'Железнодорожный')
INSERT [dbo].[City] ([id], [value]) VALUES (35, N'Жуковский')
INSERT [dbo].[City] ([id], [value]) VALUES (36, N'Звенигород')
INSERT [dbo].[City] ([id], [value]) VALUES (37, N'Ивантеевка')
INSERT [dbo].[City] ([id], [value]) VALUES (38, N'Климовск')
INSERT [dbo].[City] ([id], [value]) VALUES (39, N'Коломна')
INSERT [dbo].[City] ([id], [value]) VALUES (40, N'Королев')
INSERT [dbo].[City] ([id], [value]) VALUES (41, N'Котельники')
INSERT [dbo].[City] ([id], [value]) VALUES (42, N'Красноармейск')
INSERT [dbo].[City] ([id], [value]) VALUES (43, N'Краснознаменск')
INSERT [dbo].[City] ([id], [value]) VALUES (44, N'Лобня')
INSERT [dbo].[City] ([id], [value]) VALUES (45, N'Лосино-Петровский')
INSERT [dbo].[City] ([id], [value]) VALUES (46, N'Лыткарино')
INSERT [dbo].[City] ([id], [value]) VALUES (47, N'Орехово-Зуево')
INSERT [dbo].[City] ([id], [value]) VALUES (48, N'Подольск')
INSERT [dbo].[City] ([id], [value]) VALUES (49, N'Протвино')
INSERT [dbo].[City] ([id], [value]) VALUES (50, N'Пущино')
INSERT [dbo].[City] ([id], [value]) VALUES (51, N'Реутов')
INSERT [dbo].[City] ([id], [value]) VALUES (52, N'Рошаль')
INSERT [dbo].[City] ([id], [value]) VALUES (53, N'Серпухов')
INSERT [dbo].[City] ([id], [value]) VALUES (54, N'Фрязино')
INSERT [dbo].[City] ([id], [value]) VALUES (55, N'Химки')
INSERT [dbo].[City] ([id], [value]) VALUES (56, N'Электрогорск')
INSERT [dbo].[City] ([id], [value]) VALUES (57, N'Электросталь')
INSERT [dbo].[City] ([id], [value]) VALUES (58, N'Юбилейный')
INSERT [dbo].[City] ([id], [value]) VALUES (59, N'Ливны')
INSERT [dbo].[City] ([id], [value]) VALUES (60, N'Мценск')
INSERT [dbo].[City] ([id], [value]) VALUES (61, N'Орел')
INSERT [dbo].[City] ([id], [value]) VALUES (62, N'Касимов')
INSERT [dbo].[City] ([id], [value]) VALUES (63, N'Рязань')
INSERT [dbo].[City] ([id], [value]) VALUES (64, N'Сасово')
INSERT [dbo].[City] ([id], [value]) VALUES (65, N'Скопин')
INSERT [dbo].[City] ([id], [value]) VALUES (66, N'Десногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (67, N'Смоленск')
INSERT [dbo].[City] ([id], [value]) VALUES (68, N'Кирсанов')
INSERT [dbo].[City] ([id], [value]) VALUES (69, N'Котовск')
INSERT [dbo].[City] ([id], [value]) VALUES (70, N'Мичуринск')
INSERT [dbo].[City] ([id], [value]) VALUES (71, N'Моршанск')
INSERT [dbo].[City] ([id], [value]) VALUES (72, N'Рассказово')
INSERT [dbo].[City] ([id], [value]) VALUES (73, N'Тамбов')
INSERT [dbo].[City] ([id], [value]) VALUES (74, N'Уварово')
INSERT [dbo].[City] ([id], [value]) VALUES (75, N'Вышний Волочек')
INSERT [dbo].[City] ([id], [value]) VALUES (76, N'Кимры')
INSERT [dbo].[City] ([id], [value]) VALUES (77, N'Нелидово')
INSERT [dbo].[City] ([id], [value]) VALUES (78, N'Ржев')
INSERT [dbo].[City] ([id], [value]) VALUES (79, N'Тверь')
INSERT [dbo].[City] ([id], [value]) VALUES (80, N'Торжок')
INSERT [dbo].[City] ([id], [value]) VALUES (81, N'Донской')
INSERT [dbo].[City] ([id], [value]) VALUES (82, N'Тула')
INSERT [dbo].[City] ([id], [value]) VALUES (83, N'Переславль-Залесский')
INSERT [dbo].[City] ([id], [value]) VALUES (84, N'Ярославль')
INSERT [dbo].[City] ([id], [value]) VALUES (85, N'Адыгейск')
INSERT [dbo].[City] ([id], [value]) VALUES (86, N'Майкоп')
INSERT [dbo].[City] ([id], [value]) VALUES (87, N'Астрахань')
INSERT [dbo].[City] ([id], [value]) VALUES (88, N'Знаменск')
INSERT [dbo].[City] ([id], [value]) VALUES (89, N'Волгоград')
INSERT [dbo].[City] ([id], [value]) VALUES (90, N'Волжский')
INSERT [dbo].[City] ([id], [value]) VALUES (91, N'Камышин')
INSERT [dbo].[City] ([id], [value]) VALUES (92, N'Михайловка')
INSERT [dbo].[City] ([id], [value]) VALUES (93, N'Урюпинск')
INSERT [dbo].[City] ([id], [value]) VALUES (94, N'Фролово')
INSERT [dbo].[City] ([id], [value]) VALUES (95, N'Элиста')
INSERT [dbo].[City] ([id], [value]) VALUES (96, N'Армавир')
INSERT [dbo].[City] ([id], [value]) VALUES (97, N'Геленджик')
INSERT [dbo].[City] ([id], [value]) VALUES (98, N'Горячий Ключ')
INSERT [dbo].[City] ([id], [value]) VALUES (99, N'Краснодар')
INSERT [dbo].[City] ([id], [value]) VALUES (100, N'Новороссийск')
INSERT [dbo].[City] ([id], [value]) VALUES (101, N'Сочи')
GO
INSERT [dbo].[City] ([id], [value]) VALUES (102, N'Азов')
INSERT [dbo].[City] ([id], [value]) VALUES (103, N'Батайск')
INSERT [dbo].[City] ([id], [value]) VALUES (104, N'Волгодонск')
INSERT [dbo].[City] ([id], [value]) VALUES (105, N'Гуково')
INSERT [dbo].[City] ([id], [value]) VALUES (106, N'Донецк')
INSERT [dbo].[City] ([id], [value]) VALUES (107, N'Зверево')
INSERT [dbo].[City] ([id], [value]) VALUES (108, N'Каменск-Шахтинский')
INSERT [dbo].[City] ([id], [value]) VALUES (109, N'Новочеркасск')
INSERT [dbo].[City] ([id], [value]) VALUES (110, N'Новошахтинск')
INSERT [dbo].[City] ([id], [value]) VALUES (111, N'Ростов-на-Дону')
INSERT [dbo].[City] ([id], [value]) VALUES (112, N'Таганрог')
INSERT [dbo].[City] ([id], [value]) VALUES (113, N'Шахты')
INSERT [dbo].[City] ([id], [value]) VALUES (114, N'Архангельск')
INSERT [dbo].[City] ([id], [value]) VALUES (115, N'Коряжма')
INSERT [dbo].[City] ([id], [value]) VALUES (116, N'Мирный')
INSERT [dbo].[City] ([id], [value]) VALUES (117, N'Новодвинск')
INSERT [dbo].[City] ([id], [value]) VALUES (118, N'Северодвинск')
INSERT [dbo].[City] ([id], [value]) VALUES (119, N'Вологда')
INSERT [dbo].[City] ([id], [value]) VALUES (120, N'Череповец')
INSERT [dbo].[City] ([id], [value]) VALUES (121, N'Калининград город')
INSERT [dbo].[City] ([id], [value]) VALUES (122, N'Ладушкин')
INSERT [dbo].[City] ([id], [value]) VALUES (123, N'Мамоново')
INSERT [dbo].[City] ([id], [value]) VALUES (124, N'Пионерский')
INSERT [dbo].[City] ([id], [value]) VALUES (125, N'Светлый')
INSERT [dbo].[City] ([id], [value]) VALUES (126, N'Советск')
INSERT [dbo].[City] ([id], [value]) VALUES (127, N'Костомукша')
INSERT [dbo].[City] ([id], [value]) VALUES (128, N'Петрозаводск')
INSERT [dbo].[City] ([id], [value]) VALUES (129, N'Сортавала')
INSERT [dbo].[City] ([id], [value]) VALUES (130, N'Воркута')
INSERT [dbo].[City] ([id], [value]) VALUES (131, N'Вуктыл')
INSERT [dbo].[City] ([id], [value]) VALUES (132, N'Инта')
INSERT [dbo].[City] ([id], [value]) VALUES (133, N'Печора')
INSERT [dbo].[City] ([id], [value]) VALUES (134, N'Сосногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (135, N'Сыктывкар')
INSERT [dbo].[City] ([id], [value]) VALUES (136, N'Усинск')
INSERT [dbo].[City] ([id], [value]) VALUES (137, N'Ухта')
INSERT [dbo].[City] ([id], [value]) VALUES (138, N'Сосновый Бор')
INSERT [dbo].[City] ([id], [value]) VALUES (139, N'Апатиты')
INSERT [dbo].[City] ([id], [value]) VALUES (140, N'Гаджиево')
INSERT [dbo].[City] ([id], [value]) VALUES (141, N'Заозерск')
INSERT [dbo].[City] ([id], [value]) VALUES (142, N'Кандалакша')
INSERT [dbo].[City] ([id], [value]) VALUES (143, N'Кировск')
INSERT [dbo].[City] ([id], [value]) VALUES (144, N'Мончегорск')
INSERT [dbo].[City] ([id], [value]) VALUES (145, N'Мурманск')
INSERT [dbo].[City] ([id], [value]) VALUES (146, N'Оленегорск')
INSERT [dbo].[City] ([id], [value]) VALUES (147, N'Оленегорск-1')
INSERT [dbo].[City] ([id], [value]) VALUES (148, N'Оленегорск-2')
INSERT [dbo].[City] ([id], [value]) VALUES (149, N'Оленегорск-4')
INSERT [dbo].[City] ([id], [value]) VALUES (150, N'Островной')
INSERT [dbo].[City] ([id], [value]) VALUES (151, N'Полярные Зори')
INSERT [dbo].[City] ([id], [value]) VALUES (152, N'Полярный')
INSERT [dbo].[City] ([id], [value]) VALUES (153, N'Североморск')
INSERT [dbo].[City] ([id], [value]) VALUES (154, N'Снежногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (155, N'Нарьян-Мар')
INSERT [dbo].[City] ([id], [value]) VALUES (156, N'Великий Новгород')
INSERT [dbo].[City] ([id], [value]) VALUES (157, N'Великие Луки')
INSERT [dbo].[City] ([id], [value]) VALUES (158, N'Псков')
INSERT [dbo].[City] ([id], [value]) VALUES (159, N'Зеленогорск')
INSERT [dbo].[City] ([id], [value]) VALUES (160, N'Колпино')
INSERT [dbo].[City] ([id], [value]) VALUES (161, N'Красное Село')
INSERT [dbo].[City] ([id], [value]) VALUES (162, N'Кронштадт')
INSERT [dbo].[City] ([id], [value]) VALUES (163, N'Ломоносов')
INSERT [dbo].[City] ([id], [value]) VALUES (164, N'Павловск')
INSERT [dbo].[City] ([id], [value]) VALUES (165, N'Петергоф')
INSERT [dbo].[City] ([id], [value]) VALUES (166, N'Пушкин')
INSERT [dbo].[City] ([id], [value]) VALUES (167, N'Сестрорецк')
INSERT [dbo].[City] ([id], [value]) VALUES (168, N'Белогорск')
INSERT [dbo].[City] ([id], [value]) VALUES (169, N'Благовещенск')
INSERT [dbo].[City] ([id], [value]) VALUES (170, N'Зея')
INSERT [dbo].[City] ([id], [value]) VALUES (171, N'Райчихинск')
INSERT [dbo].[City] ([id], [value]) VALUES (172, N'Свободный')
INSERT [dbo].[City] ([id], [value]) VALUES (173, N'Тында')
INSERT [dbo].[City] ([id], [value]) VALUES (174, N'Шимановск')
INSERT [dbo].[City] ([id], [value]) VALUES (175, N'Биробиджан')
INSERT [dbo].[City] ([id], [value]) VALUES (176, N'Вилючинск')
INSERT [dbo].[City] ([id], [value]) VALUES (177, N'Петропавловск-Камчатский')
INSERT [dbo].[City] ([id], [value]) VALUES (178, N'Магадан')
INSERT [dbo].[City] ([id], [value]) VALUES (179, N'Арсеньев')
INSERT [dbo].[City] ([id], [value]) VALUES (180, N'Артем')
INSERT [dbo].[City] ([id], [value]) VALUES (181, N'Большой Камень')
INSERT [dbo].[City] ([id], [value]) VALUES (182, N'Владивосток')
INSERT [dbo].[City] ([id], [value]) VALUES (183, N'Дальнегорск')
INSERT [dbo].[City] ([id], [value]) VALUES (184, N'Дальнереченск')
INSERT [dbo].[City] ([id], [value]) VALUES (185, N'Лесозаводск')
INSERT [dbo].[City] ([id], [value]) VALUES (186, N'Находка')
INSERT [dbo].[City] ([id], [value]) VALUES (187, N'Партизанск')
INSERT [dbo].[City] ([id], [value]) VALUES (188, N'Спасск-Дальний')
INSERT [dbo].[City] ([id], [value]) VALUES (189, N'Уссурийск')
INSERT [dbo].[City] ([id], [value]) VALUES (190, N'Фокино')
INSERT [dbo].[City] ([id], [value]) VALUES (191, N'Нерюнгри')
INSERT [dbo].[City] ([id], [value]) VALUES (192, N'Якутск')
INSERT [dbo].[City] ([id], [value]) VALUES (193, N'Южно-Сахалинск')
INSERT [dbo].[City] ([id], [value]) VALUES (194, N'Амурск')
INSERT [dbo].[City] ([id], [value]) VALUES (195, N'Бикин')
INSERT [dbo].[City] ([id], [value]) VALUES (196, N'Комсомольск-на-Амуре')
INSERT [dbo].[City] ([id], [value]) VALUES (197, N'Николаевск-на-Амуре')
INSERT [dbo].[City] ([id], [value]) VALUES (198, N'Советская Гавань')
INSERT [dbo].[City] ([id], [value]) VALUES (199, N'Хабаровск')
INSERT [dbo].[City] ([id], [value]) VALUES (200, N'Анадырь')
INSERT [dbo].[City] ([id], [value]) VALUES (201, N'Горно-Алтайск')
GO
INSERT [dbo].[City] ([id], [value]) VALUES (202, N'Алейск')
INSERT [dbo].[City] ([id], [value]) VALUES (203, N'Барнаул')
INSERT [dbo].[City] ([id], [value]) VALUES (204, N'Белокуриха')
INSERT [dbo].[City] ([id], [value]) VALUES (205, N'Бийск')
INSERT [dbo].[City] ([id], [value]) VALUES (206, N'Заринск')
INSERT [dbo].[City] ([id], [value]) VALUES (207, N'Камень-на-Оби')
INSERT [dbo].[City] ([id], [value]) VALUES (208, N'Новоалтайск')
INSERT [dbo].[City] ([id], [value]) VALUES (209, N'Рубцовск')
INSERT [dbo].[City] ([id], [value]) VALUES (210, N'Славгород')
INSERT [dbo].[City] ([id], [value]) VALUES (211, N'Яровое')
INSERT [dbo].[City] ([id], [value]) VALUES (212, N'Северобайкальск')
INSERT [dbo].[City] ([id], [value]) VALUES (213, N'Улан-Удэ')
INSERT [dbo].[City] ([id], [value]) VALUES (214, N'Чита')
INSERT [dbo].[City] ([id], [value]) VALUES (215, N'Ангарск')
INSERT [dbo].[City] ([id], [value]) VALUES (216, N'Бодайбо')
INSERT [dbo].[City] ([id], [value]) VALUES (217, N'Братск')
INSERT [dbo].[City] ([id], [value]) VALUES (218, N'Зима')
INSERT [dbo].[City] ([id], [value]) VALUES (219, N'Иркутск')
INSERT [dbo].[City] ([id], [value]) VALUES (220, N'Иркутск-45')
INSERT [dbo].[City] ([id], [value]) VALUES (221, N'Нижнеудинск')
INSERT [dbo].[City] ([id], [value]) VALUES (222, N'Саянск')
INSERT [dbo].[City] ([id], [value]) VALUES (223, N'Свирск')
INSERT [dbo].[City] ([id], [value]) VALUES (224, N'Тайшет')
INSERT [dbo].[City] ([id], [value]) VALUES (225, N'Тулун')
INSERT [dbo].[City] ([id], [value]) VALUES (226, N'Усолье-Сибирское')
INSERT [dbo].[City] ([id], [value]) VALUES (227, N'Усть-Илимск')
INSERT [dbo].[City] ([id], [value]) VALUES (228, N'Усть-Кут')
INSERT [dbo].[City] ([id], [value]) VALUES (229, N'Черемхово')
INSERT [dbo].[City] ([id], [value]) VALUES (230, N'Шелехов')
INSERT [dbo].[City] ([id], [value]) VALUES (231, N'Анжеро-Судженск')
INSERT [dbo].[City] ([id], [value]) VALUES (232, N'Белово')
INSERT [dbo].[City] ([id], [value]) VALUES (233, N'Березовский')
INSERT [dbo].[City] ([id], [value]) VALUES (234, N'Калтан')
INSERT [dbo].[City] ([id], [value]) VALUES (235, N'Кемерово')
INSERT [dbo].[City] ([id], [value]) VALUES (236, N'Киселевск')
INSERT [dbo].[City] ([id], [value]) VALUES (237, N'Ленинск-Кузнецкий')
INSERT [dbo].[City] ([id], [value]) VALUES (238, N'Междуреченск')
INSERT [dbo].[City] ([id], [value]) VALUES (239, N'Мыски')
INSERT [dbo].[City] ([id], [value]) VALUES (240, N'Новокузнецк')
INSERT [dbo].[City] ([id], [value]) VALUES (241, N'Осинники')
INSERT [dbo].[City] ([id], [value]) VALUES (242, N'Полысаево')
INSERT [dbo].[City] ([id], [value]) VALUES (243, N'Прокопьевск')
INSERT [dbo].[City] ([id], [value]) VALUES (244, N'Тайга')
INSERT [dbo].[City] ([id], [value]) VALUES (245, N'Юрга')
INSERT [dbo].[City] ([id], [value]) VALUES (246, N'Ачинск')
INSERT [dbo].[City] ([id], [value]) VALUES (247, N'Боготол')
INSERT [dbo].[City] ([id], [value]) VALUES (248, N'Бородино')
INSERT [dbo].[City] ([id], [value]) VALUES (249, N'Дивногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (250, N'Енисейск')
INSERT [dbo].[City] ([id], [value]) VALUES (251, N'Железногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (252, N'Заозерный')
INSERT [dbo].[City] ([id], [value]) VALUES (253, N'Зеленогорск')
INSERT [dbo].[City] ([id], [value]) VALUES (254, N'Кайеркан')
INSERT [dbo].[City] ([id], [value]) VALUES (255, N'Канск')
INSERT [dbo].[City] ([id], [value]) VALUES (256, N'Красноярск')
INSERT [dbo].[City] ([id], [value]) VALUES (257, N'Лесосибирск')
INSERT [dbo].[City] ([id], [value]) VALUES (258, N'Минусинск')
INSERT [dbo].[City] ([id], [value]) VALUES (259, N'Назарово')
INSERT [dbo].[City] ([id], [value]) VALUES (260, N'Норильск')
INSERT [dbo].[City] ([id], [value]) VALUES (261, N'Сосновоборск')
INSERT [dbo].[City] ([id], [value]) VALUES (262, N'Талнах')
INSERT [dbo].[City] ([id], [value]) VALUES (263, N'Шарыпово')
INSERT [dbo].[City] ([id], [value]) VALUES (264, N'Барабинск')
INSERT [dbo].[City] ([id], [value]) VALUES (265, N'Бердск')
INSERT [dbo].[City] ([id], [value]) VALUES (266, N'Искитим')
INSERT [dbo].[City] ([id], [value]) VALUES (267, N'Куйбышев')
INSERT [dbo].[City] ([id], [value]) VALUES (268, N'Новосибирск')
INSERT [dbo].[City] ([id], [value]) VALUES (269, N'Обь')
INSERT [dbo].[City] ([id], [value]) VALUES (270, N'Татарск')
INSERT [dbo].[City] ([id], [value]) VALUES (271, N'Омск')
INSERT [dbo].[City] ([id], [value]) VALUES (272, N'Кедровый')
INSERT [dbo].[City] ([id], [value]) VALUES (273, N'Северск')
INSERT [dbo].[City] ([id], [value]) VALUES (274, N'Стрежевой')
INSERT [dbo].[City] ([id], [value]) VALUES (275, N'Томск')
INSERT [dbo].[City] ([id], [value]) VALUES (276, N'Ак-Довурак')
INSERT [dbo].[City] ([id], [value]) VALUES (277, N'Кызыл')
INSERT [dbo].[City] ([id], [value]) VALUES (278, N'Абаза')
INSERT [dbo].[City] ([id], [value]) VALUES (279, N'Абакан')
INSERT [dbo].[City] ([id], [value]) VALUES (280, N'Саяногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (281, N'Сорск')
INSERT [dbo].[City] ([id], [value]) VALUES (282, N'Черногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (283, N'Курган')
INSERT [dbo].[City] ([id], [value]) VALUES (284, N'Шадринск')
INSERT [dbo].[City] ([id], [value]) VALUES (285, N'Алапаевск')
INSERT [dbo].[City] ([id], [value]) VALUES (286, N'Асбест')
INSERT [dbo].[City] ([id], [value]) VALUES (287, N'Березовский')
INSERT [dbo].[City] ([id], [value]) VALUES (288, N'Верхний Тагил')
INSERT [dbo].[City] ([id], [value]) VALUES (289, N'Верхняя Пышма')
INSERT [dbo].[City] ([id], [value]) VALUES (290, N'Верхняя Тура')
INSERT [dbo].[City] ([id], [value]) VALUES (291, N'Волчанск')
INSERT [dbo].[City] ([id], [value]) VALUES (292, N'Дегтярск')
INSERT [dbo].[City] ([id], [value]) VALUES (293, N'Екатеринбург')
INSERT [dbo].[City] ([id], [value]) VALUES (294, N'Заречный')
INSERT [dbo].[City] ([id], [value]) VALUES (295, N'Ивдель')
INSERT [dbo].[City] ([id], [value]) VALUES (296, N'Ирбит')
INSERT [dbo].[City] ([id], [value]) VALUES (297, N'Каменск-Уральский')
INSERT [dbo].[City] ([id], [value]) VALUES (298, N'Камышлов')
INSERT [dbo].[City] ([id], [value]) VALUES (299, N'Карпинск')
INSERT [dbo].[City] ([id], [value]) VALUES (300, N'Качканар')
INSERT [dbo].[City] ([id], [value]) VALUES (301, N'Кировград')
GO
INSERT [dbo].[City] ([id], [value]) VALUES (302, N'Краснотурьинск')
INSERT [dbo].[City] ([id], [value]) VALUES (303, N'Красноуральск')
INSERT [dbo].[City] ([id], [value]) VALUES (304, N'Красноуфимск')
INSERT [dbo].[City] ([id], [value]) VALUES (305, N'Кушва')
INSERT [dbo].[City] ([id], [value]) VALUES (306, N'Лесной')
INSERT [dbo].[City] ([id], [value]) VALUES (307, N'Нижний Тагил')
INSERT [dbo].[City] ([id], [value]) VALUES (308, N'Нижняя Салда')
INSERT [dbo].[City] ([id], [value]) VALUES (309, N'Нижняя Тура')
INSERT [dbo].[City] ([id], [value]) VALUES (310, N'Новоуральск')
INSERT [dbo].[City] ([id], [value]) VALUES (311, N'Первоуральск')
INSERT [dbo].[City] ([id], [value]) VALUES (312, N'Полевской')
INSERT [dbo].[City] ([id], [value]) VALUES (313, N'Ревда')
INSERT [dbo].[City] ([id], [value]) VALUES (314, N'Североуральск')
INSERT [dbo].[City] ([id], [value]) VALUES (315, N'Серов')
INSERT [dbo].[City] ([id], [value]) VALUES (316, N'Среднеуральск')
INSERT [dbo].[City] ([id], [value]) VALUES (317, N'Тобольск')
INSERT [dbo].[City] ([id], [value]) VALUES (318, N'Тюмень')
INSERT [dbo].[City] ([id], [value]) VALUES (319, N'Белоярский')
INSERT [dbo].[City] ([id], [value]) VALUES (320, N'Когалым')
INSERT [dbo].[City] ([id], [value]) VALUES (321, N'Лангепас')
INSERT [dbo].[City] ([id], [value]) VALUES (322, N'Мегион')
INSERT [dbo].[City] ([id], [value]) VALUES (323, N'Нефтеюганск')
INSERT [dbo].[City] ([id], [value]) VALUES (324, N'Нижневартовск')
INSERT [dbo].[City] ([id], [value]) VALUES (325, N'Нягань')
INSERT [dbo].[City] ([id], [value]) VALUES (326, N'Покачи')
INSERT [dbo].[City] ([id], [value]) VALUES (327, N'Пыть-Ях')
INSERT [dbo].[City] ([id], [value]) VALUES (328, N'Радужный')
INSERT [dbo].[City] ([id], [value]) VALUES (329, N'Сургут')
INSERT [dbo].[City] ([id], [value]) VALUES (330, N'Урай')
INSERT [dbo].[City] ([id], [value]) VALUES (331, N'Ханты-Мансийск')
INSERT [dbo].[City] ([id], [value]) VALUES (332, N'Югорск')
INSERT [dbo].[City] ([id], [value]) VALUES (333, N'Верхний Уфалей')
INSERT [dbo].[City] ([id], [value]) VALUES (334, N'Златоуст')
INSERT [dbo].[City] ([id], [value]) VALUES (335, N'Карабаш')
INSERT [dbo].[City] ([id], [value]) VALUES (336, N'Копейск')
INSERT [dbo].[City] ([id], [value]) VALUES (337, N'Кыштым')
INSERT [dbo].[City] ([id], [value]) VALUES (338, N'Магнитогорск')
INSERT [dbo].[City] ([id], [value]) VALUES (339, N'Миасс')
INSERT [dbo].[City] ([id], [value]) VALUES (340, N'Озерск')
INSERT [dbo].[City] ([id], [value]) VALUES (341, N'Снежинск')
INSERT [dbo].[City] ([id], [value]) VALUES (342, N'Трехгорный')
INSERT [dbo].[City] ([id], [value]) VALUES (343, N'Трехгорный-1')
INSERT [dbo].[City] ([id], [value]) VALUES (344, N'Троицк')
INSERT [dbo].[City] ([id], [value]) VALUES (345, N'Усть-Катав')
INSERT [dbo].[City] ([id], [value]) VALUES (346, N'Чебаркуль')
INSERT [dbo].[City] ([id], [value]) VALUES (347, N'Челябинск')
INSERT [dbo].[City] ([id], [value]) VALUES (348, N'Южноуральск')
INSERT [dbo].[City] ([id], [value]) VALUES (349, N'Губкинский')
INSERT [dbo].[City] ([id], [value]) VALUES (350, N'Лабытнанги')
INSERT [dbo].[City] ([id], [value]) VALUES (351, N'Муравленко')
INSERT [dbo].[City] ([id], [value]) VALUES (352, N'Надым')
INSERT [dbo].[City] ([id], [value]) VALUES (353, N'Новый Уренгой')
INSERT [dbo].[City] ([id], [value]) VALUES (354, N'Ноябрьск')
INSERT [dbo].[City] ([id], [value]) VALUES (355, N'Салехард')
INSERT [dbo].[City] ([id], [value]) VALUES (356, N'Агидель')
INSERT [dbo].[City] ([id], [value]) VALUES (357, N'Кумертау')
INSERT [dbo].[City] ([id], [value]) VALUES (358, N'Межгорье')
INSERT [dbo].[City] ([id], [value]) VALUES (359, N'Нефтекамск')
INSERT [dbo].[City] ([id], [value]) VALUES (360, N'Октябрьский')
INSERT [dbo].[City] ([id], [value]) VALUES (361, N'Салават')
INSERT [dbo].[City] ([id], [value]) VALUES (362, N'Сибай')
INSERT [dbo].[City] ([id], [value]) VALUES (363, N'Стерлитамак')
INSERT [dbo].[City] ([id], [value]) VALUES (364, N'Уфа')
INSERT [dbo].[City] ([id], [value]) VALUES (365, N'Киров')
INSERT [dbo].[City] ([id], [value]) VALUES (366, N'Волжск')
INSERT [dbo].[City] ([id], [value]) VALUES (367, N'Йошкар-Ола')
INSERT [dbo].[City] ([id], [value]) VALUES (368, N'Козьмодемьянск')
INSERT [dbo].[City] ([id], [value]) VALUES (369, N'Саранск')
INSERT [dbo].[City] ([id], [value]) VALUES (370, N'Арзамас')
INSERT [dbo].[City] ([id], [value]) VALUES (371, N'Бор')
INSERT [dbo].[City] ([id], [value]) VALUES (372, N'Выкса')
INSERT [dbo].[City] ([id], [value]) VALUES (373, N'Дзержинск')
INSERT [dbo].[City] ([id], [value]) VALUES (374, N'Нижний Новгород')
INSERT [dbo].[City] ([id], [value]) VALUES (375, N'Саров')
INSERT [dbo].[City] ([id], [value]) VALUES (376, N'Семенов')
INSERT [dbo].[City] ([id], [value]) VALUES (377, N'Бугуруслан')
INSERT [dbo].[City] ([id], [value]) VALUES (378, N'Бузулук')
INSERT [dbo].[City] ([id], [value]) VALUES (379, N'Гай')
INSERT [dbo].[City] ([id], [value]) VALUES (380, N'Кувандык')
INSERT [dbo].[City] ([id], [value]) VALUES (381, N'Медногорск')
INSERT [dbo].[City] ([id], [value]) VALUES (382, N'Новотроицк')
INSERT [dbo].[City] ([id], [value]) VALUES (383, N'Оренбург')
INSERT [dbo].[City] ([id], [value]) VALUES (384, N'Орск')
INSERT [dbo].[City] ([id], [value]) VALUES (385, N'Сорочинск')
INSERT [dbo].[City] ([id], [value]) VALUES (386, N'Заречный')
INSERT [dbo].[City] ([id], [value]) VALUES (387, N'Пенза')
INSERT [dbo].[City] ([id], [value]) VALUES (388, N'Александровск')
INSERT [dbo].[City] ([id], [value]) VALUES (389, N'Березники')
INSERT [dbo].[City] ([id], [value]) VALUES (390, N'Гремячинск')
INSERT [dbo].[City] ([id], [value]) VALUES (391, N'Губаха')
INSERT [dbo].[City] ([id], [value]) VALUES (392, N'Добрянка')
INSERT [dbo].[City] ([id], [value]) VALUES (393, N'Кизел')
INSERT [dbo].[City] ([id], [value]) VALUES (394, N'Кудымкар')
INSERT [dbo].[City] ([id], [value]) VALUES (395, N'Кунгур')
INSERT [dbo].[City] ([id], [value]) VALUES (396, N'Лысьва')
INSERT [dbo].[City] ([id], [value]) VALUES (397, N'Пермь')
INSERT [dbo].[City] ([id], [value]) VALUES (398, N'Соликамск')
INSERT [dbo].[City] ([id], [value]) VALUES (399, N'Чайковский')
INSERT [dbo].[City] ([id], [value]) VALUES (400, N'Чусовой')
INSERT [dbo].[City] ([id], [value]) VALUES (401, N'Жигулевск')
GO
INSERT [dbo].[City] ([id], [value]) VALUES (402, N'Кинель')
INSERT [dbo].[City] ([id], [value]) VALUES (403, N'Новокуйбышевск')
INSERT [dbo].[City] ([id], [value]) VALUES (404, N'Октябрьск')
INSERT [dbo].[City] ([id], [value]) VALUES (405, N'Отрадный')
INSERT [dbo].[City] ([id], [value]) VALUES (406, N'Похвистнево')
INSERT [dbo].[City] ([id], [value]) VALUES (407, N'Самара')
INSERT [dbo].[City] ([id], [value]) VALUES (408, N'Сызрань')
INSERT [dbo].[City] ([id], [value]) VALUES (409, N'Тольятти')
INSERT [dbo].[City] ([id], [value]) VALUES (410, N'Чапаевск')
INSERT [dbo].[City] ([id], [value]) VALUES (411, N'Аткарск')
INSERT [dbo].[City] ([id], [value]) VALUES (412, N'Балаково')
INSERT [dbo].[City] ([id], [value]) VALUES (413, N'Балашов')
INSERT [dbo].[City] ([id], [value]) VALUES (414, N'Вольск')
INSERT [dbo].[City] ([id], [value]) VALUES (415, N'Красноармейск')
INSERT [dbo].[City] ([id], [value]) VALUES (416, N'Маркс')
INSERT [dbo].[City] ([id], [value]) VALUES (417, N'Петровск')
INSERT [dbo].[City] ([id], [value]) VALUES (418, N'Пугачев')
INSERT [dbo].[City] ([id], [value]) VALUES (419, N'Ртищево')
INSERT [dbo].[City] ([id], [value]) VALUES (420, N'Саратов')
INSERT [dbo].[City] ([id], [value]) VALUES (421, N'Хвалынск')
INSERT [dbo].[City] ([id], [value]) VALUES (422, N'Шиханы')
INSERT [dbo].[City] ([id], [value]) VALUES (423, N'Энгельс')
INSERT [dbo].[City] ([id], [value]) VALUES (424, N'Энгельс-19')
INSERT [dbo].[City] ([id], [value]) VALUES (425, N'Энгельс-2')
INSERT [dbo].[City] ([id], [value]) VALUES (426, N'Казань')
INSERT [dbo].[City] ([id], [value]) VALUES (427, N'Набережные Челны')
INSERT [dbo].[City] ([id], [value]) VALUES (428, N'Воткинск')
INSERT [dbo].[City] ([id], [value]) VALUES (429, N'Глазов')
INSERT [dbo].[City] ([id], [value]) VALUES (430, N'Ижевск')
INSERT [dbo].[City] ([id], [value]) VALUES (431, N'Можга')
INSERT [dbo].[City] ([id], [value]) VALUES (432, N'Сарапул')
INSERT [dbo].[City] ([id], [value]) VALUES (433, N'Барыш')
INSERT [dbo].[City] ([id], [value]) VALUES (434, N'Димитровград')
INSERT [dbo].[City] ([id], [value]) VALUES (435, N'Новоульяновск')
INSERT [dbo].[City] ([id], [value]) VALUES (436, N'Ульяновск')
INSERT [dbo].[City] ([id], [value]) VALUES (437, N'Алатырь')
INSERT [dbo].[City] ([id], [value]) VALUES (438, N'Канаш')
INSERT [dbo].[City] ([id], [value]) VALUES (439, N'Новочебоксарск')
INSERT [dbo].[City] ([id], [value]) VALUES (440, N'Чебоксары')
INSERT [dbo].[City] ([id], [value]) VALUES (441, N'Шумерля')
INSERT [dbo].[City] ([id], [value]) VALUES (442, N'Буйнакск')
INSERT [dbo].[City] ([id], [value]) VALUES (443, N'Дагестанские Огни')
INSERT [dbo].[City] ([id], [value]) VALUES (444, N'Дербент')
INSERT [dbo].[City] ([id], [value]) VALUES (445, N'Избербаш')
INSERT [dbo].[City] ([id], [value]) VALUES (446, N'Каспийск')
INSERT [dbo].[City] ([id], [value]) VALUES (447, N'Кизилюрт')
INSERT [dbo].[City] ([id], [value]) VALUES (448, N'Кизляр')
INSERT [dbo].[City] ([id], [value]) VALUES (449, N'Махачкала')
INSERT [dbo].[City] ([id], [value]) VALUES (450, N'Хасавюрт')
INSERT [dbo].[City] ([id], [value]) VALUES (451, N'Южно-Сухокумск')
INSERT [dbo].[City] ([id], [value]) VALUES (452, N'Карабулак')
INSERT [dbo].[City] ([id], [value]) VALUES (453, N'Магас')
INSERT [dbo].[City] ([id], [value]) VALUES (454, N'Малгобек')
INSERT [dbo].[City] ([id], [value]) VALUES (455, N'Назрань')
INSERT [dbo].[City] ([id], [value]) VALUES (456, N'Нальчик')
INSERT [dbo].[City] ([id], [value]) VALUES (457, N'Карачаевск')
INSERT [dbo].[City] ([id], [value]) VALUES (458, N'Черкесск')
INSERT [dbo].[City] ([id], [value]) VALUES (459, N'Владикавказ')
INSERT [dbo].[City] ([id], [value]) VALUES (460, N'Георгиевск')
INSERT [dbo].[City] ([id], [value]) VALUES (461, N'Ессентуки')
INSERT [dbo].[City] ([id], [value]) VALUES (462, N'Железноводск')
INSERT [dbo].[City] ([id], [value]) VALUES (463, N'Кисловодск')
INSERT [dbo].[City] ([id], [value]) VALUES (464, N'Лермонтов')
INSERT [dbo].[City] ([id], [value]) VALUES (465, N'Минеральные Воды')
INSERT [dbo].[City] ([id], [value]) VALUES (466, N'Невинномысск')
INSERT [dbo].[City] ([id], [value]) VALUES (467, N'Пятигорск')
INSERT [dbo].[City] ([id], [value]) VALUES (468, N'Ставрополь')
INSERT [dbo].[City] ([id], [value]) VALUES (469, N'Аргун')
INSERT [dbo].[City] ([id], [value]) VALUES (470, N'Грозный')
SET IDENTITY_INSERT [dbo].[City] OFF
ALTER TABLE [dbo].[PairUser]  WITH CHECK ADD  CONSTRAINT [FK_PairUser_Pairs] FOREIGN KEY([pairId])
REFERENCES [dbo].[Pairs] ([id])
GO
ALTER TABLE [dbo].[PairUser] CHECK CONSTRAINT [FK_PairUser_Pairs]
GO
ALTER TABLE [dbo].[PairUser]  WITH CHECK ADD  CONSTRAINT [FK_PairUser_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PairUser] CHECK CONSTRAINT [FK_PairUser_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_City] FOREIGN KEY([cityId])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_City]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Goal] FOREIGN KEY([goalId])
REFERENCES [dbo].[Goal] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Goal]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Photo] FOREIGN KEY([photoId])
REFERENCES [dbo].[Photo] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Photo]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([requirementsId])
REFERENCES [dbo].[Requirement] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
ALTER TABLE [dbo].[UsersInterests]  WITH CHECK ADD  CONSTRAINT [FK_UsersInterests_Interest] FOREIGN KEY([interestId])
REFERENCES [dbo].[Interest] ([id])
GO
ALTER TABLE [dbo].[UsersInterests] CHECK CONSTRAINT [FK_UsersInterests_Interest]
GO
ALTER TABLE [dbo].[UsersInterests]  WITH CHECK ADD  CONSTRAINT [FK_UsersInterests_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UsersInterests] CHECK CONSTRAINT [FK_UsersInterests_User]
GO
/****** Object:  StoredProcedure [dbo].[CityGet]    Script Date: 10/1/2017 12:32:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CityGet] 
@id int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [id], [value]
	FROM [dbo].[City]
	WHERE id = @id

	SET NOCOUNT ON;
END

GO
/****** Object:  StoredProcedure [dbo].[CityGetAll]    Script Date: 10/1/2017 12:32:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CityGetAll] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [id], [value]
	FROM [dbo].[City]

	SET NOCOUNT ON;
END

GO
/****** Object:  StoredProcedure [dbo].[UserCreate]    Script Date: 10/1/2017 12:32:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserCreate] 
@login nvarchar(MAX),
@password nvarchar(MAX),
@name nvarchar(MAX),
@birthday datetime,
@sex int,
@cityId int,
@photoId int,
@goalId int,
@requirementsId int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[User]
	(
	[login],
	[password],
	[name],
	[birthday],
	[sex],
	[cityId],
	[photoId],
	[goalId],
	[requirementsId]
	)
	VALUES (
	@login,
	@password,
	@name,
	@birthday,
	@sex,
	@cityId,
	@photoId,
	@goalId,
	@requirementsId
	)	

	SET NOCOUNT ON;
END

GO
USE [master]
GO
ALTER DATABASE [MeetingsDB] SET  READ_WRITE 
GO
