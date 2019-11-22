/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CONTACTID]
      ,[IFSCUSTOMERID]
      ,[IFSADDRESSID]
      ,[PROFILEID]
      ,[ORDER_NO]
      ,[ORDER_CODE]
      ,[DATE_ENTERED]
      ,[DATE_SCV_ADDED]
      ,[ORDER_VALUE_GROSS]
      ,[ORDER_VALUE_EX_DISC_VOUCH]
      ,[ORDER_VALUE_NET]
      ,[P_AND_P_GROSS]
      ,[P_AND_P_NET]
      ,[DISCOUNT_VALUE]
      ,[VOUCHER_VALUE]
      ,[DBGROWTH]
      ,[OWNERSHIP]
      ,[CLIENT_REF]
      ,[BRAND]
      ,[LINES]
      ,[PAYMENT_METHOD1]
      ,[PAYMENT_METHOD2]
      ,[ACTUALTAX]
      ,[ODDATE]
      ,[STATUS]
      ,[LOADGUID]
      ,[PLANT]
      ,[SEED]
      ,[GIFT]
      ,[POT]
      ,[TRANSACTION_Type]
      ,[SOURCE]
      ,[OrganisationID]
      ,[OLD_ID]
      ,[ID]
      ,[BULB]
      ,[OTHER]
      ,[Web_Discount]
      ,[Report_Header]
      ,[rentable]
      ,[Mailable]
  FROM [TAM_SCV].[dbo].[TMOrder_Header]

  -- which fields do we need?!

  Select COUNT (*) 
  from [TAM_SCV].[dbo].[TMOrder_Header]
  where IFSADDRESSID is not null   -- 2323105



  Select [source], count (*) as qty
  from  [TAM_SCV].[dbo].[TMOrder_Header]
  group by [source]


-- i need everything except the new AX data ? and not MailingHistory, NCOA, Prospects , Reactivation


 'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'


select top 1000 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where date_entered > '20190101'
order by date_entered desc


-- I think it is related to ordercodes

select order_code, convert ( date, date_entered)
from [TAM_SCV].[dbo].[TMOrder_Header]
where convert ( date, date_entered) > '20190101'
group by order_Code, convert ( date, date_entered)		

-- no way of differentiating these I dont think , just add all for nowand ask on DQR




select order_code, convert ( date, date_entered)
from [TAM_SCV].[dbo].[TMOrder_Header]
where convert ( date, date_entered) > '20190101'
and ifsaddressid is not null			-- ok, so ifsaddressid nt popualetd 
group by order_Code, convert ( date, date_entered)	




select max(convert ( date, date_entered)) 
from [TAM_SCV].[dbo].[TMOrder_Header]
where  ifsaddressid is not null						-- 2015-06-27


select *
from [TAM_SCV].[dbo].[TMOrder_Header]
where  ifsaddressid is not null						-- 2015-06-27		-- this might be it?
 

select top 1000 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where profileid is not null		-- don't need this 


select top 1000 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where date_SCV_Added is not null
order by date_SCV_Added desc



select max (date_SCV_Added)
from  [TAM_SCV].[dbo].[TMOrder_Header]
where date_SCV_Added is not null			-- 2015-03-14 11:27:00 -- not really needed??



select top 100 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where date_SCV_Added is not null	



select top 100 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where Client_ref is not null	-- all null 	


select top 100 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where actualtax is not null



select top 100 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where oddate is not null			-- empty 

--report_header/rentable/mailable all created in a mart 

Select * from [dbo].[TMOrder_Header]
where ifscustomerid is null
and 
source in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)


Select * from [dbo].[TMOrder_Header]
where order_code is null
and 
source in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)


Select * from [dbo].[TMOrder_Header]
where date_entered is null
and 
source in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)				-- are some here -- DQR , use date_SCV_Added in the meantime
and date_SCV_Added is null	



Select count (*) from[dbo].[TMOrder_Header]
where contactid is null
 
select * from [dbo].[TMOrder_Header]
where contactid is null					-- this is another DQR


SELECT TOP (1000) [CONTACTID]
      ,[IFSCUSTOMERID]
      ,[IFSADDRESSID]
      ,[ORDER_NO]
      ,[ORDER_CODE]
      ,[DATE_ENTERED]
      ,[ORDER_VALUE_GROSS]
      ,[ORDER_VALUE_EX_DISC_VOUCH]
      ,[ORDER_VALUE_NET]
      ,[P_AND_P_GROSS]
      ,[P_AND_P_NET]
      ,[DISCOUNT_VALUE]
      ,[VOUCHER_VALUE]
      ,[DBGROWTH]
      ,[OWNERSHIP]
      ,[BRAND]
      ,[LINES]
      ,[PAYMENT_METHOD1]
      ,[PAYMENT_METHOD2]
      ,[ACTUALTAX]
      ,[STATUS]
      ,[PLANT]
      ,[SEED]
      ,[GIFT]
      ,[POT]
      ,[TRANSACTION_Type]
      ,[SOURCE]
      ,[OLD_ID]
      ,[ID]
      ,[BULB]
      ,[OTHER]
      ,[Web_Discount]
    FROM [dbo].[TMOrder_Header]



select top 100 * 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where Loadguid is not null			-- empty 


select distinct brand from  [TAM_SCV].[dbo].[TMOrder_Header]


-- need to work out business keys on here --

select [order_no], [source], count (*) as qty 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where [source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)				-- are some here -- DQR , use date_SCV_Added in the meantime
group by [order_no], [source]
having count (*)> 1

-- another DQR -- 


select   * from  [TAM_SCV].[dbo].[TMOrder_Header]
where [source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)
and order_no is null		-- def a DQR really


select ID, count (*) as qty 
from  [TAM_SCV].[dbo].[TMOrder_Header]
group by id
having count (*) > 1
order by ID				-- think I will use this as the business Key as is the only unique thing on there


-- contacts -- 

Select top 100 * from [dbo].[contacts]

select top 100 * from [dbo].[contacts]
where prefix is not null			-- 0 


select top 100 * from [dbo].[contacts]
where suffix is not null		-- 0 

-- leave all the pref flags 


select   * from [dbo].[contacts]
where owners is not null			-- all bollocks

select   * from [dbo].[contacts]
where cont_guid is   null			--- some null 


select [contactid]
	, [title]
	, [forename]
	, [surname]
	, [dateadded]
	, [dateedited]
	, [cont_guid]
from [dbo].[contacts]
--where anonymised = 0				-- DQR -- do they want it all in from the offset

select  max(len([title])) 
	, max(len([forename])) 
	,  max(len([surname])) 
	 
from [dbo].[contacts]



--  order Lines -- 

select top 100 * from [TAM_SCV].[dbo].[TMOrder_lines]

select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where order_no is null			-- 0 


select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where linenumber is null	


select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where rel_number is null	

select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where date_edited is null	


select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where productid is null	



select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where catalog_no is null	 --0?

select count (*) from [TAM_SCV].[dbo].[TMOrder_lines]
where catalog_no = 'NULL'	 -- 68047825

select top 100 *  from [TAM_SCV].[dbo].[TMOrder_lines]
where catalog_no = 'NULL'	

select convert (date, date_edited) , count (*) as qty 
from [TAM_SCV].[dbo].[TMOrder_lines]
where catalog_no = 'NULL'
and 
[source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)	
 group by convert (date, date_edited)
 order by convert (date, date_edited)

 
select top 100 *  from [TAM_SCV].[dbo].[TMOrder_lines]
where planned_due_date =  'null'



select convert (date, date_edited) , count (*) as qty 
from [TAM_SCV].[dbo].[TMOrder_lines]
where planned_due_date =  'null'
and 
[source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)	
 group by convert (date, date_edited)
 order by convert (date, date_edited)


 
select top 100 *  from [TAM_SCV].[dbo].[TMOrder_lines]
where replacement is null