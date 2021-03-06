USE [master]
GO
/****** Object:  Database [LycheeCMS]    Script Date: 12/31/2014 22:23:10 ******/
CREATE DATABASE [LycheeCMS] ON  PRIMARY 
( NAME = N'LycheeCMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.CAWISQL\MSSQL\DATA\LycheeCMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LycheeCMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.CAWISQL\MSSQL\DATA\LycheeCMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LycheeCMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LycheeCMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LycheeCMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LycheeCMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LycheeCMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LycheeCMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LycheeCMS] SET ARITHABORT OFF
GO
ALTER DATABASE [LycheeCMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LycheeCMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LycheeCMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LycheeCMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LycheeCMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LycheeCMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LycheeCMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LycheeCMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LycheeCMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LycheeCMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LycheeCMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [LycheeCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LycheeCMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LycheeCMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LycheeCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LycheeCMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LycheeCMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LycheeCMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LycheeCMS] SET  READ_WRITE
GO
ALTER DATABASE [LycheeCMS] SET RECOVERY FULL
GO
ALTER DATABASE [LycheeCMS] SET  MULTI_USER
GO
ALTER DATABASE [LycheeCMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LycheeCMS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'LycheeCMS', N'ON'
GO
USE [LycheeCMS]
GO
/****** Object:  User [cawicaan]    Script Date: 12/31/2014 22:23:10 ******/
CREATE USER [cawicaan] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [cawi]    Script Date: 12/31/2014 22:23:10 ******/
CREATE USER [cawi] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 12/31/2014 22:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 12/31/2014 22:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 12/31/2014 22:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[MembershipId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NULL,
	[Password] [nvarchar](128) NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_webpages_Membership] PRIMARY KEY CLUSTERED 
(
	[MembershipId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/31/2014 22:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[Birthdate] [date] NULL,
	[ContactNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 12/31/2014 22:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 12/31/2014 22:23:11 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 12/31/2014 22:23:11 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
