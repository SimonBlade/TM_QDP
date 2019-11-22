USE [master]
GO
/****** Object:  Database [TM_BVG_QDP_dev]    Script Date: 21/11/2019 10:39:27 ******/
CREATE DATABASE [TM_BVG_QDP_dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'T&M_BVG_QDP', FILENAME = N'D:\SQLData\T&M_BVG_QDP_dev.mdf' , SIZE = 92545024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'T&M_BVG_QDP_log', FILENAME = N'D:\SQLLogs\T&M_BVG_QDP_dev_log.ldf' , SIZE = 12197888KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TM_BVG_QDP_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET  MULTI_USER 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET QUERY_STORE = OFF
GO
USE [TM_BVG_QDP_dev]
GO
/****** Object:  User [T&M_QDP_DEV]    Script Date: 21/11/2019 10:39:27 ******/
CREATE USER [T&M_QDP_DEV] FOR LOGIN [T&M_QDP_DEV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [QBASEGROUP\tommy.sun]    Script Date: 21/11/2019 10:39:27 ******/
CREATE USER [QBASEGROUP\tommy.sun] FOR LOGIN [QBASEGROUP\tommy.sun] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [T&M_QDP_DEV]
GO
/****** Object:  Schema [hub]    Script Date: 21/11/2019 10:39:27 ******/
CREATE SCHEMA [hub]
GO
/****** Object:  Schema [link]    Script Date: 21/11/2019 10:39:27 ******/
CREATE SCHEMA [link]
GO
/****** Object:  Schema [log]    Script Date: 21/11/2019 10:39:27 ******/
CREATE SCHEMA [log]
GO
/****** Object:  Schema [ref]    Script Date: 21/11/2019 10:39:27 ******/
CREATE SCHEMA [ref]
GO
/****** Object:  Schema [sat]    Script Date: 21/11/2019 10:39:27 ******/
CREATE SCHEMA [sat]
GO
/****** Object:  Schema [stg]    Script Date: 21/11/2019 10:39:27 ******/
CREATE SCHEMA [stg]
GO
/****** Object:  Table [hub].[address]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[address](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NULL,
 CONSTRAINT [address_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hub].[customer]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[customer](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NULL,
 CONSTRAINT [Customer_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hub].[email]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[email](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NULL,
 CONSTRAINT [email_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hub].[orderheader]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[orderheader](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NOT NULL,
 CONSTRAINT [HubOrderHeader_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hub].[orderline]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[orderline](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NOT NULL,
 CONSTRAINT [HubOrderLine_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hub].[phone]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[phone](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NULL,
 CONSTRAINT [phone_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hub].[preferences]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hub].[preferences](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[BusinessKey] [varchar](100) NOT NULL,
	[LastSeenDate] [datetime] NOT NULL,
 CONSTRAINT [pref_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [link].[customeraddress]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [link].[customeraddress](
	[HashKey] [varchar](32) NOT NULL,
	[CustHash] [varchar](32) NOT NULL,
	[AddressHash] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[LoadEndDate] [datetime] NULL,
 CONSTRAINT [CustomerAddressLink_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [link].[customeremail]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [link].[customeremail](
	[HashKey] [varchar](32) NOT NULL,
	[CustHash] [varchar](32) NOT NULL,
	[EmailHash] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[LoadEndDate] [datetime] NULL,
 CONSTRAINT [CustomerEmailLink_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [link].[customerorderheader]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [link].[customerorderheader](
	[HashKey] [varchar](32) NOT NULL,
	[CustHash] [varchar](32) NOT NULL,
	[orderheaderhash] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[LoadEndDate] [datetime] NULL,
 CONSTRAINT [CustomerOrderHeaderLink_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [link].[customerphone]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [link].[customerphone](
	[HashKey] [varchar](32) NOT NULL,
	[CustHash] [varchar](32) NOT NULL,
	[PhoneHash] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[LoadEndDate] [datetime] NULL,
 CONSTRAINT [CustomerPhoneLink_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [link].[orderheaderorderline]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [link].[orderheaderorderline](
	[HashKey] [varchar](32) NOT NULL,
	[orderheaderhash] [varchar](32) NOT NULL,
	[orderlinehash] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
 CONSTRAINT [CustomerOrderLink_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [log].[job]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log].[job](
	[id] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[startdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [log].[log_jobdetail]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log].[log_jobdetail](
	[id] [varchar](100) NOT NULL,
	[jobid] [varchar](100) NULL,
	[description] [varchar](100) NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[qty_new] [int] NULL,
	[qty_updated] [int] NULL,
	[qty_deleted] [int] NULL,
	[qty_rejected] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [log].[OrderHeaderOrphans]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log].[OrderHeaderOrphans](
	[CONTACTID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [log].[OrderLineRejects]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log].[OrderLineRejects](
	[ORDER] [varchar](40) NULL,
	[SOURCE] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [log].[OutputRejects]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log].[OutputRejects](
	[RecordSource] [varchar](100) NULL,
	[Load_JobName] [varchar](100) NULL,
	[LoadDate] [datetime] NULL,
	[jobId] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [log].[rejected_rows]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [log].[rejected_rows](
	[qbaseid] [int] IDENTITY(1,1) NOT NULL,
	[source_data] [varchar](255) NULL,
	[source_entity] [varchar](255) NULL,
	[source_attribute] [varchar](255) NULL,
	[source_system_id] [varchar](255) NULL,
	[source_value] [varchar](255) NULL,
	[comment] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[job] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[qbaseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ref].[hubentities]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ref].[hubentities](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[Data_flow_name] [varchar](100) NULL,
	[Priority] [int] NULL,
	[Hub_identifier] [varchar](100) NULL,
	[Target_table_name] [varchar](100) NULL,
	[Target_column_number] [smallint] NULL,
	[Target_primary_key_name] [varchar](100) NULL,
	[Target_data_type] [varchar](100) NULL,
	[Source_table_identifier] [varchar](100) NULL,
	[Source_table_name] [varchar](100) NULL,
	[Source_column_name] [varchar](100) NULL,
	[Source_column_data_type] [varchar](100) NULL,
	[Source_column_required] [varchar](10) NULL,
	[Source_column_default_value] [varchar](100) NULL,
	[Business_key_name] [varchar](100) NULL,
	[Business_key_column_description] [varchar](100) NULL,
	[Business_key_column_business_description] [varchar](255) NULL,
	[Business_key_column_business_name] [varchar](100) NULL,
	[Business_key_column_business_alias] [varchar](100) NULL,
	[Business_key_column_acronym_name] [varchar](100) NULL,
	[Last_seen_date_flag] [char](1) NULL,
	[Hard_rules] [varchar](100) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ref].[jobroutinginfo]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ref].[jobroutinginfo](
	[HashKey] [varchar](32) NULL,
	[LoadDate] [datetime] NULL,
	[LastSeenDate] [datetime] NULL,
	[LoadEndDate] [datetime] NULL,
	[Staging_JobName] [varchar](100) NULL,
	[RecordSource] [varchar](100) NULL,
	[Load_jobname] [varchar](100) NOT NULL,
	[Sourcetableidentifier] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [ref].[linkentities]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ref].[linkentities](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[Data_flow_name] [varchar](100) NULL,
	[Priority] [int] NULL,
	[link_identifier] [varchar](100) NULL,
	[Target_table_name] [varchar](100) NULL,
	[Target_column_name] [varchar](100) NULL,
	[Source_table_identifier] [varchar](100) NULL,
	[Source_table_name] [varchar](100) NULL,
	[Source_column_name] [varchar](100) NULL,
	[Source_column_data_type] [varchar](100) NULL,
	[Source_column_required] [varchar](10) NULL,
	[Source_column_default_value] [varchar](100) NULL,
	[Business_key_column_description] [varchar](100) NULL,
	[Business_key_column_business_description] [varchar](255) NULL,
	[Business_key_column_business_name] [varchar](100) NULL,
	[Business_key_column_business_alias] [varchar](100) NULL,
	[Business_key_column_acronym_name] [varchar](100) NULL,
	[Business_key_name] [varchar](100) NULL,
	[Hub_identifier] [varchar](100) NULL,
	[Hub_table_name] [varchar](100) NULL,
	[Hub_reference_number] [int] NULL,
	[Hub_primary_key_name] [varchar](100) NULL,
	[Hub_business_key_name] [varchar](100) NULL,
	[Hub_business_key_column_number] [smallint] NULL,
	[Hub_business_key_column_data_type] [varchar](100) NULL,
	[Last_seen_date_flag] [char](1) NULL,
	[Hard_rules] [varchar](100) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ref].[sourcesystemdefinitions]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ref].[sourcesystemdefinitions](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[identifier] [varchar](100) NOT NULL,
	[technical_description] [varchar](255) NOT NULL,
	[business_description] [varchar](255) NOT NULL,
	[quality] [varchar](25) NOT NULL,
	[data_steward] [varchar](100) NOT NULL,
	[system_administrator] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ref].[sourcetableattributes]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ref].[sourcetableattributes](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LastSeenDate] [datetime] NULL,
	[Table identifier] [varchar](100) NOT NULL,
	[Column identifier] [varchar](100) NOT NULL,
	[Source column physical name] [varchar](100) NOT NULL,
	[Source data type] [varchar](100) NOT NULL,
	[Column description] [varchar](255) NOT NULL,
	[Column business description] [varchar](100) NOT NULL,
	[Column business name] [varchar](100) NOT NULL,
	[Column business alias] [varchar](100) NOT NULL,
	[Column acronym name] [varchar](100) NOT NULL,
	[Required flag] [varchar](100) NOT NULL,
	[Computed flag] [varchar](100) NOT NULL,
	[Target column physical name] [varchar](100) NOT NULL,
	[Target data type] [varchar](100) NOT NULL,
	[Is sequence] [char](1) NOT NULL,
	[Is hash key] [char](1) NOT NULL,
	[Is hash difference] [char](1) NOT NULL,
	[Is record source] [char](1) NOT NULL,
	[Is load date time] [char](1) NOT NULL,
	[Hard rules] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[HashKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[IFSaddress]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[IFSaddress](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NULL,
	[HashDiff] [varchar](32) NULL,
	[address1] [varchar](250) NULL,
	[address2] [varchar](250) NULL,
	[city] [varchar](250) NULL,
	[county] [varchar](250) NULL,
	[zip_code] [varchar](250) NULL,
	[country_db] [varchar](250) NULL,
 CONSTRAINT [IFSAddress_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[IFScustomer]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[IFScustomer](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[HashDiff] [varchar](32) NOT NULL,
	[name] [varchar](250) NULL,
 CONSTRAINT [ifsCustomer_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[IFSemail]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[IFSemail](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[HashDiff] [varchar](32) NOT NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [IFSEmail_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[IFSphone]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[IFSphone](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[HashDiff] [varchar](32) NOT NULL,
	[Phone] [varchar](250) NULL,
	[Mobile] [varchar](250) NULL,
 CONSTRAINT [IFSUSersTelephone_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[SCVcontacts]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[SCVcontacts](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[HashDiff] [varchar](32) NOT NULL,
	[title] [varchar](25) NULL,
	[forename] [varchar](50) NULL,
	[surname] [varchar](50) NULL,
	[dateadded] [datetime] NOT NULL,
	[dateedited] [datetime] NULL,
	[cont_guid] [uniqueidentifier] NULL,
 CONSTRAINT [SCVCustomer_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[SCVorderheader]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[SCVorderheader](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[Hashdiff] [varchar](32) NOT NULL,
	[CONTACTID] [int] NOT NULL,
	[IFSCUSTOMERID] [varchar](25) NULL,
	[IFSADDRESSID] [varchar](25) NULL,
	[ORDER_NO] [varchar](25) NULL,
	[ORDER_CODE] [varchar](25) NULL,
	[DATE_ENTERED] [datetime] NOT NULL,
	[ORDER_VALUE_GROSS] [money] NULL,
	[ORDER_VALUE_EX_DISC_VOUCH] [money] NULL,
	[ORDER_VALUE_NET] [money] NULL,
	[P_AND_P_GROSS] [money] NULL,
	[P_AND_P_NET] [money] NULL,
	[DISCOUNT_VALUE] [money] NULL,
	[VOUCHER_VALUE] [money] NULL,
	[DBGROWTH] [varchar](50) NULL,
	[OWNERSHIP] [varchar](50) NULL,
	[BRAND] [varchar](10) NULL,
	[LINES] [smallint] NULL,
	[PAYMENT_METHOD1] [varchar](50) NULL,
	[PAYMENT_METHOD2] [varchar](50) NULL,
	[ACTUALTAX] [varchar](25) NULL,
	[STATUS] [varchar](25) NULL,
	[PLANT] [money] NULL,
	[SEED] [money] NULL,
	[GIFT] [money] NULL,
	[POT] [money] NULL,
	[TRANSACTION_Type] [varchar](25) NULL,
	[SOURCE] [varchar](25) NULL,
	[OLD_ID] [varchar](25) NULL,
	[ID] [varchar](10) NULL,
	[BULB] [money] NULL,
	[OTHER] [money] NULL,
	[Web_Discount] [money] NULL,
 CONSTRAINT [SCVOrderHEader_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sat].[SCVorderline]    Script Date: 21/11/2019 10:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sat].[SCVorderline](
	[HashKey] [varchar](32) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[LoadEndDate] [datetime] NULL,
	[RecordSource] [varchar](100) NOT NULL,
	[HashDiff] [varchar](50) NOT NULL,
	[ID] [bigint] NOT NULL,
	[ORDER_NO] [varchar](40) NOT NULL,
	[LINENUMBER] [varchar](25) NOT NULL,
	[REL_NUMBER] [varchar](25) NOT NULL,
	[LINE_ITEM_NUMBER] [varchar](25) NOT NULL,
	[DATE_EDITED] [datetime] NULL,
	[PRODUCTID] [int] NOT NULL,
	[CATALOG_NO] [varchar](25) NULL,
	[QTY] [smallint] NOT NULL,
	[SALE_UNIT_PRICE] [numeric](10, 2) NOT NULL,
	[SALE_UNIT_PRICE_GROSS] [numeric](10, 2) NOT NULL,
	[PLANNED_DUE_DATE] [datetime] NULL,
	[STATUS] [varchar](25) NOT NULL,
	[CANCELLATION_CODE] [varchar](25) NOT NULL,
	[LOADGUID] [uniqueidentifier] NULL,
	[Replacement] [varchar](25) NULL,
	[SOURCE] [varchar](25) NOT NULL,
	[Header_ID_old] [bigint] NULL,
	[Header_ID] [bigint] NULL,
	[despatcheddate] [datetime] NULL,
 CONSTRAINT [SCVOrderLines_HashKey] PRIMARY KEY NONCLUSTERED 
(
	[HashKey] ASC,
	[LoadDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_addresshash]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_addresshash] ON [hub].[address]
(
	[RecordSource] ASC,
	[BusinessKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_Custhash]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_Custhash] ON [hub].[customer]
(
	[RecordSource] ASC,
	[BusinessKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_Emailhash]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_Emailhash] ON [hub].[email]
(
	[RecordSource] ASC,
	[BusinessKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_Phonehash]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_Phonehash] ON [hub].[phone]
(
	[RecordSource] ASC,
	[BusinessKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_Prefhash]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_Prefhash] ON [hub].[phone]
(
	[RecordSource] ASC,
	[BusinessKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_CustAddresslink]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_CustAddresslink] ON [link].[customeraddress]
(
	[CustHash] ASC,
	[AddressHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_CustEmaillink]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_CustEmaillink] ON [link].[customeremail]
(
	[CustHash] ASC,
	[EmailHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Udx_CustPhonelink]    Script Date: 21/11/2019 10:39:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Udx_CustPhonelink] ON [link].[customerphone]
(
	[CustHash] ASC,
	[PhoneHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [link].[customeraddress]  WITH CHECK ADD  CONSTRAINT [fk_custaddressLink] FOREIGN KEY([AddressHash])
REFERENCES [hub].[address] ([HashKey])
GO
ALTER TABLE [link].[customeraddress] CHECK CONSTRAINT [fk_custaddressLink]
GO
ALTER TABLE [link].[customeraddress]  WITH CHECK ADD  CONSTRAINT [fk_custLink] FOREIGN KEY([CustHash])
REFERENCES [hub].[customer] ([HashKey])
GO
ALTER TABLE [link].[customeraddress] CHECK CONSTRAINT [fk_custLink]
GO
ALTER TABLE [link].[customeremail]  WITH CHECK ADD  CONSTRAINT [fk_customerLink] FOREIGN KEY([CustHash])
REFERENCES [hub].[customer] ([HashKey])
GO
ALTER TABLE [link].[customeremail] CHECK CONSTRAINT [fk_customerLink]
GO
ALTER TABLE [link].[customeremail]  WITH CHECK ADD  CONSTRAINT [fk_emailLink] FOREIGN KEY([EmailHash])
REFERENCES [hub].[email] ([HashKey])
GO
ALTER TABLE [link].[customeremail] CHECK CONSTRAINT [fk_emailLink]
GO
ALTER TABLE [link].[customerorderheader]  WITH CHECK ADD  CONSTRAINT [fk_Custordheader] FOREIGN KEY([orderheaderhash])
REFERENCES [hub].[orderheader] ([HashKey])
GO
ALTER TABLE [link].[customerorderheader] CHECK CONSTRAINT [fk_Custordheader]
GO
ALTER TABLE [link].[customerphone]  WITH CHECK ADD  CONSTRAINT [fk_custphLink] FOREIGN KEY([CustHash])
REFERENCES [hub].[customer] ([HashKey])
GO
ALTER TABLE [link].[customerphone] CHECK CONSTRAINT [fk_custphLink]
GO
ALTER TABLE [link].[customerphone]  WITH CHECK ADD  CONSTRAINT [fk_phoneLink] FOREIGN KEY([PhoneHash])
REFERENCES [hub].[phone] ([HashKey])
GO
ALTER TABLE [link].[customerphone] CHECK CONSTRAINT [fk_phoneLink]
GO
ALTER TABLE [link].[orderheaderorderline]  WITH CHECK ADD  CONSTRAINT [fk_ordheaderLink] FOREIGN KEY([orderheaderhash])
REFERENCES [hub].[orderheader] ([HashKey])
GO
ALTER TABLE [link].[orderheaderorderline] CHECK CONSTRAINT [fk_ordheaderLink]
GO
ALTER TABLE [link].[orderheaderorderline]  WITH CHECK ADD  CONSTRAINT [fk_ordlineLink] FOREIGN KEY([orderlinehash])
REFERENCES [hub].[orderline] ([HashKey])
GO
ALTER TABLE [link].[orderheaderorderline] CHECK CONSTRAINT [fk_ordlineLink]
GO
ALTER TABLE [sat].[SCVcontacts]  WITH CHECK ADD  CONSTRAINT [fk_SCVcontactssatellitehash] FOREIGN KEY([HashKey])
REFERENCES [hub].[customer] ([HashKey])
GO
ALTER TABLE [sat].[SCVcontacts] CHECK CONSTRAINT [fk_SCVcontactssatellitehash]
GO
ALTER TABLE [sat].[SCVorderheader]  WITH CHECK ADD  CONSTRAINT [fk_SCVorderheaderssatellitehash] FOREIGN KEY([HashKey])
REFERENCES [hub].[orderheader] ([HashKey])
GO
ALTER TABLE [sat].[SCVorderheader] CHECK CONSTRAINT [fk_SCVorderheaderssatellitehash]
GO
ALTER TABLE [sat].[SCVorderline]  WITH CHECK ADD  CONSTRAINT [fk_SCVorderlinesatellitehash] FOREIGN KEY([HashKey])
REFERENCES [hub].[orderline] ([HashKey])
GO
ALTER TABLE [sat].[SCVorderline] CHECK CONSTRAINT [fk_SCVorderlinesatellitehash]
GO
USE [master]
GO
ALTER DATABASE [TM_BVG_QDP_dev] SET  READ_WRITE 
GO
