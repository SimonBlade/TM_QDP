use [TM_BVG_QDP_dev]

--use [T&M_BVG_QDP_prod]

--use [T&M_BVG_QDP_sit]

/*
create schema hub;
go
create schema sat;
go
create schema link;
go
create schema ref;
go
create schema log;
go
create schema stg;
*/
---- drop link tbls first

 go


-- then the satellite
/*IFS*/


if object_id ('[Sat].[IFScustomer]') is not null drop table [sat].[IFScustomer];
if object_id ('[Sat].[IFSaddress]') is not null drop table [sat].[IFSaddress];
if object_id ('[Sat].[IFSemail]') is not null drop table [sat].[IFSemail];
if object_id ('[Sat].[IFSphone]') is not null drop table [sat].[IFSphone];


if object_id ('[sat].[SCVcontacts]') is not null drop table [sat].[SCVcontacts];
if object_id ('[sat].[SCVorderheader]') is not null drop table [sat].[SCVorderheader];
if object_id ('[sat].[SCVorderline]') is not null drop table [sat].[SCVorderline];


---===============================================================================================================================
-- then hubs

if object_id ('[hub].[email]') is not null	drop table [hub].[email];
if object_id ('[hub].[address]') is not null drop table [hub].[address]
if object_id ('[hub].[customer]') is not null drop table [hub].[customer];
if object_id ('[hub].[phone]') is not null drop table [hub].[phone];
if object_id ('[hub].[orderheader]') is not null drop table [hub].[orderheader];
if object_id ('[hub].[orderpreferences]') is not null drop table [hub].[orderpreferences];
if object_id ('[hub].[orderline]') is not null drop table [hub].[orderline];
if object_id ('[hub].[preferences]') is not null drop table [hub].[preferences];


--=====================================================================================================================================
-- links

if object_id ('[link].[customeremail]') is not null	drop table [link].[customeremail];
if object_id ('[link].[customeraddress]') is not null drop table [link].[customeraddress];
if object_id ('[link].[customerphone]') is not null drop table [link].[customerphone];
if object_id ('[link].[customerorderheader]') is not null drop table [link].[customerorderheader];
if object_id ('[link].[orderheaderorderline]') is not null	drop table [link].[orderheaderorderline];


--=======================================================================================================================================
-- refs


if object_id ('[ref].[recordsource]') is not null	drop table [ref].[recordsource];
if object_id ('[ref].[datapackagedefinitions]') is not null	drop table [ref].[datapackagedefinitions];
if object_id ('[ref].[hubentities]') is not null	drop table [ref].[hubentities];
if object_id ('[ref].[satellitelinkmetadata]') is not null	drop table [ref].[satellitelinkmetadata];
if object_id ('[ref].[sourcesystemdefinitions]') is not null	drop table [ref].[sourcesystemdefinitions];
if object_id ('[ref].[sourcetableattributes]') is not null	drop table [ref].[sourcetableattributes];
if object_id ('[ref].[satelliteentities]') is not null drop table [ref].[satelliteentities]
if object_id ('[ref].[linkentities]') is not null drop table [ref].[linkentities]
if object_id  ('[ref].[jobroutinginfo]') is not null drop table [ref].[jobroutinginfo]

 
--======================================================================================================================================
-- log


if object_id ('[log].[job]') is not null	drop table [log].[job];
if object_id ('[log].[log_jobdetail]') is not null	drop table [log].[log_jobdetail];
if object_id ('[log].[rejected_rows]') is not null	drop table [log].[rejected_rows];


--====================================================================================================================================================================





CREATE TABLE [log].[job](
	[id] [varchar](100) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[startdate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



;
CREATE TABLE [log].[log_jobdetail](
	[id] [varchar](100) NOT NULL,
	[jobid] [varchar](100) NULL,
	[description] [varchar](100) NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[qty_new] [int] NULL,
	[qty_updated] [int] NULL,
	[qty_deleted] [int] NULL,
	[qty_rejected] [int] NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


;



CREATE TABLE [log].[rejected_rows](
	[qbaseid] int not null identity (1,1) primary key ,
	[source_data] [varchar](255) NULL,
	[source_entity] [varchar](255) NULL,
	[source_attribute] [varchar](255) NULL,
	[source_system_id] [varchar](255) NULL,
	[source_value] [varchar](255) NULL,
	[comment] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[job] [varchar](255) NULL
) ON [PRIMARY]


--=====================================================================================================================
/*Ref*/




CREATE TABLE [ref].[jobroutinginfo](
	[HashKey] [varchar] (32) null,
	[LoadDate] [datetime] null,
	[LastSeenDate] [datetime] null,
	[LoadEndDate] datetime null,
	[Staging_JobName] [varchar](100) null,
	[RecordSource]  [varchar](100) null,
	[Load_jobname] [varchar] (100) not null,
	[Sourcetableidentifier] [varchar](100) null)



CREATE TABLE [ref].[sourcesystemdefinitions](
	HashKey Varchar (32) NOT NULL,
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





;
CREATE TABLE [ref].[sourcetableattributes](
	HashKey Varchar (32) NOT NULL,
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

 

CREATE TABLE [ref].[hubentities](
	HashKey Varchar (32) NOT NULL,
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

CREATE TABLE [ref].[linkentities](
	HashKey Varchar (32) NOT NULL,
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



---========================================================================================================================================================

--HUB should all have Primary Key of HashKey  
 
--drop table hub.customer

create table hub.customer
(HashKey Varchar (32) not null 
,LoadDate datetime not null 
,RecordSource varchar (100) not null
,BusinessKey varchar (100) not null
,LastSeenDate datetime null
,CONSTRAINT Customer_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


-- unique idx across hashkey and business key 

create Unique Index Udx_Custhash	ON hub.customer (RecordSource, BusinessKey) with ignore_dup_key ;	
 



  
 create table hub.email
(HashKey Varchar (32) not null 
,LoadDate datetime not null 
,RecordSource varchar (100) not null
,BusinessKey varchar (100) not null
,LastSeenDate datetime null
,CONSTRAINT email_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

create Unique Index Udx_Emailhash	ON hub.email (RecordSource, BusinessKey)with ignore_dup_key ;	

 create table hub.[address]
(HashKey Varchar (32) not null 
,LoadDate datetime not null 
,RecordSource varchar (100) not null
,BusinessKey varchar (100) not null
,LastSeenDate datetime   null
,CONSTRAINT address_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


create Unique Index Udx_addresshash	ON hub.[address] (RecordSource, BusinessKey)with ignore_dup_key ;	

 

 create table hub.phone
(HashKey Varchar (32) not null 
,LoadDate datetime not null 
,RecordSource varchar (100) not null
,BusinessKey varchar (100) not null
,LastSeenDate datetime null
,CONSTRAINT phone_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


-- unique idx across hashkey and business key 

create Unique Index Udx_Phonehash	ON hub.phone (RecordSource, BusinessKey) with ignore_dup_key ;	
 



 

create table hub.preferences
(HashKey Varchar (32) not null 
,LoadDate datetime not null 
,RecordSource varchar (100) not null
,BusinessKey varchar (100) not null
,LastSeenDate datetime NOT null
,CONSTRAINT pref_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


-- unique idx across hashkey and business key 

create Unique Index Udx_Prefhash	ON hub.phone (RecordSource, BusinessKey) with ignore_dup_key ;	

GO

 --drop table[hub].[orderheader]

CREATE TABLE [hub].[orderheader](
	HashKey Varchar (32) NOT NULL,
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

 ;
 
 --drop table [hub].[orderline]

CREATE TABLE [hub].[orderline](
	HashKey Varchar (32) NOT NULL,
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



--====================================================================================================================================
-- satellite --
--====================================================================================================================================

-- satellites need primary key across 2 fields - hashkey and loaddate
  

   
-- Customer 


create table sat.[IFScustomer]
(HashKey Varchar (32) not null 
,LoadDate datetime not null 
,LoadEndDate datetime null 
,RecordSource varchar (100) not null
,HashDiff Varchar (32)not null 
,[name]	varchar (250)  null
,CONSTRAINT ifsCustomer_HashKey PRIMARY KEY NONCLUSTERED  
(	HashKey ,  LoadDate)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];




create table sat.SCVcontacts
(
	HashKey varchar(32) not null 
	,LoadDate datetime not null  
	,LoadEndDate datetime null 
	,RecordSource varchar(100) not null
	,HashDiff varchar(32) not null 
	,title	varchar(25) null
	,forename	varchar(50) null
	,surname varchar(50) null
	,dateadded datetime not null
	,dateedited datetime
	,cont_guid uniqueidentifier null
	,CONSTRAINT SCVCustomer_HashKey PRIMARY KEY NONCLUSTERED (HashKey, LoadDate)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 





---===================================================================================================
-- Email
---===================================================================================================



create table sat.[IFSemail]
(HashKey Varchar (32) not null 
,LoadDate datetime not null  
,LoadEndDate datetime null  
,RecordSource varchar (100) not null
,HashDiff Varchar (32)not null 
,email	varchar (255)  null
,CONSTRAINT IFSEmail_HashKey PRIMARY KEY NONCLUSTERED  
(	HashKey ,  LoadDate)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
 



 



---===================================================================================================
-- Address -- 
---===================================================================================================


 

create table sat.IFSaddress
(
	HashKey varchar(32) not null 
	,LoadDate datetime not null  
	,LoadEndDate datetime null 
	,RecordSource varchar(100) null
	,HashDiff varchar(32) null 
	,address1 varchar(250) null
	,address2	varchar(250) null
	,city varchar(250) null
	,county varchar(250) null
	,zip_code varchar(250) null
	,country_db varchar(250) null

	,CONSTRAINT IFSAddress_HashKey PRIMARY KEY NONCLUSTERED (HashKey, LoadDate)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];




---===================================================================================================
-- Phone
---===================================================================================================



--drop table [sat].[IFSphone]

create table [sat].[IFSphone]
 (HashKey Varchar (32) not null 
,LoadDate datetime not null 
,LoadEndDate datetime null 
,RecordSource varchar (100) not null
,HashDiff Varchar (32)not null 
,Phone varchar (250)  null
,Mobile varchar (250)  null
,CONSTRAINT IFSUSersTelephone_HashKey PRIMARY KEY NONCLUSTERED  
(	HashKey ,  LoadDate)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];




----================================================================================================
---- Preferences -- 
----================================================================================================


----drop table sat.acepreferences

--create table sat.acepreferences
-- (
--	 [HashKey] varchar (32) not null 
--	,[LoadDate] datetime not null 
--	,[LoadEndDate] datetime null 
--	,[RecordSource] varchar(100) not null,
--	[preferenceId] [varchar] (10) NOT NULL,
--	[category] [varchar](255)NULL,
--	[code] [varchar](255)NULL,
--	[codelabel] [varchar](255) NULL,
--	[value] [varchar](255) NULL,
--	[valueLabel] [varchar](255) NULL,
--	[createdAt] varchar(50) NOT NULL,
--	[UpdatedAt] varchar(50) NOT NULL,
--	[userId] varchar (10) NOT  NULL,
--	HashDiff varchar(32) not null ,
--	CONSTRAINT AcePreference_HashKey PRIMARY KEY NONCLUSTERED (HashKey, LoadDate)
--		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY];

----drop table sat.dstpreferences


--create table sat.dstpreferences
-- (
--	 [HashKey] varchar (32) not null 
--	,[LoadDate] datetime not null 
--	,[LoadEndDate] datetime null 
--	,[RecordSource] varchar(100) not null
--	,[OptIn] [varchar](10)NULL
--	,[OptOut] [varchar](10)NULL
--	,[MarketingDateOfOptin] [varchar](50) NULL
--	,[ThirdPartyDateOFOptin] [varchar](50) NULL
--	,[MarketingSourceOFOptin] [varchar](50) NULL
--	,[HashDiff] varchar(50) not null 
--	,[Filename] varchar (255) not null
--	CONSTRAINT DSTPreference_HashKey PRIMARY KEY NONCLUSTERED (HashKey, [FileName])
--		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY];



--=================================================================================================================
---- OrderHeader

--drop table [sat].[SCVorderheader]


CREATE TABLE [sat].[SCVorderheader](
	 [HashKey] varchar (32) not null 
	,[LoadDate] datetime not null 
	,[LoadEndDate] datetime null 
	,[RecordSource] varchar(100) not null
	,[Hashdiff] varchar (32) not null 
	,[CONTACTID] [int] NOT NULL
	,[IFSCUSTOMERID] [varchar](25) NULL
	,[IFSADDRESSID] [varchar](25) NULL
	,[ORDER_NO] [varchar](25) NULL
	,[ORDER_CODE] [varchar](25) NULL
	,[DATE_ENTERED] [datetime] NOT NULL
	,[ORDER_VALUE_GROSS] [money] NULL
	,[ORDER_VALUE_EX_DISC_VOUCH] [money] NULL
	,[ORDER_VALUE_NET] [money] NULL
	,[P_AND_P_GROSS] [money] NULL
	,[P_AND_P_NET] [money] NULL
	,[DISCOUNT_VALUE] [money] NULL
	,[VOUCHER_VALUE] [money] NULL
	,[DBGROWTH] [varchar](50) NULL
	,[OWNERSHIP] [varchar](50) NULL
	,[BRAND] [varchar](10) NULL
	,[LINES] [smallint] NULL
	,[PAYMENT_METHOD1] [varchar](50) NULL
	,[PAYMENT_METHOD2] [varchar](50) NULL
	,[ACTUALTAX] [varchar](25) NULL
	,[STATUS] [varchar](25) NULL
	,[PLANT] [money] NULL
	,[SEED] [money] NULL
	,[GIFT] [money] NULL
	,[POT] [money] NULL
	,[TRANSACTION_Type] [varchar](25) NULL
	,[SOURCE] [varchar](25) NULL
	,[OLD_ID] [varchar](25) NULL
	,[ID] [varchar](10) NULL
	,[BULB] [money] NULL
	,[OTHER] [money] NULL
	,[Web_Discount] [money] NULL
		CONSTRAINT SCVOrderHEader_HashKey PRIMARY KEY NONCLUSTERED (HashKey, [LoadDate])
) ON [PRIMARY]
GO


--	 -- orderlines


--drop table [sat].[SCVorderline]
	 
create table [sat].[SCVorderline]
	( [HashKey] varchar (32) not null 
	,[LoadDate] datetime not null 
	,[LoadEndDate] datetime null 
	,[RecordSource] varchar(100) not null
	,[HashDiff] varchar(50) not null
	,[ID] bigint not null
	,[ORDER_NO] varchar (40) not null
    ,[LINENUMBER] varchar (25) not null
    ,[REL_NUMBER] varchar (25) not null
    ,[LINE_ITEM_NUMBER]varchar (25) not null
    ,[DATE_EDITED] datetime null
    ,[PRODUCTID] int not null
    ,[CATALOG_NO] varchar (25) null
    ,[QTY] smallint not null
    ,[SALE_UNIT_PRICE] numeric (10,2) not null
    ,[SALE_UNIT_PRICE_GROSS]numeric (10,2) not null
    ,[PLANNED_DUE_DATE] datetime null
    ,[STATUS]varchar (25) not null
    ,[CANCELLATION_CODE]varchar (25) not null
    ,[LOADGUID] uniqueidentifier
    ,[Replacement] varchar (25)   null
    ,[SOURCE]varchar (25) not null
    ,[Header_ID_old] bigint null
    ,[Header_ID] bigint null
    ,[despatcheddate] datetime null

	CONSTRAINT SCVOrderLines_HashKey PRIMARY KEY NONCLUSTERED ([HashKey], [LoadDate])
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
	
	 

	  
--================================================================================================



 -- Links 
 

 --drop table [link].[customeraddress]

 --drop table 
 -- [link].[customeraddress]
create table [link].[customeraddress]
	(
	HashKey Varchar (32) not null 
	,CustHash Varchar (32) not null 
	,AddressHash Varchar (32) not null 
	,LoadDate datetime not null
	,LastSeenDate datetime   null
	,LoadEndDate datetime  null  
	,CONSTRAINT CustomerAddressLink_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];



 --drop table [link].[customeremail]


create table [link].[customeremail]
	(
	HashKey Varchar (32) not null 
	,CustHash Varchar (32) not null 
	,EmailHash Varchar (32) not null 
	,LoadDate datetime  not null
	,LastSeenDate datetime   null
	,LoadEndDate datetime  null  
	,CONSTRAINT CustomerEmailLink_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];

--drop table [link].[customerphone]

create table [link].[customerphone]
	(
	HashKey Varchar (32) not null 
	,CustHash Varchar (32) not null 
	,PhoneHash Varchar (32) not null 
	,LoadDate datetime not null
	,LastSeenDate datetime  null
	,LoadEndDate datetime  null  
	,CONSTRAINT CustomerPhoneLink_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


drop table [link].[customerorderheader]

create table [link].[customerorderheader]
	(
	HashKey Varchar (32) not null 
	,CustHash Varchar (32) not null 
	,orderheaderhash Varchar (32) not null 
	,LoadDate datetime not null
	,LastSeenDate datetime null
	,LoadEndDate datetime null  
	,CONSTRAINT CustomerOrderHeaderLink_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


--drop table [link].[orderheaderorderline]

create table [link].[orderheaderorderline]
	(
	HashKey Varchar (32) not null 
	,orderheaderhash Varchar (32) not null 
	,orderlinehash Varchar (32) not null 
	,LoadDate datetime not null
	,LastSeenDate datetime not null
	,LoadEndDate datetime  null  
	,CONSTRAINT CustomerOrderLink_HashKey PRIMARY KEY NONCLUSTERED 
(
	HashKey  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];


--===============================================================================================================
-- ForeignKeys
--===============================================================================================================



-- SCV --
  
ALTER TABLE [sat].[SCVcontacts]  WITH CHECK ADD  CONSTRAINT [fk_SCVcontactssatellitehash] FOREIGN KEY([HashKey])
REFERENCES [hub].[customer] ([HashKey]);


ALTER TABLE [sat].[SCVorderheader]  WITH CHECK ADD  CONSTRAINT [fk_SCVorderheaderssatellitehash] FOREIGN KEY([HashKey])
REFERENCES [hub].[orderheader] ([HashKey]);


ALTER TABLE [sat].[SCVorderline]  WITH CHECK ADD  CONSTRAINT [fk_SCVorderlinesatellitehash] FOREIGN KEY([HashKey])
REFERENCES [hub].[orderline] ([HashKey]);



-- -- link 


ALTER TABLE [link].[customeremail]  WITH CHECK ADD  CONSTRAINT [fk_emailLink] FOREIGN KEY([Emailhash])
REFERENCES [hub].[email]([hashkey]);


ALTER TABLE [link].[customeremail]  WITH CHECK ADD  CONSTRAINT [fk_customerLink] FOREIGN KEY([Custhash])
REFERENCES [hub].[customer]([hashkey]);



create Unique Index Udx_CustEmaillink	ON [link].[customeremail] (custhash, emailhash);


ALTER TABLE [link].[customeraddress]  WITH CHECK ADD  CONSTRAINT [fk_custaddressLink] FOREIGN KEY([Addresshash])
REFERENCES [hub].[address]([hashkey]);


ALTER TABLE [link].[customeraddress]  WITH CHECK ADD  CONSTRAINT [fk_custLink] FOREIGN KEY([custhash])
REFERENCES [hub].[customer]([hashkey]);



create Unique Index Udx_CustAddresslink	ON [link].[customerAddress] (custhash, Addresshash);



ALTER TABLE [link].[customerphone]  WITH CHECK ADD  CONSTRAINT [fk_phoneLink] FOREIGN KEY([Phonehash])
REFERENCES [hub].[phone]([hashkey]);


ALTER TABLE [link].[customerphone]  WITH CHECK ADD  CONSTRAINT [fk_custphLink] FOREIGN KEY([custhash])
REFERENCES [hub].[customer]([hashkey]);


create Unique Index Udx_CustPhonelink	ON [link].[customerPhone] (custhash, Phonehash);


ALTER TABLE  [link].[orderheaderorderline]   WITH CHECK ADD  CONSTRAINT [fk_ordheaderLink] FOREIGN KEY([OrderHeaderhash])
REFERENCES [hub].[orderheader]([hashkey]);


ALTER TABLE [link].[orderheaderorderline]  WITH CHECK ADD  CONSTRAINT [fk_ordlineLink] FOREIGN KEY([Orderlinehash])
REFERENCES [hub].[orderline]([hashkey]);



ALTER TABLE  [link].[customerorderheader]   WITH CHECK ADD  CONSTRAINT [fk_Custordheader] FOREIGN KEY([OrderHeaderhash])
REFERENCES [hub].[orderheader]([hashkey]);


ALTER TABLE [link].[customerorderheader]  WITH CHECK ADD  CONSTRAINT [fk_ordheaderLink] FOREIGN KEY([Custhash])
REFERENCES [hub].[customer]([hashkey]);

create Unique Index Udx_OrdHeaderLink	ON [link].[orderheaderorderline] ([OrderHeaderhash], [Orderlinehash]);


ALTER TABLE  [link].[orderheaderorderline]   WITH CHECK ADD  CONSTRAINT [fk_ordheaderLink] FOREIGN KEY([OrderHeaderhash])
REFERENCES [hub].[orderheader]([hashkey]);


ALTER TABLE [link].[orderheaderorderline]  WITH CHECK ADD  CONSTRAINT [fk_ordlineLink] FOREIGN KEY([Orderlinehash])
REFERENCES [hub].[orderline]([hashkey]);


create Unique Index Udx_OrdHeadLineLink	ON [link].[orderheaderorderline] ([OrderHeaderhash], [Orderlinehash]);


--=================================================================================



 
 


