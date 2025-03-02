USE [master]
GO
/****** Object:  Database [Highschool]    Script Date: 2025-01-28 11:38:24 ******/
CREATE DATABASE [Highschool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Highschool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Highschool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Highschool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Highschool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Highschool] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Highschool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Highschool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Highschool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Highschool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Highschool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Highschool] SET ARITHABORT OFF 
GO
ALTER DATABASE [Highschool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Highschool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Highschool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Highschool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Highschool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Highschool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Highschool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Highschool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Highschool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Highschool] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Highschool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Highschool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Highschool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Highschool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Highschool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Highschool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Highschool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Highschool] SET RECOVERY FULL 
GO
ALTER DATABASE [Highschool] SET  MULTI_USER 
GO
ALTER DATABASE [Highschool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Highschool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Highschool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Highschool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Highschool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Highschool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Highschool', N'ON'
GO
ALTER DATABASE [Highschool] SET QUERY_STORE = ON
GO
ALTER DATABASE [Highschool] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Highschool]
GO
/****** Object:  Table [dbo].[classes]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classes](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_id] [int] NULL,
	[class_name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_roles]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[teacher_id] [int] NULL,
	[grade_set] [date] NOT NULL,
	[subject_id] [int] NULL,
	[student_grade_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[possible_grades]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[possible_grades](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[grade_letter] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[social_security] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 2025-01-28 11:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_code] [varchar](50) NOT NULL,
	[subject_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[classes] ON 

INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (1, 3, N'ROT24')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (2, 3, N'SOT23')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (3, 4, N'TOT25')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (4, 4, N'KOT22')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (5, 4, N'LOT21')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (6, 8, N'NAT24')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (7, 8, N'ENG23')
INSERT [dbo].[classes] ([class_id], [teacher_id], [class_name]) VALUES (8, 9, N'LIN22')
SET IDENTITY_INSERT [dbo].[classes] OFF
GO
SET IDENTITY_INSERT [dbo].[employee_roles] ON 

INSERT [dbo].[employee_roles] ([role_id], [role_name]) VALUES (1, N'Rektor')
INSERT [dbo].[employee_roles] ([role_id], [role_name]) VALUES (2, N'Administratör')
INSERT [dbo].[employee_roles] ([role_id], [role_name]) VALUES (3, N'Lärare')
INSERT [dbo].[employee_roles] ([role_id], [role_name]) VALUES (4, N'Vaktmästare')
INSERT [dbo].[employee_roles] ([role_id], [role_name]) VALUES (5, N'Skolsjuksköterska')
INSERT [dbo].[employee_roles] ([role_id], [role_name]) VALUES (6, N'Receptionist')
SET IDENTITY_INSERT [dbo].[employee_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (1, 1, N'Lasse', N'Andersson')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (2, 2, N'Sara', N'Sjögren')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (3, 3, N'Anna', N'Melin')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (4, 3, N'Lars', N'Havreson')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (5, 4, N'Birgitta', N'Gunnarson')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (6, 5, N'Markus', N'Svensson')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (7, 2, N'Maria', N'Andersson')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (8, 3, N'Hans', N'Johansson')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (9, 3, N'Nils', N'Fjord')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (10, 6, N'Anna', N'Winsconsin')
INSERT [dbo].[employees] ([employee_id], [role_id], [first_name], [last_name]) VALUES (11, 6, N'Ferdinand', N'Brookes')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[grades] ON 

INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (1, 1, 3, CAST(N'2024-05-16' AS Date), 1, 6)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (2, 2, 3, CAST(N'2023-07-19' AS Date), 9, 3)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (3, 3, 3, CAST(N'2024-08-23' AS Date), 6, 5)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (4, 5, 4, CAST(N'2023-09-10' AS Date), 4, 4)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (5, 7, 4, CAST(N'2024-02-03' AS Date), 10, 2)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (6, 1, 3, CAST(N'2024-12-05' AS Date), 3, 6)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (7, 2, 3, CAST(N'2024-12-10' AS Date), 2, 5)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (8, 2, 3, CAST(N'2024-12-30' AS Date), 4, 4)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (9, 1, 4, CAST(N'2025-01-01' AS Date), 5, 6)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (10, 3, 4, CAST(N'2024-11-29' AS Date), 8, 4)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (11, 8, 8, CAST(N'2024-06-15' AS Date), 1, 2)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (12, 9, 8, CAST(N'2023-09-18' AS Date), 9, 5)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (13, 8, 9, CAST(N'2024-12-26' AS Date), 6, 6)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (14, 10, 9, CAST(N'2023-10-13' AS Date), 4, 1)
INSERT [dbo].[grades] ([grade_id], [student_id], [teacher_id], [grade_set], [subject_id], [student_grade_id]) VALUES (15, 15, 4, CAST(N'2024-03-04' AS Date), 10, 4)
SET IDENTITY_INSERT [dbo].[grades] OFF
GO
SET IDENTITY_INSERT [dbo].[possible_grades] ON 

INSERT [dbo].[possible_grades] ([grade_id], [grade_letter]) VALUES (1, N'F')
INSERT [dbo].[possible_grades] ([grade_id], [grade_letter]) VALUES (2, N'E')
INSERT [dbo].[possible_grades] ([grade_id], [grade_letter]) VALUES (3, N'D')
INSERT [dbo].[possible_grades] ([grade_id], [grade_letter]) VALUES (4, N'C')
INSERT [dbo].[possible_grades] ([grade_id], [grade_letter]) VALUES (5, N'B')
INSERT [dbo].[possible_grades] ([grade_id], [grade_letter]) VALUES (6, N'A')
SET IDENTITY_INSERT [dbo].[possible_grades] OFF
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (1, 1, N'Mark', N'Brightson', N'100516-3184')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (2, 1, N'Vicky', N'Handy', N'100717-5236')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (3, 2, N'Craig', N'Brightson', N'090325-5896')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (4, 2, N'Milly', N'Handy', N'091030-0984')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (5, 3, N'Anders', N'Torson', N'110726-7632')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (6, 4, N'Claes', N'Osborn', N'080405-8573')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (7, 5, N'Rebecca', N'Lövgren', N'070812-0931')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (8, 1, N'Lily', N'Night', N'100823-9419')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (9, 1, N'Xander', N'Hansson', N'100312-5159')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (10, 2, N'Willow', N'Redleaf', N'090515-5136')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (11, 2, N'Buffy', N'Summers', N'090130-5954')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (12, 3, N'Klaus', N'Fried', N'110216-5131')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (13, 4, N'Brennan', N'Mulligan', N'080925-9482')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (14, 5, N'Craig', N'Valta', N'070615-0318')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (15, 6, N'Nils', N'Song', N'100224-9418')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (16, 6, N'Vicky', N'Danvers', N'100712-0415')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (17, 7, N'Frida', N'Tidzon', N'090316-8517')
INSERT [dbo].[students] ([student_id], [class_id], [first_name], [last_name], [social_security]) VALUES (18, 8, N'Tyler', N'Scream', N'080518-4189')
SET IDENTITY_INSERT [dbo].[students] OFF
GO
SET IDENTITY_INSERT [dbo].[subjects] ON 

INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (1, N'MAT3', N'Matte 3')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (2, N'MAT4', N'Matte 4')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (3, N'MAT5', N'Matte 5')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (4, N'MAT6', N'Matte 6')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (5, N'MAT7', N'Matte 7')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (6, N'FYS1', N'Fysik 1')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (7, N'FYS2', N'Fysik 2')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (8, N'FYS3', N'Fysik 3')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (9, N'SVE4', N'Svenska 4')
INSERT [dbo].[subjects] ([subject_id], [subject_code], [subject_name]) VALUES (10, N'REL2', N'Religion 2')
SET IDENTITY_INSERT [dbo].[subjects] OFF
GO
ALTER TABLE [dbo].[classes]  WITH CHECK ADD FOREIGN KEY([teacher_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[employee_roles] ([role_id])
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([student_id])
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD FOREIGN KEY([teacher_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [fk_student_grade_id] FOREIGN KEY([student_grade_id])
REFERENCES [dbo].[possible_grades] ([grade_id])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [fk_student_grade_id]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [fk_subject_id] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([subject_id])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [fk_subject_id]
GO
ALTER TABLE [dbo].[students]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[classes] ([class_id])
GO
USE [master]
GO
ALTER DATABASE [Highschool] SET  READ_WRITE 
GO
