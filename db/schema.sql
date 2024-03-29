/****** Object:  Database phone    Script Date: 2007/8/25 12:06:41 ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'phone')
	DROP DATABASE [phone]
GO

CREATE DATABASE [phone]  ON (NAME = N'phone_Data', FILENAME = N'D:\sqldata2000\MSSQL$SQL2000\Data\phone_Data.MDF' , SIZE = 61, FILEGROWTH = 10%) LOG ON (NAME = N'phone_Log', FILENAME = N'D:\sqldata2000\MSSQL$SQL2000\Data\phone_log.LDF' , SIZE = 2, FILEGROWTH = 10%)
 COLLATE Chinese_Taiwan_Stroke_CI_AS
GO

exec sp_dboption N'phone', N'autoclose', N'false'
GO

exec sp_dboption N'phone', N'bulkcopy', N'false'
GO

exec sp_dboption N'phone', N'trunc. log', N'false'
GO

exec sp_dboption N'phone', N'torn page detection', N'false'
GO

exec sp_dboption N'phone', N'read only', N'false'
GO

exec sp_dboption N'phone', N'dbo use', N'false'
GO

exec sp_dboption N'phone', N'single', N'false'
GO

exec sp_dboption N'phone', N'autoshrink', N'false'
GO

exec sp_dboption N'phone', N'ANSI null default', N'false'
GO

exec sp_dboption N'phone', N'recursive triggers', N'false'
GO

exec sp_dboption N'phone', N'ANSI nulls', N'false'
GO

exec sp_dboption N'phone', N'concat null yields null', N'false'
GO

exec sp_dboption N'phone', N'cursor close on commit', N'false'
GO

exec sp_dboption N'phone', N'default to local cursor', N'false'
GO

exec sp_dboption N'phone', N'quoted identifier', N'false'
GO

exec sp_dboption N'phone', N'ANSI warnings', N'false'
GO

exec sp_dboption N'phone', N'auto create statistics', N'true'
GO

exec sp_dboption N'phone', N'auto update statistics', N'true'
GO

use [phone]
GO

/****** Object:  View dbo.StatsTemp    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StatsTemp]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[StatsTemp]
GO

/****** Object:  View dbo.VisitsZone    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VisitsZone]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[VisitsZone]
GO

/****** Object:  Table [dbo].[BANNERS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BANNERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BANNERS]
GO

/****** Object:  Table [dbo].[BOMADMIN]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMADMIN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMADMIN]
GO

/****** Object:  Table [dbo].[BOMASCODE]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMASCODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMASCODE]
GO

/****** Object:  Table [dbo].[BOMDATA]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMDATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMDATA]
GO

/****** Object:  Table [dbo].[BOMINV]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMINV]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMINV]
GO

/****** Object:  Table [dbo].[BOMINVTABLES]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMINVTABLES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMINVTABLES]
GO

/****** Object:  Table [dbo].[BOMINVTDATA]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMINVTDATA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMINVTDATA]
GO

/****** Object:  Table [dbo].[BOMITEMS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMITEMS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMITEMS]
GO

/****** Object:  Table [dbo].[BOMJOB]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMJOB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMJOB]
GO

/****** Object:  Table [dbo].[BOMJOB_OLD]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMJOB_OLD]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMJOB_OLD]
GO

/****** Object:  Table [dbo].[BOMMATERIAL]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMMATERIAL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMMATERIAL]
GO

/****** Object:  Table [dbo].[BOMREQUEST]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMREQUEST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMREQUEST]
GO

/****** Object:  Table [dbo].[BOMTEAM]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMTEAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMTEAM]
GO

/****** Object:  Table [dbo].[BOMTEAMJOB]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMTEAMJOB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMTEAMJOB]
GO

/****** Object:  Table [dbo].[BOMTEAMMAT]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BOMTEAMMAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BOMTEAMMAT]
GO

/****** Object:  Table [dbo].[CANCEL]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CANCEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CANCEL]
GO

/****** Object:  Table [dbo].[CASES]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CASES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CASES]
GO

/****** Object:  Table [dbo].[CHAT]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CHAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CHAT]
GO

/****** Object:  Table [dbo].[CHATVISITORS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CHATVISITORS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CHATVISITORS]
GO

/****** Object:  Table [dbo].[COMPLAINS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[COMPLAINS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[COMPLAINS]
GO

/****** Object:  Table [dbo].[CONTACTGROUPS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CONTACTGROUPS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CONTACTGROUPS]
GO

/****** Object:  Table [dbo].[CONTACTS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CONTACTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CONTACTS]
GO

/****** Object:  Table [dbo].[DISPATCH]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DISPATCH]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DISPATCH]
GO

/****** Object:  Table [dbo].[GIFTGIVEN]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GIFTGIVEN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GIFTGIVEN]
GO

/****** Object:  Table [dbo].[GIFTS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GIFTS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GIFTS]
GO

/****** Object:  Table [dbo].[HOLIDAYS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HOLIDAYS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HOLIDAYS]
GO

/****** Object:  Table [dbo].[INFO]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[INFO]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[INFO]
GO

/****** Object:  Table [dbo].[KPROBLEM]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[KPROBLEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[KPROBLEM]
GO

/****** Object:  Table [dbo].[LOGINS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LOGINS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LOGINS]
GO

/****** Object:  Table [dbo].[MAT]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MAT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MAT]
GO

/****** Object:  Table [dbo].[MATUSED]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MATUSED]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MATUSED]
GO

/****** Object:  Table [dbo].[MESSAGES]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MESSAGES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MESSAGES]
GO

/****** Object:  Table [dbo].[MISSIONS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MISSIONS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MISSIONS]
GO

/****** Object:  Table [dbo].[PAGEVIEWS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PAGEVIEWS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PAGEVIEWS]
GO

/****** Object:  Table [dbo].[PERSONNEL]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PERSONNEL]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PERSONNEL]
GO

/****** Object:  Table [dbo].[PROBLEM]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PROBLEM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PROBLEM]
GO

/****** Object:  Table [dbo].[REPAIR]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPAIR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPAIR]
GO

/****** Object:  Table [dbo].[REPAIRLOG]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPAIRLOG]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPAIRLOG]
GO

/****** Object:  Table [dbo].[REPORTERGROUPS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPORTERGROUPS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPORTERGROUPS]
GO

/****** Object:  Table [dbo].[REPORTERS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPORTERS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPORTERS]
GO

/****** Object:  Table [dbo].[REPTEAM]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPTEAM]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPTEAM]
GO

/****** Object:  Table [dbo].[REPZONES]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[REPZONES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[REPZONES]
GO

/****** Object:  Table [dbo].[SMS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SMS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SMS]
GO

/****** Object:  Table [dbo].[SMSHN]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SMSHN]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SMSHN]
GO

/****** Object:  Table [dbo].[STAFF]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STAFF]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STAFF]
GO

/****** Object:  Table [dbo].[STATS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[STATS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[STATS]
GO

/****** Object:  Table [dbo].[TIME]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TIME]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TIME]
GO

/****** Object:  Table [dbo].[URLALIAS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[URLALIAS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[URLALIAS]
GO

/****** Object:  Table [dbo].[VISITORS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VISITORS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VISITORS]
GO

/****** Object:  Table [dbo].[VISITS]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VISITS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VISITS]
GO

/****** Object:  Table [dbo].[VISITSB]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VISITSB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VISITSB]
GO

/****** Object:  Table [dbo].[ZAIPAI]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ZAIPAI]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ZAIPAI]
GO

/****** Object:  Table [dbo].[ZONES]    Script Date: 2007/8/25 12:06:44 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ZONES]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ZONES]
GO

/****** Object:  Table [dbo].[BANNERS]    Script Date: 2007/8/25 12:06:47 ******/
CREATE TABLE [dbo].[BANNERS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MAXVIEW] [int] NOT NULL ,
	[URL] [varchar] (150) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PLACE] [int] NULL ,
	[FROMDATE] [datetime] NULL ,
	[TIMELIMIT] [int] NOT NULL ,
	[TODATE] [datetime] NULL ,
	[FILEPATH] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NBVIEW] [int] NOT NULL ,
	[NBCLICK] [int] NOT NULL ,
	[ENTERDATE] [datetime] NOT NULL ,
	[DISABLED] [int] NOT NULL ,
	[RESETDATE] [datetime] NOT NULL ,
	[TYPE] [int] NOT NULL ,
	[TEXT] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMBERID] [char] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[COMID] [char] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[APPROVED] [int] NOT NULL ,
	[APPROVEDDATE] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMADMIN]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMADMIN] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[JOBID] [int] NULL ,
	[DATEA] [datetime] NULL ,
	[DATEB] [datetime] NULL ,
	[DATEC] [datetime] NULL ,
	[MONEYREQ] [int] NULL ,
	[TEAMID] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMASCODE]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMASCODE] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[CODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DESCR] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PERC] [int] NULL ,
	[NB] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMDATA]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMDATA] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[IDNUMBER] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[RESPONSIBLE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[YEAR] [int] NULL ,
	[DATEFROM] [datetime] NULL ,
	[DATETO] [datetime] NULL ,
	[DAYS] [int] NULL ,
	[SUPPLIER] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NB] [int] NULL ,
	[PRICE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CALCULTYPE] [int] NULL ,
	[TAXTYPE] [int] NULL ,
	[NBPERIOD] [int] NULL ,
	[MANAGERID] [int] NULL ,
	[FINISHEDDATE] [datetime] NULL ,
	[INSTALL] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMINV]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMINV] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TYPE] [int] NOT NULL ,
	[DATE] [varchar] (8) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[WORKID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMINVTABLES]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMINVTABLES] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SUB] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MAT] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TEAM] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[INVID] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMINVTDATA]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMINVTDATA] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[INVTID] [int] NOT NULL ,
	[DATA] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMITEMS]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMITEMS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ITEM] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[SUBJECT] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PRICE] [int] NULL ,
	[UNIT] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[POINTS] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMJOB]    Script Date: 2007/8/25 12:06:48 ******/
CREATE TABLE [dbo].[BOMJOB] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[WORKID] [int] NOT NULL ,
	[JOBCODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[OURCODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[PLACE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[GETDATE] [datetime] NULL ,
	[EXPECTEDDATE] [datetime] NULL ,
	[POINTS] [int] NULL ,
	[URGENTDATE] [datetime] NULL ,
	[TEAM] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TEAMGETDATE] [datetime] NULL ,
	[TEAMFINISHEDDATE] [datetime] NULL ,
	[TEAMPICDATE] [datetime] NULL ,
	[DATEA] [datetime] NULL ,
	[DATEB] [datetime] NULL ,
	[DATEC] [datetime] NULL ,
	[CANCELDATE] [datetime] NULL ,
	[CANCELREASON] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMO] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMJOB_OLD]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[BOMJOB_OLD] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[GETDATE] [datetime] NULL ,
	[EXPECTEDDATE] [datetime] NULL ,
	[CODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[JOBCODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PLACE] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ABORTDATE] [datetime] NULL ,
	[REASON] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CODEB] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DIFF] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMMATERIAL]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[BOMMATERIAL] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[UNIT] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[SUPPLIER] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CHECKCODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMREQUEST]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[BOMREQUEST] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[DATE] [datetime] NULL ,
	[CODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MATERIALID] [int] NULL ,
	[WORKID] [int] NULL ,
	[REQUESTEDNB] [int] NULL ,
	[GIVENNB] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMTEAM]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[BOMTEAM] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[WORKID] [int] NULL ,
	[TEAM] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DATEA] [datetime] NULL ,
	[DATEB] [datetime] NULL ,
	[JOBID] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMTEAMJOB]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[BOMTEAMJOB] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TEAM] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DATE] [datetime] NULL ,
	[WORKID] [int] NULL ,
	[JOBID] [int] NULL ,
	[PICTURECODE] [varchar] (15) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TYPE] [int] NULL ,
	[MONEYTYPE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MATTYPE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[SUBJECTID] [int] NULL ,
	[QTY] [int] NULL ,
	[ASID] [int] NULL ,
	[MATID] [int] NULL ,
	[USEDQTY] [int] NULL ,
	[SURPLUS] [int] NULL ,
	[LOSS] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BOMTEAMMAT]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[BOMTEAMMAT] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TEAM] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DATE] [datetime] NULL ,
	[MATERIALID] [int] NULL ,
	[REALNB] [int] NULL ,
	[PAYNB] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CANCEL]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[CANCEL] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[NEW] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CASES]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[CASES] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ORGAN] [char] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NAME] [char] (200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NUMBER] [char] (40) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[OPENDATE] [datetime] NULL ,
	[BIDLIMIT] [datetime] NULL ,
	[APPOINTLIMIT] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DEPOSIT] [int] NULL ,
	[CHARGES] [int] NULL ,
	[BUDGET] [int] NULL ,
	[BASEPRICE] [int] NULL ,
	[PRICE] [int] NULL ,
	[UNITCOUNT] [int] NULL ,
	[UNIT] [float] NULL ,
	[UNITBASE] [float] NULL ,
	[FACTORY] [char] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ANNOUNCEDATE] [datetime] NULL ,
	[INSERTDATE] [datetime] NULL ,
	[DL] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CHAT]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[CHAT] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[TEXT] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[DATE] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CHATVISITORS]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[CHATVISITORS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[IP] [varchar] (16) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[DATE] [datetime] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[COMPLAINS]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[COMPLAINS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[VISITID] [int] NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[HPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[OPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMO] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[REPORTER] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DATE] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CONTACTGROUPS]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[CONTACTGROUPS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMBERID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CONTACTS]    Script Date: 2007/8/25 12:06:49 ******/
CREATE TABLE [dbo].[CONTACTS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[MEMBERID] [int] NOT NULL ,
	[PUB] [int] NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[EMAIL] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PHONE] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[WEB] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NOTES] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ADDRESS] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPANY] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[GROUPID] [int] NOT NULL ,
	[COMPANYID] [int] NULL ,
	[SMSPHONE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DISPATCH]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[DISPATCH] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GIFTGIVEN]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[GIFTGIVEN] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[VISITID] [int] NOT NULL ,
	[MAINID] [int] NOT NULL ,
	[NB] [int] NOT NULL ,
	[INSERTDATE] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GIFTS]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[GIFTS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HOLIDAYS]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[HOLIDAYS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TEAMID] [int] NOT NULL ,
	[TYPE] [int] NOT NULL ,
	[REASON] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[REPLACANT] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[FROMDATE] [datetime] NULL ,
	[TODATE] [datetime] NULL ,
	[ENTERDATE] [datetime] NOT NULL ,
	[MEMO] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ENTERID] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[INFO]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[INFO] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TITLE] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[DESCR] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[IMAGE] [varchar] (80) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMBERID] [int] NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[KPROBLEM]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[KPROBLEM] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[CODE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LOGINS]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[LOGINS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[REPORTERID] [int] NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[IP] [varchar] (16) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MAT]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[MAT] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [char] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [char] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[TYPE] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MATUSED]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[MATUSED] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[VISITID] [int] NOT NULL ,
	[MAINID] [int] NOT NULL ,
	[NB] [int] NOT NULL ,
	[INSERTDATE] [datetime] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MESSAGES]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[MESSAGES] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[MEMBERID] [int] NOT NULL ,
	[SENDERID] [int] NOT NULL ,
	[MESSAGE] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[NEW] [int] NULL ,
	[EMAIL] [int] NULL ,
	[READDATE] [datetime] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MISSIONS]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[MISSIONS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TEAMID] [int] NULL ,
	[REASON] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PLACE] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[FROMDATE] [datetime] NULL ,
	[TODATE] [datetime] NULL ,
	[ENTERDATE] [datetime] NULL ,
	[ENTERID] [int] NULL ,
	[MEMO] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PAGEVIEWS]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[PAGEVIEWS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[MEMBERID] [int] NOT NULL ,
	[PAGE] [varchar] (200) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[IP] [varchar] (16) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PERSONNEL]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[PERSONNEL] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PHONES] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TEAM] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[WORKID] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[BIRTHDAY] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TAIWANID] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ADDRESS] [varchar] (200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ARRIVAL] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DEPARTURE] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMO] [varchar] (300) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[HPHONE] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CODE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PHOTO] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[IDPHOTO] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PROBLEM]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[PROBLEM] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[REPAIR]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[REPAIR] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[REPAIRLOG]    Script Date: 2007/8/25 12:06:50 ******/
CREATE TABLE [dbo].[REPAIRLOG] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[CONFIRMDATE] [datetime] NULL ,
	[PHONE] [varchar] (12) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[REPORTER] [varchar] (30) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[REPORTDATE] [datetime] NULL ,
	[PHONEID] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[BOXID] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[REASON] [varchar] (40) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ADDRESS] [varchar] (200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMO] [varchar] (300) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[VISITSERIAL] [varchar] (15) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[VISITID] [int] NULL ,
	[COMPLAINHPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPLAINOPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPLAINCPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPLAINMEMO] [text] COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPLAINNAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[REPAIRDATE] [datetime] NULL ,
	[COMPLAINSEX] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CORRECTED] [int] NULL ,
	[SMS] [int] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[REPORTERGROUPS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[REPORTERGROUPS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[REPORTERS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[REPORTERS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[CODE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[PASS] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ADMIN] [int] NOT NULL ,
	[SMSLEFT] [int] NOT NULL ,
	[SMSHNID] [int] NOT NULL ,
	[TOTALSMS] [int] NOT NULL ,
	[SMSPHONE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[GROUPID] [int] NOT NULL ,
	[BOM] [int] NOT NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[REPTEAM]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[REPTEAM] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[TEAM] [int] NOT NULL ,
	[REP] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[REPZONES]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[REPZONES] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ZONE] [int] NOT NULL ,
	[REP] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SMS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[SMS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[SENTDATE] [datetime] NOT NULL ,
	[MESSAGE] [varchar] (256) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[PHONE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[RESULT] [int] NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[MEMBERID] [int] NOT NULL ,
	[DELETED] [int] NOT NULL ,
	[LASTTRACKDATE] [datetime] NULL ,
	[MSGID] [varchar] (8) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[ERROR] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TRACKING] [int] NOT NULL ,
	[TRACKMSG] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[LEN] [int] NULL ,
	[SENDDATE] [datetime] NULL ,
	[USINGTIMING] [int] NULL ,
	[VISITID] [int] NULL ,
	[REPAIRID] [int] NULL ,
	[PERSONNELID] [int] NULL ,
	[SMSHNID] [int] NOT NULL ,
	[TYPE] [int] NOT NULL ,
	[ADID] [int] NOT NULL ,
	[ADTEXT] [varchar] (120) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SMSHN]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[SMSHN] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[HN] [varchar] (8) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[PASS] [varchar] (8) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[NAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STAFF]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[STAFF] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[STATS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[STATS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[PATH] [ntext] COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[GENDATE] [datetime] NOT NULL ,
	[FROM] [datetime] NOT NULL ,
	[TO] [datetime] NOT NULL ,
	[ZONE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[ROWCOUNT] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TIME]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[TIME] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[URLALIAS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[URLALIAS] (
	[ID] [int] NOT NULL ,
	[ALIAS] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[URL] [varchar] (100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VISITORS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[VISITORS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[VISID] [int] NOT NULL ,
	[NAME] [varchar] (40) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VISITS]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[VISITS] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[ZONE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[TEAM] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[SERIAL] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[PHONE] [varchar] (14) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[AMPM] [varchar] (4) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[RESULT] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[RESPONSIBLE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[REASON] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[MEMO] [varchar] (300) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CUSTNAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CUSTADDRESS] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CONTACTPHONE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[CONTACTNAME] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[KPROBLEMID] [int] NULL ,
	[ZAIPAIID] [int] NOT NULL ,
	[JOBTYPE] [int] NOT NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VISITSB]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[VISITSB] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[DATE] [datetime] NOT NULL ,
	[ZONE] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[TEAM] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[PHONE] [varchar] (14) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[RESULT] [int] NULL ,
	[RESPONSIBLE] [varchar] (50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[REASON] [int] NULL ,
	[MEMO] [varchar] (300) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[UP] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL ,
	[DOWN] [varchar] (10) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ZAIPAI]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[ZAIPAI] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ZAIPAIID] [int] NOT NULL ,
	[VISID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ZONES]    Script Date: 2007/8/25 12:06:51 ******/
CREATE TABLE [dbo].[ZONES] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[NAME] [varchar] (20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[CODE] [varchar] (5) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL ,
	[COMPANYID] [int] NOT NULL 
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.StatsTemp    Script Date: 2007/8/25 12:06:51 ******/
CREATE VIEW StatsTemp AS SELECT RESULT, TEAM, ZONE, JOBTYPE FROM VISITS WHERE DATE BETWEEN '2003/12/1' AND '2003/12/31'
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  View dbo.VisitsZone    Script Date: 2007/8/25 12:06:51 ******/
CREATE VIEW VisitsZone AS SELECT RESULT, TEAM, JOBTYPE FROM VISITS WHERE ZONE=' HC' AND TEAM='000'
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

