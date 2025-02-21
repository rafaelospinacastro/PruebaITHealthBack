USE [master]
GO
/****** Object:  Database [ITHealth]    Script Date: 31/10/2024 6:16:00 p. m. ******/
CREATE DATABASE [ITHealth]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITHealth', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ITHealth.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITHealth_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ITHealth_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ITHealth] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITHealth].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITHealth] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITHealth] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITHealth] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITHealth] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITHealth] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITHealth] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITHealth] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITHealth] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITHealth] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITHealth] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITHealth] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITHealth] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITHealth] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITHealth] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITHealth] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITHealth] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITHealth] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITHealth] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITHealth] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITHealth] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITHealth] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITHealth] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITHealth] SET RECOVERY FULL 
GO
ALTER DATABASE [ITHealth] SET  MULTI_USER 
GO
ALTER DATABASE [ITHealth] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITHealth] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITHealth] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITHealth] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITHealth] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ITHealth] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITHealth', N'ON'
GO
ALTER DATABASE [ITHealth] SET QUERY_STORE = OFF
GO
USE [ITHealth]
GO
/****** Object:  User [rafa]    Script Date: 31/10/2024 6:16:00 p. m. ******/
CREATE USER [rafa] FOR LOGIN [rafa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 31/10/2024 6:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](3) NULL,
	[NumeroDocumento] [varchar](20) NULL,
	[Nombre] [varchar](200) NULL,
	[Email] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Genero] [varchar](10) NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 31/10/2024 6:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Sexo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 31/10/2024 6:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_borrarpaciente]    Script Date: 31/10/2024 6:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_borrarpaciente]
@id int
as
DELETE FROM [dbo].[Paciente]
      WHERE ID = @id 
GO
/****** Object:  StoredProcedure [dbo].[usp_buscarpaciente]    Script Date: 31/10/2024 6:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_buscarpaciente]
@id int
as
SELECT [ID]
      ,[TipoDocumento]
      ,[NumeroDocumento]
      ,[Nombre]
      ,[Email]
      ,[FechaNacimiento]
      ,[Genero]
      ,[Direccion]
      ,[Telefono]
      ,[Activo]
  FROM [dbo].[Paciente]
  where ID = @id

GO
/****** Object:  StoredProcedure [dbo].[usp_buscarpacientes]    Script Date: 31/10/2024 6:16:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_buscarpacientes]
as
SELECT [ID]
      ,[TipoDocumento]
      ,[NumeroDocumento]
      ,[Nombre]
      ,[Email]
      ,[FechaNacimiento]
      ,[Genero]
      ,[Direccion]
      ,[Telefono]
      ,[Activo]
  FROM [dbo].[Paciente]

GO
USE [master]
GO
ALTER DATABASE [ITHealth] SET  READ_WRITE 
GO
