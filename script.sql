USE [master]
GO
/****** Object:  Database [Estudiantes]    Script Date: 24/10/2022 0:55:12 ******/
CREATE DATABASE [Estudiantes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Estudiantes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DESARROLLO\MSSQL\DATA\Estudiantes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Estudiantes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DESARROLLO\MSSQL\DATA\Estudiantes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Estudiantes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Estudiantes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Estudiantes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Estudiantes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Estudiantes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Estudiantes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Estudiantes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Estudiantes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Estudiantes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Estudiantes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Estudiantes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Estudiantes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Estudiantes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Estudiantes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Estudiantes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Estudiantes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Estudiantes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Estudiantes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Estudiantes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Estudiantes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Estudiantes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Estudiantes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Estudiantes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Estudiantes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Estudiantes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Estudiantes] SET  MULTI_USER 
GO
ALTER DATABASE [Estudiantes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Estudiantes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Estudiantes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Estudiantes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Estudiantes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Estudiantes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Estudiantes] SET QUERY_STORE = OFF
GO
USE [Estudiantes]
GO
/****** Object:  Table [dbo].[TB_ASIGNACION]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ASIGNACION](
	[IdAsignacion] [bigint] IDENTITY(1,1) NOT NULL,
	[fech_asi] [date] NOT NULL,
	[IdCurso] [bigint] NOT NULL,
	[IdDocente] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_ASIGNACION] PRIMARY KEY CLUSTERED 
(
	[IdAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CURSO]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CURSO](
	[IdCurso] [bigint] IDENTITY(1,1) NOT NULL,
	[nomb_cur] [nvarchar](max) NOT NULL,
	[cost_cur] [decimal](18, 0) NOT NULL,
	[dura_cur] [int] NOT NULL,
 CONSTRAINT [PK_TB_CURSO] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_DISTRITO]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DISTRITO](
	[IdDistrito] [bigint] IDENTITY(1,1) NOT NULL,
	[nomb_dis] [nvarchar](max) NOT NULL,
	[IdProvincia] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_DISTRITO] PRIMARY KEY CLUSTERED 
(
	[IdDistrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_DOCENTE]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DOCENTE](
	[IdDocente] [bigint] IDENTITY(1,1) NOT NULL,
	[apel_doc] [nvarchar](max) NOT NULL,
	[nomb_doc] [nvarchar](max) NOT NULL,
	[dire_doc] [nvarchar](max) NOT NULL,
	[ntel_doc] [nvarchar](50) NOT NULL,
	[grad_doc] [nvarchar](max) NOT NULL,
	[IdProfesion] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_DOCENTE] PRIMARY KEY CLUSTERED 
(
	[IdDocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ESTUDIANTE]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ESTUDIANTE](
	[IdEstudiante] [bigint] IDENTITY(1,1) NOT NULL,
	[apel_est] [nvarchar](max) NOT NULL,
	[nomb_est] [nvarchar](max) NOT NULL,
	[fnac_est] [date] NOT NULL,
	[sexo_est] [nvarchar](max) NOT NULL,
	[dire_est] [nvarchar](max) NOT NULL,
	[tcol_est] [nvarchar](max) NOT NULL,
	[gins_est] [nvarchar](max) NOT NULL,
	[IdDistrito] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_ESTUDIANTE] PRIMARY KEY CLUSTERED 
(
	[IdEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MATRICULA]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MATRICULA](
	[IdMatricula] [bigint] IDENTITY(1,1) NOT NULL,
	[fech_mat] [date] NOT NULL,
	[IdEstudiante] [bigint] NOT NULL,
	[IdCurso] [bigint] NOT NULL,
 CONSTRAINT [PK_TB_MATRICULA] PRIMARY KEY CLUSTERED 
(
	[IdMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PROFESION]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PROFESION](
	[IdProfesion] [bigint] IDENTITY(1,1) NOT NULL,
	[nomb_pro] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TB_PROFESION] PRIMARY KEY CLUSTERED 
(
	[IdProfesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PROVINCIA]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PROVINCIA](
	[IdProvincia] [bigint] IDENTITY(1,1) NOT NULL,
	[nomb_pro] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TB_PROVINCIA] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_USUARIO]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USUARIO](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](500) NOT NULL,
	[Pass] [varbinary](500) NOT NULL,
 CONSTRAINT [PK_TB_USUARIO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_ASIGNACION] ON 

INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (1, CAST(N'2022-10-10' AS Date), 1, 1)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (3, CAST(N'2022-10-10' AS Date), 1, 2)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (4, CAST(N'2022-10-10' AS Date), 2, 3)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (5, CAST(N'2022-10-10' AS Date), 2, 4)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (6, CAST(N'2022-10-10' AS Date), 3, 5)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (9, CAST(N'2022-10-10' AS Date), 3, 7)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (11, CAST(N'2022-10-10' AS Date), 4, 9)
INSERT [dbo].[TB_ASIGNACION] ([IdAsignacion], [fech_asi], [IdCurso], [IdDocente]) VALUES (12, CAST(N'2022-10-10' AS Date), 4, 10)
SET IDENTITY_INSERT [dbo].[TB_ASIGNACION] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_CURSO] ON 

INSERT [dbo].[TB_CURSO] ([IdCurso], [nomb_cur], [cost_cur], [dura_cur]) VALUES (1, N'CURSO 1', CAST(12 AS Decimal(18, 0)), 1)
INSERT [dbo].[TB_CURSO] ([IdCurso], [nomb_cur], [cost_cur], [dura_cur]) VALUES (2, N'CURSO 2', CAST(24 AS Decimal(18, 0)), 2)
INSERT [dbo].[TB_CURSO] ([IdCurso], [nomb_cur], [cost_cur], [dura_cur]) VALUES (3, N'CURSO 3', CAST(36 AS Decimal(18, 0)), 3)
INSERT [dbo].[TB_CURSO] ([IdCurso], [nomb_cur], [cost_cur], [dura_cur]) VALUES (4, N'CURSO 4', CAST(48 AS Decimal(18, 0)), 4)
SET IDENTITY_INSERT [dbo].[TB_CURSO] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_DISTRITO] ON 

INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (1, N'DISTRITO 1', 1)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (2, N'DISTRITO 2', 1)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (3, N'DISTRITO 3', 2)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (4, N'DISTRITO 4', 2)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (5, N'DISTRITO 5', 3)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (6, N'DISTRITO 6', 3)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (7, N'DISTRITO 7', 4)
INSERT [dbo].[TB_DISTRITO] ([IdDistrito], [nomb_dis], [IdProvincia]) VALUES (8, N'DISTRITO 8', 4)
SET IDENTITY_INSERT [dbo].[TB_DISTRITO] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_DOCENTE] ON 

INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (1, N'TEST1', N'TEST1', N'TEST1', N'+34111111111', N'TEST1', 1)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (2, N'TEST2', N'TEST2', N'TEST2', N'+34222222222', N'TEST2', 1)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (3, N'TEST3', N'TEST3', N'TEST3', N'+44333333333', N'TEST3', 2)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (4, N'TEST4', N'TEST4', N'TEST4', N'+12345678912', N'TEST4', 2)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (5, N'TEST5', N'TEST5', N'TEST5', N'+11111111111', N'TEST5', 3)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (7, N'TEST6', N'TEST6', N'TEST6', N'TEST6', N'TEST6', 3)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (9, N'TEST7', N'TEST7', N'TEST7', N'+56123456789', N'TEST7', 4)
INSERT [dbo].[TB_DOCENTE] ([IdDocente], [apel_doc], [nomb_doc], [dire_doc], [ntel_doc], [grad_doc], [IdProfesion]) VALUES (10, N'TEST8', N'TEST8', N'TEST8', N'+7612384972', N'TEST8', 4)
SET IDENTITY_INSERT [dbo].[TB_DOCENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_ESTUDIANTE] ON 

INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (1, N'ESTUDIANTE 1', N'ESTUDIANTE 1', CAST(N'2012-08-12' AS Date), N'H', N'ESTUDIANTE 1', N'ESTUDIANTE 1', N'ESTUDIANTE 1', 1)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (2, N'ESTUDIANTE 2', N'ESTUDIANTE 2', CAST(N'2010-09-11' AS Date), N'M', N'ESTUDIANTE', N'ESTUDIANTE 2', N'ESTUDIANTE 2', 1)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (5, N'ESTUDIANTE 3', N'ESTUDIANTE 3', CAST(N'2010-09-10' AS Date), N'H', N'ESTUDIANTE 3', N'ESTUDIANTE 3', N'ESTUDIANTE 3', 2)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (6, N'ESTUDIANTE 4', N'ESTUDIANTE 4', CAST(N'2010-09-09' AS Date), N'M', N'ESTUDIANTE 4', N'ESTUDIANTE 4', N'ESTUDIANTE 4', 2)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (7, N'ESTUDIANTE 5', N'ESTUDIATE 5', CAST(N'2010-09-08' AS Date), N'H', N'ESTUDIANTE 5', N'ESTUDIANTE 5', N'ESTUDIANTE 5', 2)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (8, N'ESTUDIANTE 6', N'ESTUDIANTE 6', CAST(N'2010-09-07' AS Date), N'M', N'ESTUDIANTE 6', N'ESTUDIANTE 6', N'ESTUDIANTE 6', 3)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (9, N'ESTUDIANTE 7', N'ESTUDIANTE 7', CAST(N'2010-09-05' AS Date), N'H', N'ESTUDIANTE 7', N'ESTUDIANTE 7', N'ESTUDIANTE 7', 4)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (10, N'ESTUDIANTE 8', N'ESTUDIANTE 8', CAST(N'2010-09-01' AS Date), N'M', N'ESTUDIANTE 8', N'ESTUDIANTE 8', N'ESTUDIANTE 8', 4)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (11, N'ESTUDIANTE 9', N'ESTUDIANTE 9', CAST(N'2010-09-02' AS Date), N'H', N'ESTUDIANTE 9', N'ESTUDIANTE 9', N'ESTUDIANTE 9', 4)
INSERT [dbo].[TB_ESTUDIANTE] ([IdEstudiante], [apel_est], [nomb_est], [fnac_est], [sexo_est], [dire_est], [tcol_est], [gins_est], [IdDistrito]) VALUES (12, N'ESTUDIANTE 10', N'ESTUDIANTE 10', CAST(N'2010-09-03' AS Date), N'M', N'ESTUDIANTE 10', N'ESTUDIANTE 10', N'ESTUDIANTE 10', 4)
SET IDENTITY_INSERT [dbo].[TB_ESTUDIANTE] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_MATRICULA] ON 

INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (1, CAST(N'2022-09-12' AS Date), 1, 1)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (2, CAST(N'2022-09-12' AS Date), 2, 1)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (3, CAST(N'2022-09-12' AS Date), 5, 2)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (4, CAST(N'2022-09-12' AS Date), 6, 2)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (5, CAST(N'2022-09-12' AS Date), 7, 3)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (6, CAST(N'2022-09-12' AS Date), 8, 4)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (7, CAST(N'2022-09-12' AS Date), 9, 1)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (8, CAST(N'2022-09-12' AS Date), 10, 1)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (9, CAST(N'2022-09-12' AS Date), 11, 2)
INSERT [dbo].[TB_MATRICULA] ([IdMatricula], [fech_mat], [IdEstudiante], [IdCurso]) VALUES (10, CAST(N'2022-09-12' AS Date), 12, 4)
SET IDENTITY_INSERT [dbo].[TB_MATRICULA] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_PROFESION] ON 

INSERT [dbo].[TB_PROFESION] ([IdProfesion], [nomb_pro]) VALUES (1, N'PROFESION 1')
INSERT [dbo].[TB_PROFESION] ([IdProfesion], [nomb_pro]) VALUES (2, N'PROFESION 2')
INSERT [dbo].[TB_PROFESION] ([IdProfesion], [nomb_pro]) VALUES (3, N'PROFESION 3')
INSERT [dbo].[TB_PROFESION] ([IdProfesion], [nomb_pro]) VALUES (4, N'PROFESION 4')
SET IDENTITY_INSERT [dbo].[TB_PROFESION] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_PROVINCIA] ON 

INSERT [dbo].[TB_PROVINCIA] ([IdProvincia], [nomb_pro]) VALUES (1, N'PROVINCIA 1')
INSERT [dbo].[TB_PROVINCIA] ([IdProvincia], [nomb_pro]) VALUES (2, N'PROVINCIA 2')
INSERT [dbo].[TB_PROVINCIA] ([IdProvincia], [nomb_pro]) VALUES (3, N'PROVINCIA 3')
INSERT [dbo].[TB_PROVINCIA] ([IdProvincia], [nomb_pro]) VALUES (4, N'PROVINCIA 4')
SET IDENTITY_INSERT [dbo].[TB_PROVINCIA] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_USUARIO] ON 

INSERT [dbo].[TB_USUARIO] ([Id], [Usuario], [Pass]) VALUES (2, N'test', 0x02000000C1DB47E7DA88F48CA53FAB09F0F5F3581B23504FC982251C2730C4566F249BDB)
SET IDENTITY_INSERT [dbo].[TB_USUARIO] OFF
GO
ALTER TABLE [dbo].[TB_ASIGNACION]  WITH CHECK ADD  CONSTRAINT [FK_TB_ASIGNACION_TB_CURSO] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[TB_CURSO] ([IdCurso])
GO
ALTER TABLE [dbo].[TB_ASIGNACION] CHECK CONSTRAINT [FK_TB_ASIGNACION_TB_CURSO]
GO
ALTER TABLE [dbo].[TB_ASIGNACION]  WITH CHECK ADD  CONSTRAINT [FK_TB_ASIGNACION_TB_DOCENTE] FOREIGN KEY([IdDocente])
REFERENCES [dbo].[TB_DOCENTE] ([IdDocente])
GO
ALTER TABLE [dbo].[TB_ASIGNACION] CHECK CONSTRAINT [FK_TB_ASIGNACION_TB_DOCENTE]
GO
ALTER TABLE [dbo].[TB_DISTRITO]  WITH CHECK ADD  CONSTRAINT [FK_TB_DISTRITO_TB_PROVINCIA] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[TB_PROVINCIA] ([IdProvincia])
GO
ALTER TABLE [dbo].[TB_DISTRITO] CHECK CONSTRAINT [FK_TB_DISTRITO_TB_PROVINCIA]
GO
ALTER TABLE [dbo].[TB_DOCENTE]  WITH CHECK ADD  CONSTRAINT [FK_TB_DOCENTE_TB_PROFESION] FOREIGN KEY([IdProfesion])
REFERENCES [dbo].[TB_PROFESION] ([IdProfesion])
GO
ALTER TABLE [dbo].[TB_DOCENTE] CHECK CONSTRAINT [FK_TB_DOCENTE_TB_PROFESION]
GO
ALTER TABLE [dbo].[TB_ESTUDIANTE]  WITH CHECK ADD  CONSTRAINT [FK_TB_ESTUDIANTE_TB_DISTRITO] FOREIGN KEY([IdDistrito])
REFERENCES [dbo].[TB_DISTRITO] ([IdDistrito])
GO
ALTER TABLE [dbo].[TB_ESTUDIANTE] CHECK CONSTRAINT [FK_TB_ESTUDIANTE_TB_DISTRITO]
GO
ALTER TABLE [dbo].[TB_MATRICULA]  WITH CHECK ADD  CONSTRAINT [FK_TB_MATRICULA_TB_CURSO] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[TB_CURSO] ([IdCurso])
GO
ALTER TABLE [dbo].[TB_MATRICULA] CHECK CONSTRAINT [FK_TB_MATRICULA_TB_CURSO]
GO
ALTER TABLE [dbo].[TB_MATRICULA]  WITH CHECK ADD  CONSTRAINT [FK_TB_MATRICULA_TB_ESTUDIANTE] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[TB_ESTUDIANTE] ([IdEstudiante])
GO
ALTER TABLE [dbo].[TB_MATRICULA] CHECK CONSTRAINT [FK_TB_MATRICULA_TB_ESTUDIANTE]
GO
/****** Object:  StoredProcedure [dbo].[EstudiantesPorDocente]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EstudiantesPorDocente]
as
SELECT docentes.nomb_doc, estudiantes.nomb_est
  FROM [Estudiantes].[dbo].[TB_DOCENTE] docentes
  inner join TB_ASIGNACION asignaciones
	on asignaciones.IdDocente = docentes.IdDocente
  inner join TB_MATRICULA matriculas
	on matriculas.IdCurso = asignaciones.IdCurso
  inner join TB_ESTUDIANTE estudiantes
	on estudiantes.IdEstudiante = matriculas.IdEstudiante
GO
/****** Object:  StoredProcedure [dbo].[EstudiantesPorProvincia]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EstudiantesPorProvincia]
AS
select COUNT(estudiantes.IdEstudiante) numEstudiantes, provincias.nomb_pro, distritos.nomb_dis from dbo.TB_ESTUDIANTE estudiantes
inner join dbo.TB_DISTRITO distritos
	on distritos.IdDistrito = estudiantes.IdDistrito
inner join dbo.TB_PROVINCIA provincias
	on distritos.IdProvincia = provincias.IdProvincia
group by estudiantes.IdDistrito, provincias.nomb_pro, distritos.nomb_dis
GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetUsuario](@usuario varchar(500), @password varchar(500)) as

declare @passEncriptada varbinary(500)
declare @passDesencriptada varchar(50)

select @passEncriptada=usuarios.Pass from dbo.TB_USUARIO usuarios where Usuario = @usuario

set @passDesencriptada = DECRYPTBYPASSPHRASE('Cifrado', @passEncriptada)

if(@password = @passDesencriptada)
BEGIN
	select usuarios.Usuario from dbo.TB_USUARIO usuarios where Usuario = @usuario
END
else
begin
	raiserror('no existe ese usuario', 16, 1)
	return -1
end



GO
/****** Object:  StoredProcedure [dbo].[ProvinciaConMasEstudiantes]    Script Date: 24/10/2022 0:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProvinciaConMasEstudiantes]
@IdCurso bigint 
as
select TOP 1 COUNT(*) as numEstudiantes, provincias.nomb_pro from dbo.TB_MATRICULA matriculas 
inner join TB_ESTUDIANTE estudiantes
	on estudiantes.IdEstudiante = matriculas.IdEstudiante
inner join TB_DISTRITO distritos
	on distritos.IdDistrito = estudiantes.IdDistrito
inner join TB_PROVINCIA provincias
	on provincias.IdProvincia = distritos.IdProvincia
where matriculas.IdCurso = @IdCurso
group by provincias.nomb_pro
order by numEstudiantes desc

GO
USE [master]
GO
ALTER DATABASE [Estudiantes] SET  READ_WRITE 
GO
