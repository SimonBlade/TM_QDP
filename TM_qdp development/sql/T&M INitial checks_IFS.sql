Select COUNT (*) from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]		-- 7164212


select top 100 * from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	

-- so have multiple outputs here 


select customer_no, COUNT (*) as qty 
from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	
group by customer_no
having COUNT (*) > 1			-- got some dupes in here!



select loadguid, COUNT (*) as qty 
from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	
group by loadguid
having COUNT (*) > 1					-- not unique 



select * 
from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	
where loadguid = '0229F937-FBBE-48B3-8C24-C606697838ED'



select * 
from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	
where customer_no = '14792858'		-- multiple addressid  , can



select customer_no, address_id, COUNT (*) as qty 
from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	
group by customer_no, address_id
having COUNT (*) > 1				-- unsure wtf addressid is here ?


select * 
from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]	
where customer_no = 'C011032126'			-- will have to do an aggregate row on the dupes



select top 100 * from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
where date_amended <> ''			-- ok, yes is used. 


select * from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
where date_expired <> ''			-- ok, yes is used. 

Select reason_code, count (*) as qty 
from  [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
group by reason_code

/*
NULL	2
			7111428
CD	8488
DUPE	41113
NOGARD	3019
UNDER QUERY	112
XX	50
*/		-- unsure if this is required? maybe a DQR 


Select sourcetable, count (*) as qty 
from  [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
where sourcetable not like '%Axapta%'
group by sourcetable


select top 100 * from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
where email like '%@%'			-- yep, populated


select top 100 * from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
where phone <> ''-- yep, populated

select top 100 * from [IFS_Load].[dbo].[IFS_CUSTOMER_USE]
where mobile <> ''-- yep, populated


-- selection for staging tbl -- 


select [customer_no]
	, [address_id]
	, [name]
	, [Address1]
	, [Address2]
	, [City]
	, [County]
	, [Zip_Code]
	, [Country_db]
	, [phone]
	, [mobile]
	, [email]
	, [loadguid]
from
 [IFS_Load].[dbo].[IFS_CUSTOMER_USE]			-- this is all i need isnt it? just net down on loadguid
where
[sourcetable] not like '%Axapta%'


-- at this ateg i am going o bet it down too as there are dupes



select --top 1000 
	[customer_no]
	, [address_id]
	, [name]
	, [Address1]
	, [Address2]
	, [City]
	, [County]
	, [Zip_Code]
	, [Country_db]
	, [phone]
	, [mobile]
	, [email]
	, [Date_Added]
	, [Date_Amended]
	, [Date_Expired]
	, [loadguid]
from 
(select * 
	, ROW_NUMBER () OVER (PARTITION BY [customer_no], [address_id] ORDER BY [Date_Added] desc, [Date_Amended] desc, loadguid) as rown 
from 
[IFS_Load].[dbo].[IFS_CUSTOMER_USE]		)	as x
where
[sourcetable] not like '%Axapta%'
and 
rown = 1

drop table [stg].[IFSCustomer_00000000-0000-0000-0000-000000000000]

--StringHandling.RIGHT(jobName,StringHandling.INDEX(General.ReverseString(jobName), "_") ) + "_Staging"; 





 
 select * from [IFS_Customer_USE]
 where customer_no = '10159896'



select top 100 * from [ChilternRailwaysQDP_dev].[hub].[address]











