USE [master]
GO
/****** Object:  Database [MangoDB]    Script Date: 2018/12/10 16:57:48 ******/
CREATE DATABASE [MangoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MangoDB', FILENAME = N'E:\webroot\DataBase\MangoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MangoDB_log', FILENAME = N'E:\webroot\DataBase\MangoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MangoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MangoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MangoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MangoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MangoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MangoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MangoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MangoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MangoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MangoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MangoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MangoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MangoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MangoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MangoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MangoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MangoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MangoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MangoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MangoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MangoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MangoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MangoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MangoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MangoDB] SET  MULTI_USER 
GO
ALTER DATABASE [MangoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MangoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MangoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MangoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MangoDB', N'ON'
GO
USE [MangoDB]
GO
/****** Object:  Table [dbo].[m_ManagerAccount]    Script Date: 2018/12/10 16:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerAccount](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](30) NULL,
	[Password] [varchar](50) NULL,
	[IsStatus] [bit] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_m_ManagerAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerMenu]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerMenu](
	[MenuId] [int] IDENTITY(100,1) NOT NULL,
	[MenuName] [nvarchar](30) NOT NULL,
	[AreaName] [varchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[IsPower] [bit] NULL,
 CONSTRAINT [PK_m_ManagerMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerPower]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerPower](
	[PowerId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_m_ManagerPower] PRIMARY KEY CLUSTERED 
(
	[PowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerRole]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_m_ManagerRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Message]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Message](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NULL,
	[Contents] [nvarchar](2000) NULL,
	[PostDate] [datetime] NULL,
	[UserId] [int] NULL,
	[AppendUserId] [int] NULL,
	[ObjId] [int] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_m_Message] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Navigation]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Navigation](
	[NavigationId] [int] IDENTITY(100,1) NOT NULL,
	[NavigationName] [nvarchar](50) NULL,
	[IsShow] [bit] NULL,
	[Remark] [nvarchar](500) NULL,
	[CId] [int] NULL,
	[NavigationUrl] [varchar](200) NULL,
	[ClickCount] [int] NULL,
 CONSTRAINT [PK_m_Navigation] PRIMARY KEY CLUSTERED 
(
	[NavigationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_NavigationClassify]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_NavigationClassify](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[ClassifyName] [nvarchar](50) NULL,
	[IsShow] [bit] NULL,
	[SortCount] [int] NULL,
 CONSTRAINT [PK_m_NavigationClassify] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Posts]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Posts](
	[PostsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Contents] [nvarchar](max) NULL,
	[PostDate] [datetime] NULL,
	[LastDate] [datetime] NULL,
	[UserId] [int] NULL,
	[PlusCount] [int] NULL,
	[ReadCount] [int] NULL,
	[IsShow] [bit] NULL,
	[Tags] [nvarchar](100) NULL,
	[ImgUrl] [varchar](1000) NULL,
	[IsReply] [bit] NULL,
	[AnswerCount] [int] NULL,
	[ChannelId] [int] NULL,
 CONSTRAINT [PK_m_Posts] PRIMARY KEY CLUSTERED 
(
	[PostsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsAnswer]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsAnswer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nvarchar](max) NULL,
	[PostDate] [datetime] NULL,
	[UserId] [int] NULL,
	[PostsId] [int] NULL,
	[Plus] [int] NULL,
	[CommentsCount] [int] NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_PostsAnswer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsAnswerRecords]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsAnswerRecords](
	[RecordsId] [int] IDENTITY(1,1) NOT NULL,
	[AnswerId] [int] NULL,
	[UserId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[RecordsType] [int] NULL,
 CONSTRAINT [PK_m_PostsAnswerRecords] PRIMARY KEY CLUSTERED 
(
	[RecordsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsAttention]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsAttention](
	[AttentionId] [int] IDENTITY(1,1) NOT NULL,
	[PostsId] [int] NULL,
	[AttentionDate] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_m_PostsAttention] PRIMARY KEY CLUSTERED 
(
	[AttentionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsChannel]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsChannel](
	[ChannelId] [int] IDENTITY(1,1) NOT NULL,
	[ChannelName] [nvarchar](30) NULL,
	[Remarks] [nvarchar](500) NULL,
	[IsShow] [bit] NULL,
	[AppendTime] [datetime] NULL,
	[IsManager] [bit] NULL,
	[SortCount] [int] NULL,
 CONSTRAINT [PK_m_PostsChannel] PRIMARY KEY CLUSTERED 
(
	[ChannelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsComments]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsComments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [varchar](1000) NULL,
	[PostDate] [datetime] NULL,
	[UserId] [int] NULL,
	[ToUserId] [int] NULL,
	[AnswerId] [int] NULL,
	[IsShow] [bit] NULL,
	[Plus] [int] NULL,
 CONSTRAINT [PK_m_PostsComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsCommentsRecords]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsCommentsRecords](
	[RecordsId] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NULL,
	[UserId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[RecordsType] [int] NULL,
 CONSTRAINT [PK_m_PostsCommentsRecords] PRIMARY KEY CLUSTERED 
(
	[RecordsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsRecords]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsRecords](
	[RecordsId] [int] IDENTITY(1,1) NOT NULL,
	[PostsId] [int] NULL,
	[UserId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[RecordsType] [int] NULL,
 CONSTRAINT [PK_m_PostsRecords] PRIMARY KEY CLUSTERED 
(
	[RecordsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsTags]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsTags](
	[TagsId] [int] IDENTITY(1,1) NOT NULL,
	[TagsName] [nvarchar](50) NULL,
 CONSTRAINT [PK_m_PostsProperty] PRIMARY KEY CLUSTERED 
(
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Sms]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Sms](
	[SmsID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](100) NULL,
	[Contents] [nvarchar](2000) NULL,
	[SendTime] [datetime] NULL,
	[SendIP] [varchar](50) NULL,
	[IsOk] [bit] NULL,
 CONSTRAINT [PK_m_Sms] PRIMARY KEY CLUSTERED 
(
	[SmsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_User]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[NickName] [nvarchar](20) NULL,
	[RegisterDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[LastLoginIP] [varchar](50) NULL,
	[RegisterIP] [varchar](50) NULL,
	[IsStatus] [bit] NULL,
	[HeadUrl] [varchar](200) NULL,
	[GroupId] [int] NULL,
	[Phone] [varchar](20) NULL,
	[OpenId] [varchar](80) NULL,
	[Email] [varchar](100) NULL,
	[AddressInfo] [nvarchar](50) NULL,
	[Birthday] [varchar](30) NULL,
	[Tags] [nvarchar](300) NULL,
	[Sex] [nvarchar](10) NULL,
 CONSTRAINT [PK_m_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserGroup]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserGroup](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_m_UserGroup] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserGroupMenu]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserGroupMenu](
	[MId] [int] IDENTITY(100,1) NOT NULL,
	[MName] [nvarchar](50) NULL,
	[AreaName] [varchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[IsPower] [bit] NULL,
 CONSTRAINT [PK_m_UserGroupMenu] PRIMARY KEY CLUSTERED 
(
	[MId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserGroupPower]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserGroupPower](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[MId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_m_UserGroupPower] PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_WebSiteConfig]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_WebSiteConfig](
	[ConfigId] [int] NOT NULL,
	[WebSiteName] [nvarchar](50) NULL,
	[WebSiteUrl] [varchar](100) NULL,
	[WebSiteTitle] [nvarchar](100) NULL,
	[WebSiteKeyWord] [nvarchar](100) NULL,
	[WebSiteDescription] [nvarchar](200) NULL,
	[CopyrightText] [nvarchar](2000) NULL,
	[IsLogin] [bit] NULL,
	[IsRegister] [bit] NULL,
	[FilingNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_m_WebSiteConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_WebSiteNavigation]    Script Date: 2018/12/10 16:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_WebSiteNavigation](
	[NavigationId] [int] IDENTITY(1,1) NOT NULL,
	[LinkUrl] [varchar](200) NULL,
	[NavigationName] [nvarchar](20) NULL,
	[IsTarget] [bit] NULL,
	[AppendTime] [datetime] NULL,
	[SortCount] [int] NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_WebSiteNavigation] PRIMARY KEY CLUSTERED 
(
	[NavigationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[m_ManagerAccount] ON 

INSERT [dbo].[m_ManagerAccount] ([AdminId], [AdminName], [Password], [IsStatus], [RoleId]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', 1, 2)
SET IDENTITY_INSERT [dbo].[m_ManagerAccount] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerMenu] ON 

INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (104, N'系统设置', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (105, N'内容管理', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (106, N'用户管理', NULL, NULL, NULL, 0, 0)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (107, N'管理员账号', NULL, N'ManagerAccount', N'Index', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (108, N'系统角色管理', NULL, N'ManagerRole', N'Index', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (109, N'系统权限菜单', NULL, N'ManagerMenu', N'Index', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (110, N'标签管理', NULL, N'Posts', N'Tags', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (111, N'帖子管理', NULL, N'Posts', N'Index', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (112, N'文章管理', NULL, N'Article', N'Index', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (113, N'用户列表', NULL, N'User', N'Index', 106, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (114, N'用户组', NULL, N'User', N'Group', 106, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (115, N'用户组权限菜单', NULL, N'User', N'Menu', 106, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (116, N'网址导航', NULL, N'Navigation', N'Index', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (117, N'导航分类', NULL, N'Navigation', N'Classify', 105, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (118, N'清理系统缓存', NULL, N'ManagerSystem', N'Cache', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (119, N'网站基础数据设置', NULL, N'WebSite', N'Config', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (120, N'网站导航', NULL, N'WebSIte', N'Navigation', 104, 1)
INSERT [dbo].[m_ManagerMenu] ([MenuId], [MenuName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (121, N'帖子频道', NULL, N'Posts', N'Channel', 105, 1)
SET IDENTITY_INSERT [dbo].[m_ManagerMenu] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerPower] ON 

INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (97, 104, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (98, 107, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (99, 108, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (100, 109, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (101, 118, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (102, 105, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (103, 110, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (104, 111, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (105, 112, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (106, 116, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (107, 117, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (108, 106, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (109, 113, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (110, 114, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (111, 115, 4)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (146, 104, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (147, 107, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (148, 108, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (149, 109, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (150, 118, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (151, 119, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (152, 120, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (153, 105, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (154, 111, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (155, 116, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (156, 117, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (157, 121, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (158, 106, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (159, 113, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (160, 114, 2)
INSERT [dbo].[m_ManagerPower] ([PowerId], [MenuId], [RoleId]) VALUES (161, 115, 2)
SET IDENTITY_INSERT [dbo].[m_ManagerPower] OFF
SET IDENTITY_INSERT [dbo].[m_ManagerRole] ON 

INSERT [dbo].[m_ManagerRole] ([RoleId], [RoleName]) VALUES (1, N'游客')
INSERT [dbo].[m_ManagerRole] ([RoleId], [RoleName]) VALUES (2, N'社区管理员')
SET IDENTITY_INSERT [dbo].[m_ManagerRole] OFF
SET IDENTITY_INSERT [dbo].[m_Message] ON 

INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (1, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="javascript:void(0)">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-21T18:12:54.637' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (2, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-21T18:18:27.197' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (3, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-21T18:30:58.257' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (4, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T10:28:20.860' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (5, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T10:28:22.803' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (6, 14, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子评论&nbsp;<a href="/posts/read/3032">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-22T10:28:46.003' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (7, 14, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子评论&nbsp;<a href="/posts/read/3032">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-22T10:28:47.757' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (8, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T17:52:58.007' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (9, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-22T18:17:45.770' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (10, 10, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;回复了你的帖子&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-23T10:52:23.480' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (11, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-23T10:52:38.610' AS DateTime), 2, 2, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (12, 13, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3034">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-23T14:57:24.823' AS DateTime), 2, 2, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (13, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-23T17:16:06.050' AS DateTime), 2, 2, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (14, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-23T17:16:11.597' AS DateTime), 2, 2, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (15, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-23T17:18:11.073' AS DateTime), 2, 2, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (16, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3032" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-23T17:58:13.600' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (17, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3032" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-29T14:47:13.107' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (18, 11, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3032" target="_blank">进行回答功能更新测试？</a>&nbsp;', CAST(N'2018-11-29T14:47:26.783' AS DateTime), 2, 2, 3032, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (19, 13, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:02:08.657' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (20, 11, N'<a href="javascript:void(0)">测试开发</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:02:16.497' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (21, 11, N'<a href="javascript:void(0)">测试开发</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:02:35.673' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (22, 11, N'<a href="javascript:void(0)">测试开发</a>&nbsp;评论了你的帖子回复&nbsp;<a href="/posts/read/3035" target="_blank">知乎趣味回复</a>&nbsp;', CAST(N'2018-11-29T15:03:00.583' AS DateTime), 2, 2022, 3035, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (23, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-29T16:46:24.957' AS DateTime), 2, 2022, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (24, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3034" target="_blank">.NET Core 2.2 预览版P3发布了</a>&nbsp;', CAST(N'2018-11-29T16:46:27.067' AS DateTime), 2, 2022, 3034, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (25, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:09.880' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (26, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:11.473' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (27, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:15.500' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (28, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:18.450' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (29, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:23.250' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (30, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:26.000' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (31, 12, N'<a href="javascript:void(0)">测试开发</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-11-29T16:49:40.770' AS DateTime), 2, 2022, 3033, 1)
INSERT [dbo].[m_Message] ([MessageId], [MessageType], [Contents], [PostDate], [UserId], [AppendUserId], [ObjId], [IsRead]) VALUES (32, 12, N'<a href="javascript:void(0)">糊涂书生</a>&nbsp;点赞了你的帖子&nbsp;<a href="/posts/read/3033" target="_blank">上传文件时如何获取到系统的根目录?</a>&nbsp;', CAST(N'2018-12-05T10:44:04.373' AS DateTime), 2, 2, 3033, 0)
SET IDENTITY_INSERT [dbo].[m_Message] OFF
SET IDENTITY_INSERT [dbo].[m_Navigation] ON 

INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (100, N'VS2017系列下载', 1, N'VS2017系列开发工具下载,包含了社区版 企业版 专业版', 1, N'https://www.visualstudio.com/zh-hans/vs', 100)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (101, N'.net core sdk下载', 1, N'.net core sdk下载地址,包含了每个版本的SDK下载', 1, N'https://www.microsoft.com/net/download/windows', 53)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (103, N'artDialog', 1, N'web弹窗组件,轻便简单', 3, N'http://aui.github.io/artDialog/', 52)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (104, N'Asp.Net Core MVC案例源码', 1, N'Asp.Net Core MVC系列教程案例源码', 5, N'http://git.oschina.net/yupingyong/aspnetcoremvc', 92)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (106, N'echarts在线图表', 1, N'免费开源,专业性强,图表组件丰富', 3, N'http://echarts.baidu.com/', 60)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (107, N'微软开发者文档中心', 1, N'微软开发者文档中心', 1, N'https://docs.microsoft.com/zh-cn/', 47)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (108, N'LayUI', 1, N'一个不错的前端UI组件', 3, N'http://www.layui.com', 21)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (109, N'zui', 1, N'一个基于bootstrap的前端框架', 3, N'http://zui.sexy/', 17)
INSERT [dbo].[m_Navigation] ([NavigationId], [NavigationName], [IsShow], [Remark], [CId], [NavigationUrl], [ClickCount]) VALUES (110, N'Ocelot API网关组件', 1, N'基于.NET CORE的API网关组件', 4, N'https://github.com/TomPallister/Ocelot', 18)
SET IDENTITY_INSERT [dbo].[m_Navigation] OFF
SET IDENTITY_INSERT [dbo].[m_NavigationClassify] ON 

INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (1, N'开发工具', 1, 1)
INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (3, N'JS/H5/CSS', 1, 1)
INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (4, N'微服务架构组件', 1, 1)
INSERT [dbo].[m_NavigationClassify] ([CId], [ClassifyName], [IsShow], [SortCount]) VALUES (5, N'推荐', 1, 1)
SET IDENTITY_INSERT [dbo].[m_NavigationClassify] OFF
SET IDENTITY_INSERT [dbo].[m_Posts] ON 

INSERT [dbo].[m_Posts] ([PostsId], [Title], [Contents], [PostDate], [LastDate], [UserId], [PlusCount], [ReadCount], [IsShow], [Tags], [ImgUrl], [IsReply], [AnswerCount], [ChannelId]) VALUES (3032, N'进行回答功能更新测试？', N'<p>是的测试这个贡呢能呢</p>', CAST(N'2018-11-28T12:15:44.957' AS DateTime), CAST(N'2018-06-09T12:15:44.957' AS DateTime), 2, 1, 405, 1, N'微服务,安装部署', N'', 1, 4, 1)
INSERT [dbo].[m_Posts] ([PostsId], [Title], [Contents], [PostDate], [LastDate], [UserId], [PlusCount], [ReadCount], [IsShow], [Tags], [ImgUrl], [IsReply], [AnswerCount], [ChannelId]) VALUES (3033, N'上传文件时如何获取到系统的根目录?', N'<p>如题</p>', CAST(N'2018-11-28T16:21:59.677' AS DateTime), CAST(N'2018-06-20T16:21:59.677' AS DateTime), 2, 2, 260, 1, N'Asp.Net Core MVC', N'', 1, 2, 2)
INSERT [dbo].[m_Posts] ([PostsId], [Title], [Contents], [PostDate], [LastDate], [UserId], [PlusCount], [ReadCount], [IsShow], [Tags], [ImgUrl], [IsReply], [AnswerCount], [ChannelId]) VALUES (3034, N'.NET Core 2.2 预览版P3发布了', N'<p>.NET Core 2.2 预览版P3发布了</p>', CAST(N'2018-11-28T16:46:44.580' AS DateTime), CAST(N'2018-11-13T16:46:44.577' AS DateTime), 2, 2, 47, 1, N'', N'', 1, 1, 1)
INSERT [dbo].[m_Posts] ([PostsId], [Title], [Contents], [PostDate], [LastDate], [UserId], [PlusCount], [ReadCount], [IsShow], [Tags], [ImgUrl], [IsReply], [AnswerCount], [ChannelId]) VALUES (3035, N'知乎趣味回复', N'<p>&nbsp; &nbsp; &nbsp; 上面的代码会筛选所有赞同大于 1000、字数小于 50 的回答，筛选出来的结果就是短小精辟的神回复。</p><p>　　以上是核心代码，完整代码已上传 github，大家可以在公众号后台回复知乎神回复获取地址。</p><p>　　<strong>知乎神回复</strong></p><p>　　<strong>代码写完了，可以运行下看看，这里就有 75 条筛选出来与程序员有关的神回复。</strong></p><p>　　<strong>Q:</strong> 码农们最常说的「谎言」有哪些？</p><p>　　A: //TODO</p><p>　　<strong>Q:</strong> 在 GitHub 上保持 365 天全绿是怎样一种体验？</p><p>　　A:&nbsp;曾经保持了 200 多天全绿，但是冷落了女朋友，一直绿到现在。</p><p>　　<strong>Q:</strong> 如何反驳「程序员离开电脑就是废物」这个观点？</p><p>　　A: 不不不，很多程序员在电脑前也是废物。</p><p>　　<strong>Q:</strong> 假如有一天所有的人都使用计算机语言说话，会是怎样的场景？</p><p>　　A:&nbsp;hello, world. 烫烫烫烫烫烫烫�d}��R�0:�v�?.</p><p>　　<strong>Q:</strong> 突然想开一家程序员主题的餐馆，名字就叫程序员的菜，菜名就叫各种语言中的关键字，各位指点一哈，有前途没？</p><p>　　A: 进门一个大大的 hello world&nbsp;，招牌菜叫“红烧产品经理”，一定会爆满的</p><p>　　<strong>Q:</strong> 什么是递归？</p><p>　　A: 「不宜公开讨论的政治内容」的定义和范畴本身也属于「不宜公开讨论的政治内容」</p><p>　　<strong>Q:</strong> 编程最基本的术语 “bug” 该怎么翻译？</p><p>　　A:&nbsp;幺蛾子，你的程序又出幺蛾子了。</p><p>　　<strong>Q:</strong> 编程的乐趣是什么？</p><p>　　A: 人的成就感来源于两样东西，创造和毁灭。</p><p>　　<strong>Q:</strong> 如何反驳「程序员离开电脑就是废物」这个观点？</p><p>　　A: 老实说跟这种女人都能聊下去你是不是想上她？</p><p>　　<strong>Q:</strong> 作为程序员，你在编程时吃了哪些数学的亏？</p><p>　　A: 看论文时候一个&quot;显然&quot;推了我一下午</p><p>　　<strong>Q:</strong> 土豪程序员的设备都有啥？</p><p>　　A: 女朋友。。。</p><p>　　<strong>Q:</strong> 祈求代码不出 bug 该拜哪个神仙？</p><p>　　A: 拜雍正，专治八阿哥。</p><p>　　<strong>Q:</strong> 考上好大学学 IT 是不是当今中国穷人家孩子晋级中产唯一的出路？</p><p>　　A: 对，就 4 条路：写代码；搞金融；在代码圈搞金融；在金融圈写代码</p><p>　　<strong>Q:</strong> 为什么程序员无论到哪儿都喜欢背电脑包，哪怕里面没有装电脑？</p><p>　　A: 因为他们没有别的包。</p><p>　　<strong>Q:</strong> 「Talk is cheap. Show me the code」怎么翻译比较好？</p><p>　　A: 屁话少说，放码过来。</p><p>　　Q: 为什么程序员的女朋友或老婆颜值普遍要高于男方很多？还是说程序员已经算是婚恋市场的优质股了？</p><p>　　A: 程序员女朋友颜值高，我是服的，因为随便问十个程序员他的女朋友是谁，有九个回答是新垣结衣</p><p>　　<strong>Q:</strong> 为什么一部分人宁可买几个机械键盘换着用，也不愿意给自己敷一下面膜？</p><p>　　A: 老子不靠脸吃饭。老子的辛辛苦苦挣来的钞票。老子想怎么花就怎么花。</p><p>　　<strong>Q:</strong> 程序员夫妻结婚戒指刻什么字好？</p><p>　　A: 0 error 0 warning</p><p>　　<strong>Q:</strong> IT 工程师被叫「码农」时是否会不舒服？</p><p>　　A: 我们好歹还是人，产品和设计已经是狗了……</p><p>　　<strong>Q:</strong> 为什么一个销售男（30 岁）会约我一个男程序员（24 岁）去小区附近的星巴克？</p><p>　　A: 根据哥多年的经验，他应该是有巨牛逼的 idea 然后只差程序员去实现了</p><p>　　<strong>Q:</strong> 怎么找到喜欢程序员的妹子做女友？</p><p>　　A: 看缘分，知乎上这么多用户，你关注到我就是缘分。</p><p>　　<strong>Q:</strong> 程序员女朋友如何给程序员男朋友过生日？</p><p>　　A: 告诉他，接口已经准备好了。</p><p>　　<strong>Q:</strong> 作为程序员，你是如何在工作以后找到女朋友的？</p><p>　　A: 题主作了这么久的程序员，还喜欢女孩子已经难能可贵了。</p><p>　　<strong>Q:</strong> 程序员转行烧烤需要做哪些准备，有哪些优势和劣势？</p><p>　　A: 你看，你连自己做烧烤都不知道优势劣势在哪里，所以，你还是需要一名产品经理。</p><p>　　<strong>Q:</strong> 哪些话可以惹火程序员？</p><p>　　A: 路过他电脑前时说一句，呦，又在写 bug 呢!</p><p>　　<strong>Q:</strong> 我的一位老师说，Java 适用于大型软件而 C# 适用中小型软件。这是真的么？</p><p>　　A: Java 有项天赋，就是能把中小型软件写成大型的。</p><p>　　<strong>Q:</strong> 为什么 2014 年程序员薪资那么高？</p><p>　　A: 时薪又不高</p><p>　　<strong>Q:</strong> 是不是大部分程序员都在抱怨工资低？</p><p>　　A:&nbsp;谁、谁在抱怨工资高？</p><p>　　<strong>Q:</strong> 单身程序狗解决了一个技术难题后没有妹子可以炫耀或夸一下自己怎么办？</p><p>　　A: 现在你明白了吧，为什么那么多程序员要写技术博客。</p><p>　　<strong>Q:</strong> 中国程序员是否偏爱「冲锋衣+牛仔裤+运动鞋」的衣着？如果是，为何会形成这样的潮流？</p><p>　　A: 穿那么好看给程序看吗？</p><p>　　<strong>Q:</strong> 作为 IT 从业人员，你觉得有什么工具大大提高了你的工作效率？</p><p>　　A:&nbsp;单身</p><p>　　<strong>Q:</strong> 为什么我认为程序员似乎大多不善言辞？</p><p>　　A: 你就当是我们情商低就好了，这样你开心，我们也开心。</p><p>　　<strong>Q:</strong> 在中国，年龄最大的程序员不过 40 岁左右，请问中国的程序员未来还可以做什么？</p><p>　　A:&nbsp;这跟为什么 90 后没人活过 30 岁是同一个原理</p><p>　　<strong>Q:</strong> 如何回复程序员发来的短信：「Hello world」？</p><p>　　A: Hello nerd.</p><p>　　<strong>Q:</strong> 怎么看出 IT 男喜欢一个女生？</p><p>　　A: 当他拼着自己早已养成的寡言少语的习惯去死命的跟你套近乎的时候</p><p>　　<strong>Q:</strong> 为什么程序员不应该会修电脑？</p><p>　　A: 范冰冰需要会修电视机吗？</p><p>　　<strong>Q:</strong> 同事说自己 C++ 水平全中国第一，怎么让他意识到自己没那么厉害？</p><p>　　A:&nbsp;实不相瞒，我也不是装逼：我的 C++ 水平全国第 0。</p><p>　　<strong>Q:</strong> 为什么 iPhone 删软件时，所有图标都要抖？</p><p>　　A: 第三方软件是吓得，系统自带软件是嘚瑟</p><p>　　<strong>Q:</strong> 左轮手枪装有一颗子弹，对着自己头开一枪奖励 10 万元，两枪 1 亿，三枪 2 亿，四枪 4 亿，5 枪 16 亿，值得吗？</p><p>　　A:&nbsp;只要不打要害，我告诉你，我能打到我们A站上市！！！！</p><p>　　<strong>Q:</strong> iPhone 处理器的性能按照现在每年翻一倍的节奏，是不是很快就能赶上甚至超过台式电脑的处理器？</p><p>　　A: 小时候我总觉得过两年我就能和大我两岁的哥哥一样大了。</p><p>　　<strong>Q:</strong> 知乎给你带来的最小限度的好处是什么？</p><p>　　A: 消磨时间还不觉得罪恶。</p><p>　　<strong>Q:</strong> 有哪些反人类的科技发明或设计？</p><p>　　A: 电脑连不上网，诊断以后它提示我要联网解决</p><p>　　<strong>Q:</strong> 为什么设计师不愿意被称为美工？</p><p>　　A: 只要工资开的高，叫我阿姨都行。</p><p>　　<strong>Q:</strong> 为什么有人认为网易云音乐是业界良心？</p><p>　　A: 有一天突然给我推送一条消息说我要的歌词找到了</p><p>　　<strong>Q:</strong> 为什么没有出现无人机自毁式攻击武器呢？恐怖分子用过吗？</p><p>　　A: 你是说导弹么？</p><p>　　<strong>Q:</strong> 既然思想是我的，那么为什么有时候我控制不了我的负面情绪？</p><p>　　A: 操作系统不会允许用户访问、修改及删除核心系统文件，因为这会损坏系统，导致运行异常。</p><p>　　<strong>Q:</strong> 鲁迅虽然很牛，但在这世界十大文豪里是不是凑数的？</p><p>　　A: 为什么文豪要为文盲排的榜买单？</p><p>　　<strong>Q:</strong> 人类的哪些科技已经接近瓶颈，很久没有重大突破了？</p><p>　　A: 烧开水</p><p>　　<strong>Q:</strong> 如何看待某些人下载软件喜欢到官网的偏好？</p><p>　　A: 同学你没中过百度全家桶吧？</p><p>　　<strong>Q:</strong> 为什么很多人买笔记本打游戏，而不用性能更好的台式机？</p><p>　　A: 因为买不起房子。。。</p><p>　　<strong>Q:</strong> 第一次听好耳机对你带来的震撼有多大？</p><p>　　A: 第一次听好耳机不会给人多大震撼，但是当换回普通耳机的时候，震撼就来了</p><p>　　<strong>Q:</strong> Chrome 真的很费电吗？</p><p>　　A: 不费电，我现在就在用 Chrome，用到现在这么久，笔记本电量还有 50%，我估讠</p><p>　　<strong>Q:</strong> MacBook 上安装 Windows 后的使用体验如何？</p><p>　　A: 像突然间有了软肋，并且还失去了铠甲。</p><p>　　<strong>Q:</strong> 家里所有有关产品都用苹果产品是一种什么体验？</p><p>　　A: 来个电话全家都响了起来</p><p>　　<strong>Q:</strong> 你为什么不买 iPhone X？</p><p>　　A: 日益增长的美好生活需要和贫穷的现实之间的矛盾</p><p>　　<strong>Q:</strong> 为什么有人愿意花几千元买 iPhone ，却不愿意花几十元买正版 iPhone 软件和游戏？</p><p>　　A: 因为他们下载不到 iPhone</p><p>　　<strong>Q:</strong> 有什么 App 取的名字特别惊艳？</p><p>　　A: 水表助手…是查快递的…</p><p>　　<strong>Q:</strong> 你为什么要买移动硬盘？</p><p>　　A: 条件好了也要给自己的女人们住舒适点啊</p><p>　　<strong>Q:</strong> 如何用 iPad 遥控 PC 关机？</p><p>　　A: 瞄准 PC 电源键扔过去</p><p>　　Q: 如何评价 2016 年 9 月 7 日的苹果发布会？</p><p>　　A: 为了新 MacBook Pro，半年看了三场发布会……</p><p>　　Q: 如何评价 Internet Explorer？</p><p>　　A: 下载其他浏览器的浏览器</p><p>　　-----一年后-----</p><p>　　IE8 以下好烂，做前端想哭的节奏。</p><p>　　<strong>Q:</strong> 爸妈让我攒钱买房，我却想买苹果电脑怎么办？</p><p>　　A: 你要真能 3 年攒 50 万的房子，差这 1 万 7 买个电脑么，大哥?</p><p>　　<strong>Q:</strong> 有哪些垃圾手机软件？</p><p>　　A: 短信拦截软件！ 拦截后告诉你它拦截了一条短信。 我相信 99% 的人会再去点进去看一下被拦截的短信！</p><p>　　<strong>Q:</strong> 一个完整的 PPT 做下来，最让你头疼的是什么？</p><p>　　A: 怎样向领导隐藏自己的实力。</p><p>　　<strong>Q:</strong> 什么是 Vim 可以做而 Emacs 做不到的？</p><p>　　A: 帮助乌干达的可怜儿童……</p><p>　　<strong>Q:</strong> 苹果用户为什么选择苹果？</p><p>　　A: 因为不用苹果的用户不是苹果用户。</p><p>　　<strong>Q:</strong> 计算机世界里有哪些经典谣言？</p><p>　　A: Windows 正在联机寻找解决方案。</p><p>　　<strong>Q:</strong> 有线鼠标会被无线鼠标取代吗？</p><p>　　A: 我觉得在网吧有线鼠标就不会被取代</p><p>　　<strong>Q:</strong> 计算机世界里有哪些经典谣言？</p><p>　　A: 我已阅读并同意该条款</p><p>　　<strong>Q:</strong> 计算机系的学生都有哪些口头禅？</p><p>　　A: 我电脑上运行的好好的啊⋯⋯</p><p>　　<strong>Q:</strong> 如何看待百度官博公开辟谣涉李彦宏家事传闻？</p><p>　　A：「中国人对隐私没那么敏感，愿意用隐私换取便利。」——李彦宏</p><p>　　<strong>Q:</strong> 在飞机上遇到了马云该怎么聊天？</p><p>　　A: Hello Jack, my name is Jackson.</p><p>　　<strong>Q:</strong> 如何理解马云说八年后房如葱？</p><p>　　A:&nbsp;赶紧买葱啊，葱要涨价了！！！</p><p>　　<strong>Q:</strong> 如何理解马云说的「把地主杀了，不等于你能富起来」这句话？</p><p>　　A: 他的意思是「别杀我」</p><p>　　<strong>Q:</strong> 如何看待百度在魏则西事件过去之后又悄悄的把承诺整改的广告提示颜色调淡了？</p><p>　　A: 请大家不要黑百度，我是做前端开发的，这是时间久了，网页 CSS 掉色了</p><p><br/></p>', CAST(N'2018-11-28T15:32:10.077' AS DateTime), CAST(N'2018-11-15T15:32:10.073' AS DateTime), 2, 0, 102, 1, N'', N'', 1, 4, 4)
INSERT [dbo].[m_Posts] ([PostsId], [Title], [Contents], [PostDate], [LastDate], [UserId], [PlusCount], [ReadCount], [IsShow], [Tags], [ImgUrl], [IsReply], [AnswerCount], [ChannelId]) VALUES (3036, N'测试场文章发布', N'<p><span style="white-space: nowrap;">&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;WebSocket技术使用率越来越频繁,比如说我们做在线客服系统,网站消息推送,扫码登录以及聊天室等都需要用到,这篇文章我们将使用WebSocket实现一个简单的聊天室.&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;说道聊天室,我们想到的肯定是需要客户端以及服务端,那接下来我们看看服务端我们怎么使用AspNet Core来实现呢？&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;新建一个项目AspNet Core Web应用项目(在选择模板时,我们选用空项目模板就行):MVCDemo.Chat,这个就是我们的项目了&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://file.buyungu.com/2/2018/4/ae68242077d04906a4b6e209039b728b.png&quot; style=&quot;max-width:650px;&quot; alt=&quot;缩略图&quot;&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;接下来我们新建类:WebSocketHandler以及AsyncReceive类,&lt;span style=&quot;white-space: normal;&quot;&gt;WebSocketHandler&lt;/span&gt;类用来接收并且处理来自客户端WebSocket的连接请求,&lt;span style=&quot;white-space: normal;&quot;&gt;AsyncReceive类用来接收来自客户端的消息,&lt;/span&gt;代码如下:&lt;/p&gt;&lt;pre class=&quot;prettyprint&quot;&gt;&lt;code class=&quot;language-csharp&quot;&gt;using System;</span></p><p><span style="white-space: nowrap;">using System.Threading.Tasks;</span></p><p><span style="white-space: nowrap;">using Microsoft.AspNetCore.Builder;</span></p><p><span style="white-space: nowrap;">using Microsoft.AspNetCore.Http;</span></p><p><span style="white-space: nowrap;">namespace MVCDemo.Chat</span></p><p><span style="white-space: nowrap;">{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;public class WebSocketHandler</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;private static async Task AsyncAccept(HttpContext hc, Func&amp;lt;Task&amp;gt; n)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (!hc.WebSockets.IsWebSocketRequest)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;return;</span></p><p><span style="white-space: nowrap;"><br/></span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var socket = await hc.WebSockets.AcceptWebSocketAsync();</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var rec = new AsyncReceive(socket);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;await rec.ProcessReceive();</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;/// &amp;lt;summary&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;/// branches the request pipeline for this SocketHandler usage</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;/// &amp;lt;/summary&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;/// &amp;lt;param name=&quot;app&quot;&amp;gt;&amp;lt;/param&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;public static void Map(IApplicationBuilder app)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;app.UseWebSockets();</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;app.Use(middleware: AsyncAccept);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">}&lt;/code&gt;&lt;/pre&gt;&lt;pre class=&quot;prettyprint&quot;&gt;&lt;code class=&quot;language-csharp&quot;&gt;using System;</span></p><p><span style="white-space: nowrap;">using System.Threading;</span></p><p><span style="white-space: nowrap;">using System.Threading.Tasks;</span></p><p><span style="white-space: nowrap;">using System.Net.WebSockets;</span></p><p><span style="white-space: nowrap;">namespace MVCDemo.Chat</span></p><p><span style="white-space: nowrap;">{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;public class AsyncReceive</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;private const int BufferSize = 1024;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;private WebSocket _socket { get; set; }</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;public AsyncReceive(WebSocket socket)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;_socket = socket;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;public &amp;nbsp;async Task ProcessReceive()</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var buffer = new byte[BufferSize];</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var seg = new ArraySegment&amp;lt;byte&amp;gt;(buffer);</span></p><p><span style="white-space: nowrap;"><br/></span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;while (_socket.State == WebSocketState.Open)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var incoming = await _socket.ReceiveAsync(seg, CancellationToken.None);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (incoming.Count &amp;gt; 0)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;byte[] b = new byte[incoming.Count];</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Array.Copy(buffer, b, b.Length);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;MessageDealWidth.DealWidth(b, _socket);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Array.Clear(buffer, 0, buffer.Length);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (_socket.State != WebSocketState.Open)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;try</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;string tokenId = string.Empty;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//当用户处于离线状态时从连接池中删除该对象</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;foreach (AsyncUserToken token in ConnectionManager.Connections.Values)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (token.ConnectSocket == _socket)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;tokenId = token.TokenId;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;break;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;AsyncUserToken userToken = null;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ConnectionManager.Connections.TryRemove(tokenId, out userToken);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;catch { }</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">}&lt;/code&gt;&lt;/pre&gt;&lt;p&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;由于文章篇幅有限,我们这里就只贴出关键性的代码,完整代码可以在文章结尾的示例中获得,接下来我们需要在Startup.cs&amp;nbsp;文件中配置WebSocket使用:&amp;nbsp;&amp;nbsp;&lt;/p&gt;&lt;pre class=&quot;prettyprint&quot;&gt;&lt;code class=&quot;language-csharp&quot;&gt;using Microsoft.AspNetCore.Builder;</span></p><p><span style="white-space: nowrap;">using Microsoft.AspNetCore.Hosting;</span></p><p><span style="white-space: nowrap;">using Microsoft.AspNetCore.Http;</span></p><p><span style="white-space: nowrap;">using Microsoft.Extensions.DependencyInjection;</span></p><p><span style="white-space: nowrap;"><br/></span></p><p><span style="white-space: nowrap;">namespace MVCDemo.Chat</span></p><p><span style="white-space: nowrap;">{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;public class Startup</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;public void ConfigureServices(IServiceCollection services)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;public void Configure(IApplicationBuilder app, IHostingEnvironment env)</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (env.IsDevelopment())</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;app.UseDeveloperExceptionPage();&lt;/code&gt;&lt;p&gt;&lt;code class=&quot;language-csharp&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}&lt;/code&gt;&lt;/p&gt;&lt;p&gt;&lt;code class=&quot;language-csharp&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//这里表示前段访问的/ws下的请求由我们自定义的类来处理&lt;/code&gt;&lt;/p&gt;&lt;code class=&quot;language-csharp&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;app.Map(&quot;/ws&quot;, WebSocketHandler.Map);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;app.Run(async (context) =&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;await context.Response.WriteAsync(&quot;Hello World!&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;});</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">}&lt;/code&gt;&lt;/pre&gt;&lt;p&gt;服务端运行后的效果:&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://file.buyungu.com/2/2018/4/c43e53f845144645a01cee919066d15a.png&quot; style=&quot;max-width:650px;&quot; alt=&quot;缩略图&quot;&gt;&lt;/p&gt;&lt;p&gt;接下来我们看看客户端的实现代码(完整代码请查看示例源代码):&lt;/p&gt;&lt;pre class=&quot;prettyprint&quot;&gt;&lt;code class=&quot;language-javascript&quot;&gt;@section Scripts{</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;&amp;lt;script type=&quot;text/javascript&quot;&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//Socket实例</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var ChatSocket = function () {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var ws = null;//WebSocket对象</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//创建服务器连接</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ChatSocket.OpenConnection = function (tokenId) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;///初始化对象</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws = new WebSocket(&quot;ws://127.0.0.1:3907/ws&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//启动消息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (ws != null) {</span></p><p><span style="white-space: nowrap;">&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;try {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws.onopen = function (event) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(&quot;success&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//接收消息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws.onmessage = function (event) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var json = JSON.parse(event.data);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(json);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (json.MessageType == 98) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#NickName&quot;).attr(&quot;disabled&quot;, true);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#btn_AddChat&quot;).attr(&quot;disabled&quot;, true);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var my = &amp;quot;&amp;lt;a href=&quot;#&quot; class=&quot;list-group-item active&quot;&amp;gt;&amp;quot; + nickName + &amp;quot;&amp;lt;/a&amp;gt;&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#articleclassifyList&quot;).append(my);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//插入其它用户</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var other = json.MessageBody.split(&amp;quot;|&amp;quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;for (var i = 0; i &amp;lt; other.length; i++) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var htm = &amp;quot;&amp;lt;a href=&quot;#&quot; class=&quot;list-group-item&quot;&amp;gt;&amp;quot; + other[i] + &amp;quot;&amp;lt;/a&amp;gt;&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#articleclassifyList&quot;).append(htm);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;else if (json.MessageType == 99) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var htm = &amp;quot;&amp;lt;a href=&quot;#&quot; class=&quot;list-group-item&quot;&amp;gt;&amp;quot; + json.MessageBody + &amp;quot;&amp;lt;/a&amp;gt;&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#articleclassifyList&quot;).append(htm);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;else if (json.MessageType == 2) {&nbsp;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//处理来自其它用户的聊天消息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var htm = &amp;quot;&amp;lt;div class=&quot;alert&quot;&amp;gt;&amp;quot; + json.MessageBody + &amp;quot;&amp;lt;/div&amp;gt;&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#ChatMessageList&quot;).prepend(htm);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws.onclose = function (event) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws = null;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(&quot;连接已经被关闭&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws.onerror = function (event) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(event);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(&quot;连接服务器异常&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;catch (ex) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(ex.message);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;else {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;console.log(&quot;已经与服务器断开连接&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//发送消息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ChatSocket.SendMessage = function (message) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (ws != null) {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;ws.send(message);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;else {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;alert(&quot;当前连接已断开,消息不能发送出去&quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;return ChatSocket;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;};</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;lt;/script&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;&amp;lt;script type=&quot;text/javascript&quot;&amp;gt;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//定义参数信息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var nickName = &amp;quot;我是用户@(System.Guid.NewGuid().ToString().Replace(&quot;-&quot;,&quot;&quot;).ToUpper())&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var tokenID = &amp;quot;@(System.Guid.NewGuid().ToString().Replace(&quot;-&quot;,&quot;&quot;).ToUpper())&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//初始化WebSocket</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var chat = new ChatSocket();</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;chat.OpenConnection(tokenID);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//事件处理</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//进入聊天室</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#btn_AddChat&quot;).click(function () {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;nickName = $(&quot;#NickName&quot;).val();</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//当连接成功后向服务器发送一条连接消息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var message = &amp;quot;{&quot;MessageType&quot;:1,&quot;SendTokenID&quot;:&quot;&amp;quot; + tokenID + &amp;quot;&quot;,&quot;ReceiveTokenID&quot;:&quot;0&quot;,&quot;MessageBody&quot;:&quot;&amp;quot; + nickName + &amp;quot;&quot;}&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;chat.SendMessage(message);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;});</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//发送消息</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#btn_SendMessage&quot;).click(function () {</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var messageText = $(&quot;#ChatMeesageText&quot;).val();</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;if (messageText != &quot;&quot;) {&nbsp;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var message = &amp;quot;{&quot;MessageType&quot;:2,&quot;SendTokenID&quot;:&quot;&amp;quot; + tokenID + &amp;quot;&quot;,&quot;ReceiveTokenID&quot;:&quot;0&quot;,&quot;MessageBody&quot;:&quot;&amp;quot; + messageText + &amp;quot;&quot;}&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;chat.SendMessage(message);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//添加当前用户</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;var htm = &amp;quot;&amp;lt;div class=&quot;alert &amp;nbsp;alert-success &quot;&amp;gt;&amp;quot; + messageText + &amp;quot;&amp;lt;/div&amp;gt;&amp;quot;;</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#ChatMessageList&quot;).prepend(htm);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;//清空聊天记录</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;$(&quot;#ChatMeesageText&quot;).val(&amp;quot;&amp;quot;);</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;}</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;});</span></p><p><span style="white-space: nowrap;">&nbsp;&amp;nbsp; &amp;nbsp;&amp;lt;/script&amp;gt;</span></p><p><span style="white-space: nowrap;">}&lt;/code&gt;&lt;/pre&gt;&lt;p&gt;客户端运行效果如下:&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://file.buyungu.com/2/2018/4/630a889f138b480e910d9baa71f7b468.png&quot; style=&quot;max-width:650px;&quot; alt=&quot;缩略图&quot;&gt;&lt;img src=&quot;http://file.buyungu.com/2/2018/4/e2c8c809615d4bb6a14778e2ab5eac2a.png&quot; style=&quot;max-width:650px;&quot; alt=&quot;缩略图&quot;&gt;&lt;/p&gt;&lt;p&gt;这样我们就使用WebSocket技术实现了一个简单的聊天室功能了.示例源代码下载:&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://www.buyungu.com/posts/read/3021&quot; target=&quot;_blank&quot; title=&quot;示例源代码下载&quot;&gt;http://www.buyungu.com/posts/read/3021&lt;/a&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;如果你觉得本文章对你有用,请多多支持本站&lt;/p&gt;</span></p><p><br/></p>', CAST(N'2018-12-04T13:37:17.187' AS DateTime), CAST(N'2018-12-04T13:37:17.187' AS DateTime), 2, 0, 10, 1, N'', N'', 1, 0, 1)
SET IDENTITY_INSERT [dbo].[m_Posts] OFF
SET IDENTITY_INSERT [dbo].[m_PostsAnswer] ON 

INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (1, N'<p>我是回答测试</p>', CAST(N'2018-06-09T12:45:09.110' AS DateTime), 2, 3032, 1, 5, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (3, N'<p>再测试回复</p>', CAST(N'2018-06-11T16:30:42.037' AS DateTime), 2, 3032, 0, 2, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (4, N'<p>是大法</p>', CAST(N'2018-06-11T16:30:52.603' AS DateTime), 2, 3032, 0, 0, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (5, N'<p>使用注入啊</p>', CAST(N'2018-06-20T16:22:20.613' AS DateTime), 2, 3033, 1, 3, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (6, N'<p>同过下面这种方式也是可以的</p><pre class="prettyprint"><code class="language-csharp">public voId Save([FromServices]IHostingEnvironment env, IFormFile file)
{
 &nbsp; &nbsp; &nbsp; string filePath = env.WebRootPath;
}</code></pre><p><br/></p>', CAST(N'2018-06-20T17:37:01.387' AS DateTime), 2, 3033, 0, 0, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (7, N'<p>很棒&nbsp;已经用上了</p>', CAST(N'2018-11-14T09:58:59.737' AS DateTime), 2, 3034, 0, 0, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (8, N'<p>一点都不好笑</p>', CAST(N'2018-11-15T15:34:18.280' AS DateTime), 2, 3035, 2, 5, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (9, N'<p>测试回复消息通知</p>', CAST(N'2018-11-21T18:12:54.637' AS DateTime), 2, 3035, 1, 0, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (10, N'<p>回复的不错哈</p>', CAST(N'2018-11-21T18:18:27.197' AS DateTime), 2, 3035, 0, 0, 1)
INSERT [dbo].[m_PostsAnswer] ([AnswerId], [Contents], [PostDate], [UserId], [PostsId], [Plus], [CommentsCount], [IsShow]) VALUES (11, N'<p>不错不错</p>', CAST(N'2018-11-23T10:52:23.480' AS DateTime), 2, 3035, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[m_PostsAnswer] OFF
SET IDENTITY_INSERT [dbo].[m_PostsAnswerRecords] ON 

INSERT [dbo].[m_PostsAnswerRecords] ([RecordsId], [AnswerId], [UserId], [AppendTime], [RecordsType]) VALUES (1, 2, 2, CAST(N'2018-06-11T15:11:06.840' AS DateTime), 1)
INSERT [dbo].[m_PostsAnswerRecords] ([RecordsId], [AnswerId], [UserId], [AppendTime], [RecordsType]) VALUES (11, 1, 2, CAST(N'2018-06-12T00:01:00.357' AS DateTime), 1)
INSERT [dbo].[m_PostsAnswerRecords] ([RecordsId], [AnswerId], [UserId], [AppendTime], [RecordsType]) VALUES (13, 5, 2, CAST(N'2018-11-13T16:54:13.643' AS DateTime), 1)
INSERT [dbo].[m_PostsAnswerRecords] ([RecordsId], [AnswerId], [UserId], [AppendTime], [RecordsType]) VALUES (20, 9, 2, CAST(N'2018-11-22T17:52:58.007' AS DateTime), 1)
INSERT [dbo].[m_PostsAnswerRecords] ([RecordsId], [AnswerId], [UserId], [AppendTime], [RecordsType]) VALUES (21, 8, 2, CAST(N'2018-11-22T18:17:45.770' AS DateTime), 1)
INSERT [dbo].[m_PostsAnswerRecords] ([RecordsId], [AnswerId], [UserId], [AppendTime], [RecordsType]) VALUES (23, 8, 2022, CAST(N'2018-11-29T15:02:08.657' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[m_PostsAnswerRecords] OFF
SET IDENTITY_INSERT [dbo].[m_PostsChannel] ON 

INSERT [dbo].[m_PostsChannel] ([ChannelId], [ChannelName], [Remarks], [IsShow], [AppendTime], [IsManager], [SortCount]) VALUES (1, N'头条', N'头条资讯', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 0, 1)
INSERT [dbo].[m_PostsChannel] ([ChannelId], [ChannelName], [Remarks], [IsShow], [AppendTime], [IsManager], [SortCount]) VALUES (2, N'有问', N'问答', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 0, 2)
INSERT [dbo].[m_PostsChannel] ([ChannelId], [ChannelName], [Remarks], [IsShow], [AppendTime], [IsManager], [SortCount]) VALUES (3, N'分享', N'资料分享', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 0, 3)
INSERT [dbo].[m_PostsChannel] ([ChannelId], [ChannelName], [Remarks], [IsShow], [AppendTime], [IsManager], [SortCount]) VALUES (4, N'有言', N'话题讨论', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 0, 4)
INSERT [dbo].[m_PostsChannel] ([ChannelId], [ChannelName], [Remarks], [IsShow], [AppendTime], [IsManager], [SortCount]) VALUES (5, N'吐槽', N'意见与建议', 1, CAST(N'2018-11-12T18:18:18.000' AS DateTime), 0, 5)
SET IDENTITY_INSERT [dbo].[m_PostsChannel] OFF
SET IDENTITY_INSERT [dbo].[m_PostsComments] ON 

INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (8, N'评论测试', CAST(N'2018-06-11T15:32:38.933' AS DateTime), 2, 0, 1, 1, 1)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (9, N'评论好', CAST(N'2018-06-11T16:27:27.637' AS DateTime), 2, 0, 1, 1, 1)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (10, N'你懂的', CAST(N'2018-06-12T00:01:12.977' AS DateTime), 2, 0, 1, 1, 1)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (11, N'在构造函数中注入？', CAST(N'2018-06-20T16:23:02.977' AS DateTime), 2, 0, 5, 1, 1)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (12, N'是的', CAST(N'2018-06-20T16:24:48.733' AS DateTime), 2, 0, 5, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (13, N'那我明白了', CAST(N'2018-06-20T16:54:03.477' AS DateTime), 2, 2, 5, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (14, N'还有啥要说的啊', CAST(N'2018-06-20T17:27:52.487' AS DateTime), 2, 2, 1, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (15, N'没有要说的了', CAST(N'2018-06-20T17:28:01.330' AS DateTime), 2, 0, 1, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (16, N'评论消息通知测试', CAST(N'2018-11-21T18:30:58.257' AS DateTime), 2, 0, 8, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (17, N'评论加载出问题了', CAST(N'2018-11-23T10:52:38.607' AS DateTime), 2, 0, 8, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (18, N'不错的选择', CAST(N'2018-11-29T14:47:13.107' AS DateTime), 2, 0, 3, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (19, N'你咋这样呢', CAST(N'2018-11-29T14:47:26.783' AS DateTime), 2, 2, 3, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (20, N'看看回复', CAST(N'2018-11-29T15:02:16.497' AS DateTime), 2022, 0, 8, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (21, N'这样就有问题了', CAST(N'2018-11-29T15:02:35.673' AS DateTime), 2022, 0, 8, 1, 0)
INSERT [dbo].[m_PostsComments] ([CommentId], [Contents], [PostDate], [UserId], [ToUserId], [AnswerId], [IsShow], [Plus]) VALUES (22, N'不错了', CAST(N'2018-11-29T15:03:00.583' AS DateTime), 2022, 2, 8, 1, 0)
SET IDENTITY_INSERT [dbo].[m_PostsComments] OFF
SET IDENTITY_INSERT [dbo].[m_PostsCommentsRecords] ON 

INSERT [dbo].[m_PostsCommentsRecords] ([RecordsId], [CommentId], [UserId], [AppendTime], [RecordsType]) VALUES (22, 9, 2, CAST(N'2018-06-11T16:28:53.130' AS DateTime), 1)
INSERT [dbo].[m_PostsCommentsRecords] ([RecordsId], [CommentId], [UserId], [AppendTime], [RecordsType]) VALUES (34, 11, 2, CAST(N'2018-06-20T16:23:10.817' AS DateTime), 1)
INSERT [dbo].[m_PostsCommentsRecords] ([RecordsId], [CommentId], [UserId], [AppendTime], [RecordsType]) VALUES (35, 8, 2, CAST(N'2018-11-22T10:28:46.003' AS DateTime), 1)
INSERT [dbo].[m_PostsCommentsRecords] ([RecordsId], [CommentId], [UserId], [AppendTime], [RecordsType]) VALUES (36, 10, 2, CAST(N'2018-11-22T10:28:47.757' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[m_PostsCommentsRecords] OFF
SET IDENTITY_INSERT [dbo].[m_PostsRecords] ON 

INSERT [dbo].[m_PostsRecords] ([RecordsId], [PostsId], [UserId], [AppendTime], [RecordsType]) VALUES (2, 3034, 2, CAST(N'2018-11-23T17:16:11.597' AS DateTime), 1)
INSERT [dbo].[m_PostsRecords] ([RecordsId], [PostsId], [UserId], [AppendTime], [RecordsType]) VALUES (4, 3032, 2, CAST(N'2018-11-23T17:58:13.597' AS DateTime), 1)
INSERT [dbo].[m_PostsRecords] ([RecordsId], [PostsId], [UserId], [AppendTime], [RecordsType]) VALUES (6, 3034, 2022, CAST(N'2018-11-29T16:46:27.067' AS DateTime), 1)
INSERT [dbo].[m_PostsRecords] ([RecordsId], [PostsId], [UserId], [AppendTime], [RecordsType]) VALUES (13, 3033, 2022, CAST(N'2018-11-29T16:49:40.770' AS DateTime), 1)
INSERT [dbo].[m_PostsRecords] ([RecordsId], [PostsId], [UserId], [AppendTime], [RecordsType]) VALUES (14, 3033, 2, CAST(N'2018-12-05T10:44:04.373' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[m_PostsRecords] OFF
SET IDENTITY_INSERT [dbo].[m_PostsTags] ON 

INSERT [dbo].[m_PostsTags] ([TagsId], [TagsName]) VALUES (1, N'Asp.Net Core MVC')
INSERT [dbo].[m_PostsTags] ([TagsId], [TagsName]) VALUES (2, N'数据库')
INSERT [dbo].[m_PostsTags] ([TagsId], [TagsName]) VALUES (3, N'微服务')
INSERT [dbo].[m_PostsTags] ([TagsId], [TagsName]) VALUES (4, N'.Net Core')
INSERT [dbo].[m_PostsTags] ([TagsId], [TagsName]) VALUES (5, N'安装部署')
INSERT [dbo].[m_PostsTags] ([TagsId], [TagsName]) VALUES (6, N'职场')
SET IDENTITY_INSERT [dbo].[m_PostsTags] OFF
SET IDENTITY_INSERT [dbo].[m_Sms] ON 

INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (1, N'18823812180', N'短信验证码为:181282 服务器返回结果:{"Message":"签名不合法(不存在或被拉黑)","RequestId":"DA52F029-FBA1-4B87-9FB7-599D6BBD92EF","Code":"isv.SMS_SIGNATURE_ILLEGAL"}', CAST(N'2018-11-16T13:24:39.977' AS DateTime), N'::1', 0)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (2, N'18823812180', N'短信验证码为:755045 服务器返回结果:{"Message":"OK","RequestId":"4BD3A270-25B9-43BA-82EB-ED5C5E151020","BizId":"591718443298067514^0","Code":"OK"}', CAST(N'2018-11-27T13:54:35.627' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (3, N'18823812180', N'短信验证码为:656677 服务器返回结果:{"Message":"OK","RequestId":"6A86E8A6-DFEC-4D41-AD6B-805EBE09B606","BizId":"939208443313525884^0","Code":"OK"}', CAST(N'2018-11-28T18:12:11.437' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (4, N'18823812180', N'短信验证码为:269166 服务器返回结果:{"Message":"OK","RequestId":"868ABEFF-5260-4C55-A071-ADB2936DA68A","BizId":"277406543373903718^0","Code":"OK"}', CAST(N'2018-11-28T10:58:24.730' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (5, N'18823812180', N'短信验证码为:857653 服务器返回结果:{"Message":"OK","RequestId":"8E95103C-379E-4063-B4C5-9465F2B147E3","BizId":"991613543383261424^0","Code":"OK"}', CAST(N'2018-11-28T13:34:24.117' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (6, N'18138207129', N'短信验证码为:881275 服务器返回结果:{"Message":"OK","RequestId":"A16CF6EC-F06C-457C-8042-0B757BF04473","BizId":"105611943474441039^0","Code":"OK"}', CAST(N'2018-11-29T14:54:02.353' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (7, N'18138207129', N'短信验证码为:449501 服务器返回结果:{"Message":"OK","RequestId":"D390BEFD-3D9A-4BCA-850D-FCDB1F6F166B","BizId":"729516343474670571^0","Code":"OK"}', CAST(N'2018-11-29T14:57:51.870' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (8, N'18823812180', N'短信验证码为:826380 服务器返回结果:{"Message":"OK","RequestId":"F3AAA403-D7C2-434E-8FFE-EA0C391F6695","BizId":"323008944089280172^0","Code":"OK"}', CAST(N'2018-12-06T17:41:21.083' AS DateTime), N'::1', 1)
INSERT [dbo].[m_Sms] ([SmsID], [Phone], [Contents], [SendTime], [SendIP], [IsOk]) VALUES (9, N'18823812180', N'短信验证码为:609160 服务器返回结果:{"Message":"OK","RequestId":"79E95EFC-82C2-4002-BDCA-280498E43844","BizId":"876422644089543159^0","Code":"OK"}', CAST(N'2018-12-06T17:45:49.027' AS DateTime), N'::1', 1)
SET IDENTITY_INSERT [dbo].[m_Sms] OFF
SET IDENTITY_INSERT [dbo].[m_User] ON 

INSERT [dbo].[m_User] ([UserId], [UserName], [Password], [NickName], [RegisterDate], [LastLoginDate], [LastLoginIP], [RegisterIP], [IsStatus], [HeadUrl], [GroupId], [Phone], [OpenId], [Email], [AddressInfo], [Birthday], [Tags], [Sex]) VALUES (2, N'18812345678', N'e10adc3949ba59abbe56e057f20f883e', N'糊涂书生', CAST(N'2017-04-28T11:50:43.790' AS DateTime), CAST(N'2017-04-28T11:50:43.790' AS DateTime), N'', N'', 1, N'/images/avatar.jpg', 100, N'18823812180', N'', N'', N'深圳', N'', N'一枚.NET程序员', N'男')
SET IDENTITY_INSERT [dbo].[m_User] OFF
SET IDENTITY_INSERT [dbo].[m_UserGroup] ON 

INSERT [dbo].[m_UserGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (0, N'游客', 1)
INSERT [dbo].[m_UserGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (1, N'普通用户', 0)
INSERT [dbo].[m_UserGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (100, N'系统管理员', 0)
INSERT [dbo].[m_UserGroup] ([GroupId], [GroupName], [IsDefault]) VALUES (101, N'用户手机绑定组', 0)
SET IDENTITY_INSERT [dbo].[m_UserGroup] OFF
SET IDENTITY_INSERT [dbo].[m_UserGroupMenu] ON 

INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (101, N'个人资料', N'user', N'info', N'index', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (102, N'资料编辑', N'user', N'info', N'edit', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (103, N'密码修改', N'user', N'info', N'password', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (104, N'我的消息', N'user', N'mymessage', N'index', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (105, N'我的帖子', N'user', N'myposts', N'index', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (108, N'发布帖子', N'', N'posts', N'add', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (113, N'加载回答评论', N'', N'posts', N'loadcomments', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (114, N'帖子浏览', N'', N'posts', N'read', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (115, N'添加回答', N'', N'posts', N'addanswer', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (116, N'首页', N'', N'posts', N'index', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (120, N'又拍云图片上传', N'', N'file', N'upyun', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (128, N'获取帖子属性', N'', N'manager', N'loadproperty', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (129, N'设置帖子属性', N'', N'manager', N'setproperty', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1129, N'帖子模块', N'', N'', N'', 0, 0)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1131, N'用户中心模块', N'', N'', N'', 0, 0)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1133, N'系统模块', N'', N'', N'', 0, 0)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1134, N'导航模块', N'', N'', N'', 0, 0)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1135, N'网址导航', N'', N'navigation', N'index', 1134, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1139, N'获取导航列表', N'', N'navigation', N'loadlist', 1134, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1140, N'用户登录', N'', N'passport', N'login', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1141, N'手机号绑定', N'', N'passport', N'phone', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1143, N'退出登录', N'', N'passport', N'outlogin', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1147, N'绑定手机号', N'', N'passport', N'bindphone', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1148, N'发送短信验证码', N'', N'authorization', N'sendphonevalIdatecode', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1149, N'用户注册', N'', N'passport', N'register', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1150, N'问答首页', N'', N'posts', N'index', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1158, N' 加载回答评论总记录条数', N'', N'posts', N'loadcommentsbytotal', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1159, N'添加回答评论', N'', N'posts', N'addanswercomments', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1160, N'回答点赞', N'', N'posts', N'addanswerplus', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1161, N'评论点赞', N'', N'posts', N'addcommentsplus', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1162, N'发送邮箱验证码', N'', N'authorization', N'sendemailvalIdatecode', 1133, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1163, N'获取消息通知列表', N'', N'message', N'getmessagelist', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1164, N'帖子点赞', N'', N'posts', N'addpostsplus', 1129, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1165, N'更新用户未读消息状态', N'', N'message', N'updatereadstate', 1131, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1166, N'代码模块', N'', N'', N'', 0, 0)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1167, N'代码首页', N'', N'code', N'index', 1166, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1168, N'代码浏览', N'', N'code', N'read', 1166, 1)
INSERT [dbo].[m_UserGroupMenu] ([MId], [MName], [AreaName], [ControllerName], [ActionName], [ParentId], [IsPower]) VALUES (1169, N'添加代码', N'', N'code', N'add', 1166, 1)
SET IDENTITY_INSERT [dbo].[m_UserGroupMenu] OFF
SET IDENTITY_INSERT [dbo].[m_UserGroupPower] ON 

INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2112, 1133, 101)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2113, 1149, 101)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2114, 1148, 101)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2115, 1147, 101)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2116, 1142, 101)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2117, 1141, 101)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2520, 1129, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2521, 113, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2522, 114, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2523, 1150, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2524, 1158, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2525, 1133, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2526, 116, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2527, 1140, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2528, 1141, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2529, 1143, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2530, 1148, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2531, 1149, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2532, 1134, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2533, 1135, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2534, 1139, 0)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2535, 1129, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2536, 1134, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2537, 1148, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2538, 1147, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2539, 1143, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2540, 1141, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2541, 1140, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2542, 120, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2543, 116, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2544, 1133, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2545, 1165, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2546, 1163, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2547, 105, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2548, 104, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2549, 103, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2550, 102, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2551, 101, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2552, 1131, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2553, 1164, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2554, 1161, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2555, 1160, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2556, 1159, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2557, 1158, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2558, 1150, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2559, 115, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2560, 114, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2561, 113, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2562, 108, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2563, 1135, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2564, 1139, 1)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2565, 1129, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2566, 1134, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2567, 1143, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2568, 1141, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2569, 1140, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2570, 129, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2571, 128, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2572, 120, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2573, 116, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2574, 1133, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2575, 1165, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2576, 1163, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2577, 105, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2578, 104, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2579, 103, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2580, 102, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2581, 101, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2582, 1131, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2583, 1164, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2584, 1161, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2585, 1160, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2586, 1159, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2587, 1158, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2588, 1150, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2589, 115, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2590, 114, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2591, 113, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2592, 108, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2593, 1135, 100)
INSERT [dbo].[m_UserGroupPower] ([PId], [MId], [GroupId]) VALUES (2594, 1139, 100)
SET IDENTITY_INSERT [dbo].[m_UserGroupPower] OFF
INSERT [dbo].[m_WebSiteConfig] ([ConfigId], [WebSiteName], [WebSiteUrl], [WebSiteTitle], [WebSiteKeyWord], [WebSiteDescription], [CopyrightText], [IsLogin], [IsRegister], [FilingNo]) VALUES (1, N'51Core技术网', N'http://www.51core.net', N'专注于.NET Core的技术分享网站', N'.net core,asp.net core,mvc', N'专注于.NET Core的技术分享网站', N'版权所有', 1, 1, N'粤ICP备13058630号-3')
SET IDENTITY_INSERT [dbo].[m_WebSiteNavigation] ON 

INSERT [dbo].[m_WebSiteNavigation] ([NavigationId], [LinkUrl], [NavigationName], [IsTarget], [AppendTime], [SortCount], [IsShow]) VALUES (1, N'/posts', N'交流', 0, CAST(N'2018-11-16T16:11:25.000' AS DateTime), 1, 1)
INSERT [dbo].[m_WebSiteNavigation] ([NavigationId], [LinkUrl], [NavigationName], [IsTarget], [AppendTime], [SortCount], [IsShow]) VALUES (2, N'/navigation', N'导航', 0, CAST(N'2018-11-16T16:11:25.000' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[m_WebSiteNavigation] OFF
ALTER TABLE [dbo].[m_Navigation] ADD  CONSTRAINT [DF_m_Navigation_ClickCount]  DEFAULT ((0)) FOR [ClickCount]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'AdminId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员这账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'AdminName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'IsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'AreaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'IsPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'PowerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'MessageId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息类型(0:系统消息,1:帖子消息,2:分享消息)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'MessageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息接收用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产生消息用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'AppendUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储对象Id(PostId ShareId)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'ObjId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经阅读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'NavigationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'NavigationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属导航分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'ClassifyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许回复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'IsReply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'AnswerCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属频道' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'ChannelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'AnswerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属问题帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'Plus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论回复数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'CommentsCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswerRecords', @level2type=N'COLUMN',@level2name=N'RecordsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswerRecords', @level2type=N'COLUMN',@level2name=N'AnswerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswerRecords', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswerRecords', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类型 1表示点赞操作 2表示反对操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswerRecords', @level2type=N'COLUMN',@level2name=N'RecordsType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'AttentionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'AttentionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'ChannelName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否只允许管理员发帖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'IsManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'CommentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回应用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'ToUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'AnswerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsCommentsRecords', @level2type=N'COLUMN',@level2name=N'RecordsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsCommentsRecords', @level2type=N'COLUMN',@level2name=N'CommentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsCommentsRecords', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsCommentsRecords', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类型 1表示点赞操作 2表示反对操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsCommentsRecords', @level2type=N'COLUMN',@level2name=N'RecordsType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsRecords', @level2type=N'COLUMN',@level2name=N'RecordsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsRecords', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsRecords', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsRecords', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类型 1表示点赞操作 2表示反对操作' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsRecords', @level2type=N'COLUMN',@level2name=N'RecordsType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsTags', @level2type=N'COLUMN',@level2name=N'TagsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsTags', @level2type=N'COLUMN',@level2name=N'TagsName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SmsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SendIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发送成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'IsOk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'LastLoginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登陆IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'LastLoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态(true:正常,false:禁止)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'IsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'HeadUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开放平台Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'OpenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地区信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'AddressInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteKeyWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'底部版权申明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'CopyrightText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开放登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'IsLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开放注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'IsRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站备案号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'FilingNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'NavigationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为跳转到新窗口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'IsTarget'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序(从小到大)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'SortCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示到前端' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
USE [master]
GO
ALTER DATABASE [MangoDB] SET  READ_WRITE 
GO
