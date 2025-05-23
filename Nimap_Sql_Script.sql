USE [master]
GO
/****** Object:  Database [Nimap]    Script Date: 5/5/2025 10:29:31 AM ******/
CREATE DATABASE [Nimap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nimap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Nimap.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nimap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Nimap_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Nimap] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nimap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nimap] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nimap] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nimap] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nimap] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nimap] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nimap] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Nimap] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nimap] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nimap] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nimap] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nimap] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nimap] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nimap] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nimap] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nimap] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nimap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nimap] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nimap] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nimap] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nimap] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nimap] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nimap] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nimap] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nimap] SET  MULTI_USER 
GO
ALTER DATABASE [Nimap] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nimap] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nimap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nimap] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nimap] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Nimap] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Nimap] SET QUERY_STORE = ON
GO
ALTER DATABASE [Nimap] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Nimap]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/5/2025 10:29:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryid] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/5/2025 10:29:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([categoryid])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Nimap] SET  READ_WRITE 
GO
