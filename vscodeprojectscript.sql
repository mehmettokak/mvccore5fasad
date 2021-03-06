USE [master]
GO
/****** Object:  Database [my_db]    Script Date: 1.04.2021 22:21:20 ******/
CREATE DATABASE [my_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'my_db', FILENAME = N'C:\Users\DELL\my_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'my_db_log', FILENAME = N'C:\Users\DELL\my_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [my_db] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [my_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [my_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [my_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [my_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [my_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [my_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [my_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [my_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [my_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [my_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [my_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [my_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [my_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [my_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [my_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [my_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [my_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [my_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [my_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [my_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [my_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [my_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [my_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [my_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [my_db] SET  MULTI_USER 
GO
ALTER DATABASE [my_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [my_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [my_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [my_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [my_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [my_db] SET QUERY_STORE = OFF
GO
USE [my_db]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [my_db]
GO
/****** Object:  Table [dbo].[AnswerSurvey]    Script Date: 1.04.2021 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerSurvey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_AnsverSurvey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1.04.2021 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedBy] [nvarchar](200) NULL,
	[CreatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Option]    Script Date: 1.04.2021 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Option](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[OptionText] [nvarchar](300) NULL,
	[OptionNumber] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1.04.2021 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [int] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[ISActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 1.04.2021 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[QuestionText] [nvarchar](200) NULL,
	[QuestionNumber] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 1.04.2021 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [nvarchar](200) NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnswerSurvey] ON 

INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (1, 1, 1, 2, 1, CAST(N'2021-04-01T19:00:58.557' AS DateTime), N'088e9a62-3911-4196-8174-b4a7e0a747c0')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (2, 1, 2, 5, 1, CAST(N'2021-04-01T19:01:02.540' AS DateTime), N'26fe8888-bd24-46d2-83b3-160e3eac7510')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (3, 1, 1, 1, 1, CAST(N'2021-04-01T19:01:21.680' AS DateTime), N'2c8eb53d-68c7-4ea4-bf3c-7a07fd6fb54f')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (7, 1, 1, 3, 1, CAST(N'2021-04-01T19:06:19.503' AS DateTime), N'0fba4a7d-1c8f-43f3-a15f-487d10c4ee59')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (9, 1, 1, 4, 1, CAST(N'2021-04-01T19:10:17.653' AS DateTime), N'476e9c55-6820-4ceb-8bd6-9168a12199b6')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (10, 1, 2, 7, 1, CAST(N'2021-04-01T19:10:21.747' AS DateTime), N'c646b7a1-6749-4b95-94d4-743ac2bba0ba')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (11, 1, 1, 2, 1, CAST(N'2021-04-01T19:12:21.113' AS DateTime), N'bdf36724-4c80-4ce8-a4fd-51b8b05234f7')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (12, 1, 2, 5, 1, CAST(N'2021-04-01T19:12:26.540' AS DateTime), N'63200b99-178d-4644-9069-2826050bf912')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (13, 1, 1, 4, 1, CAST(N'2021-04-01T20:36:08.540' AS DateTime), N'2e51da0f-e30d-4113-9305-e1ff75af4744')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (14, 1, 2, 5, 1, CAST(N'2021-04-01T20:36:13.323' AS DateTime), N'dee12863-82b0-4e8d-b5dd-f6da30fc95ea')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (16, 1, 1, 2, 1, CAST(N'2021-04-01T22:05:01.807' AS DateTime), N'136016e0-30f4-4495-a336-95eaf7f1ee26')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (17, 1, 2, 5, 1, CAST(N'2021-04-01T22:05:11.037' AS DateTime), N'9bdf4eb4-5650-4b5a-8321-e66b267b89c1')
INSERT [dbo].[AnswerSurvey] ([Id], [SurveyId], [QuestionId], [OptionId], [IsActive], [CreatedAt], [CreatedBy]) VALUES (18, 1, 5, 20, 1, CAST(N'2021-04-01T22:05:15.817' AS DateTime), N'dac17839-2719-4ffe-bfaf-282a36607079')
SET IDENTITY_INSERT [dbo].[AnswerSurvey] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title], [Description], [CreatedBy], [CreatedAt], [IsActive]) VALUES (1, N'Otomobil', N'Elektronik Açıklama', N'CreatedBy 1', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
INSERT [dbo].[Category] ([Id], [Title], [Description], [CreatedBy], [CreatedAt], [IsActive]) VALUES (2, N'Telefon', N'Description 2', N'CreatedBy 2', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Option] ON 

INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (1, 1, N'Honda', 1, 1, CAST(N'2021-04-01T18:41:24.273' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (2, 1, N'Opel', 2, 1, CAST(N'2021-04-01T18:41:24.273' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (3, 1, N'Renault', 3, 1, CAST(N'2021-04-01T18:41:24.273' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (4, 1, N'Ford', 4, 1, CAST(N'2021-04-01T18:41:24.273' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (5, 2, N'Almanya', 1, 1, CAST(N'2021-04-01T18:43:57.377' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (6, 2, N'Japonya', 2, 1, CAST(N'2021-04-01T18:43:57.377' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (7, 2, N'İtalya', 3, 1, CAST(N'2021-04-01T18:43:57.377' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (8, 2, N'Amerika', 4, 1, CAST(N'2021-04-01T18:43:57.377' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (9, 3, N'Fenerbahçe', 1, 1, CAST(N'2021-04-01T18:45:54.233' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (10, 3, N'Galatasaray', 2, 1, CAST(N'2021-04-01T18:45:54.233' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (11, 3, N'Beşiktaş', 3, 1, CAST(N'2021-04-01T18:45:54.233' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (12, 3, N'Trabzonspor', 4, 1, CAST(N'2021-04-01T18:45:54.233' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (17, 5, N'Sarı', 1, 1, CAST(N'2021-04-01T22:04:16.170' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (18, 5, N'Kırmızı', 2, 1, CAST(N'2021-04-01T22:04:16.170' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (19, 5, N'Yeşil', 3, 1, CAST(N'2021-04-01T22:04:16.170' AS DateTime), N'admin')
INSERT [dbo].[Option] ([Id], [QuestionId], [OptionText], [OptionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (20, 5, N'Beyaz', 4, 1, CAST(N'2021-04-01T22:04:16.170' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Option] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [CategoryId], [Title], [Description], [Price], [CreatedBy], [CreatedAt], [ISActive]) VALUES (3, 1, N'Opel Astra', N'Opel Astra Açıklama', 15000, N'CreatedBy 1', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Title], [Description], [Price], [CreatedBy], [CreatedAt], [ISActive]) VALUES (4, 1, N'Renault Megane', N'Renault Megane Açıklama', 12500, N'CreatedBy 1', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Title], [Description], [Price], [CreatedBy], [CreatedAt], [ISActive]) VALUES (5, 2, N'Samsung Galaxy S20', N'Samsung Galaxy S20 Açıklama', 500, N'CreatedBy 1', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Title], [Description], [Price], [CreatedBy], [CreatedAt], [ISActive]) VALUES (6, 2, N'IPhone Pro 11', N'IPhone Pro 11', 600, N'CreatedBy 1', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
INSERT [dbo].[Product] ([Id], [CategoryId], [Title], [Description], [Price], [CreatedBy], [CreatedAt], [ISActive]) VALUES (7, 2, N'Nokia 3310', N'Nokia 3310', 250, N'CreatedBy 1', CAST(N'2021-03-21T04:38:49.863' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionText], [QuestionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (1, 1, N'En çok hangi marka otomobilden hoşlanırsınız?', 1, 1, CAST(N'2021-04-01T18:41:24.273' AS DateTime), N'admin')
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionText], [QuestionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (2, 1, N'Sizce en iyi otomabil üreten ülke hangisidir?', 2, 1, CAST(N'2021-04-01T18:43:57.377' AS DateTime), N'admin')
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionText], [QuestionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (3, 2, N'En çok hangi futbol takımından hoşlanırsınız?', 1, 1, CAST(N'2021-04-01T18:45:54.233' AS DateTime), N'admin')
INSERT [dbo].[Question] ([Id], [SurveyId], [QuestionText], [QuestionNumber], [IsActive], [CreatedAt], [CreatedBy]) VALUES (5, 1, N'Sevdiğini otomobil rengi hangisidir?', 3, 1, CAST(N'2021-04-01T22:04:16.170' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Survey] ON 

INSERT [dbo].[Survey] ([Id], [Name], [IsActive], [CreatedAt], [CreatedBy]) VALUES (1, N'Otomobil Değerlendirme Anketi', 1, CAST(N'2021-03-28T04:38:49.863' AS DateTime), N'Admin')
INSERT [dbo].[Survey] ([Id], [Name], [IsActive], [CreatedAt], [CreatedBy]) VALUES (2, N'Futbol Değerlendirme Anketi', 1, CAST(N'2021-03-28T04:38:49.863' AS DateTime), N'Admin')
SET IDENTITY_INSERT [dbo].[Survey] OFF
GO
USE [master]
GO
ALTER DATABASE [my_db] SET  READ_WRITE 
GO
