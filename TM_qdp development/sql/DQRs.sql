-- DQRs  -- 


select COUNT (*) from [dbo].[TMOrder_Header]
where contactid is null	
and 
IFSCUSTOMERID is not null			-- 194


select COUNT (*) 
-- update oh set oh.contactid = c.contactid
from [dbo].[TMOrder_Header]		as oh
	inner join 
[dbo].[ifs_scv_lookup_new]		as lkp
	ON 
lkp.[ifsnumber] = oh.IFSCUSTOMERID
	inner join 
(select distinct contactid from contacts)		as c
	ON 
c.contactid =  lkp.contactid
where
oh.contactid is null	
and 
IFSCUSTOMERID is not null			-- 192


-- what about orgid ?

select COUNT (*) 
from [dbo].[TMOrder_Header]
where contactid is null



select COUNT (*) 
from [dbo].[TMOrder_Header]		as tm
	inner join 
	(select distinct organisationid from [dbo].[profiles])		as p
	ON 
tm.[organisationid] = p.[organisationid]
where
tm.contactid is null		-- ??only 


select * from [dbo].[TMOrder_Header]
where contactid is null


-- can I use the  order no?

select * 
from [IFS_Load].[dbo].[IFS_Orderheader_USE]
where order_no = 'T11653416'


10672255

select * from [dbo].[ifs_scv_lookup_new]
where ifsnumber = '10672255'



select * from contacts where contactid = 45757962		-- so shoudl be in 



 
 update oh 
 set oh.contactid = c.contactid
from [dbo].[TMOrder_Header]		as oh
	inner join 
(select order_no, customer_id from 
	[IFS_Load].[dbo].[IFS_Orderheader_USE]	)			as ifs
	ON 
ifs.order_no = oh.order_no
	inner join 
[dbo].[ifs_scv_lookup_new]		as lkp
	ON 
lkp.[ifsnumber] = ifs.customer_id
	inner join 
(select distinct contactid from contacts)		as c
	ON 
c.contactid =  lkp.contactid
where
oh.contactid is null	
and 
IFSCUSTOMERID is  null	
and			
customer_id is not null			-- 210



-- only leaves 1
select * from [dbo].[TMOrder_Header]
where contactid is null

select * from 
[dbo].[ifs_scv_lookup_new]	
where [ifsnumber] = '12752715'		-- 0 

select * from [IFS_Load].[dbo].[IFS_Customer_USE]	
where customer_no = '12752715'




--===============================================================================================================
-- QD-209 --

select [order_no], [source], count (*) as qty 
from  [TAM_SCV].[dbo].[TMOrder_Header]
where [source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)				 
group by [order_no], [source]
having count (*)> 1	

select * from  [TAM_SCV].[dbo].[TMOrder_Header]
where order_no is null


Select p.* from [TAM_SCV].[dbo].[TMOrder_Header]		as oh
	inner join 
	profiles			as p
ON 
oh.contactid = p.contactid
	where
order_no is null			-- added to DQR as samples
--===============================================================================================================
-- QD-206 -- 

/*
AX Orders are always prefixed SO and RO. 

Last orders were processed in IFS on Wednesday 10th October 2018, with orders starting to be processed in AX w/c 15th October.
*/

select * from tam_Scv.dbo.tmorder_header 
where left (order_no, 2) not in ('so', 'ro')
and date_entered > '20181015'




-- QD-230 --

/*	We need everything present in the SCV please. Reasoning is that in current selections there is no limit
 on what qualifies a ‘multi’ buyer and if we don't have all data selections will not be comparable to current.	*/



 sp_whoisactive

select min(date_entered) from tmorder_header

select top 10000 * from tmorder_header
order by  date_entered desc




-- QD 221 -- 
--[dbo].[OSSKITCOMPONENTTABLE]


/*We only need the following fields to identify what is in kits:

QTY

KIT ID

ITEM ID
*/


select top 10 * from 
 [dbo].[OSSKITCOMPONENTTABLE]


 
select Distinct  recid, QTy, ITEMID, KITID
from  [dbo].[OSSKITCOMPONENTTABLE]

-- so what does this go to 



-- QD-216 -- 

/*The only data we require is from INVENTTABLEMODULE - ITEMID, MODULETYPE, PRICE and TAXITEMGROUP	*/


selec


Select top 100 ITEMID
, MODULETYPE
, PRICE 
, TAXITEMGROUPID 
from [dbo].[INVENTTABLEMODULE]





-- got some orphans on the orders

select count (*)						-- 21260
	, count (distinct oh.contactid)		-- 21259
 from 
(select distinct contactid from [tmorder_header]	)	as oh
	left join 
	(select [contactid] from [contacts])	as c
	ON 
oh.contactid = c.contactid
where
c.contactid is null		



select oh.* into [tm_orderheader_orphans_20191120]
 from tmorder_header		as oh
	inner join 
	(

select distinct oh.contactid
 from 
(select distinct contactid from [tmorder_header]	)	as oh
	left join 
	(select [contactid] from [contacts])	as c
	ON 
oh.contactid = c.contactid
where
c.contactid is null		
)	as x		
on x.contactid = oh.contactid


-- 118884


select top 100 * from [tm_orderheader_orphans_20191120]
-- when are they from ?


select convert(date, [date_entered]) , count (*) as qty 
from [tm_orderheader_orphans_20191120]
group by convert(date, [date_entered])
order by convert(date, [date_entered])


select year( [date_entered]) , count (*) as qty 
from [tm_orderheader_orphans_20191120]
group by year( [date_entered])
order by year( [date_entered])

-- so ranging back years, mainly pre-2016
-- can i repopulate?

select top 100 * from [tm_orderheader_orphans_20191120]

select count (*) from [tm_orderheader_orphans_20191120]
where iFSCustomerID is not null		-- 532


select * from [tm_orderheader_orphans_20191120]
where iFSCustomerID is not null		-- can i repopulate with this ?


select count (*)  
from [tm_orderheader_orphans_20191120]		as oh
	inner join 
	ifs_scv_lookup_new						as lkp
ON 
	oh.iFSCustomerID = lkp.iFSnumber
	inner join 
	tam_scv.dbo.contacts					as c
ON 
	c.contactid = lkp.contactid
where iFSCustomerID is not null	-- 1079 , co can repopulate these 


alter table [tm_orderheader_orphans_20191120] add NEWContactID int null


update oh
set oh.NEWContactID = lkp.contactid
from [tm_orderheader_orphans_20191120]		as oh
	inner join 
	ifs_scv_lookup_new						as lkp
ON 
	oh.iFSCustomerID = lkp.iFSnumber
	inner join 
	tam_scv.dbo.contacts					as c
ON 
	c.contactid = lkp.contactid
where
 iFSCustomerID is not null			-- 516


 

select * from [tm_orderheader_orphans_20191120]
where iFSCustomerID is not null	
and NEWContactID is null		-- so 16 left here, all pretty new , can i use orgid?




select count (*) 
	, count (distinct p.organisationid)
from 
(select distinct organisationid from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null) 	as oh
	 
	inner join 
	(select distinct organisationid 
	from tam_scv.dbo.profiles
	where defaultprofile = 1)		as p
ON 
	p.organisationid = oh.organisationid			-- 1041

	-- set to latest buyer?


	
select count (*) 
	, count (distinct p.organisationid)
from 
(select distinct organisationid , newcontactid
from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null) 	as oh
	 
	inner join 
	(select distinct organisationid 
	from tam_scv.dbo.profiles
	where defaultprofile = 1)		as p
ON 
	p.organisationid = oh.organisationid
	inner join 
(select distinct [ContactID] as [mrcontact],
	 [organisationid]
	 from 	[dbo].[selectiontable]	) as sel
ON 
 sel.[organisationid] = oh.[organisationid]			-- 981



 	
update oh 
set oh.NEWContactid = [mrcontact]
from 
(select   organisationid , newcontactid
from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null) 	as oh
	 
	inner join 
	(select distinct organisationid 
	from tam_scv.dbo.profiles
	where defaultprofile = 1)		as p
ON 
	p.organisationid = oh.organisationid
	inner join 
(select distinct [ContactID] as [mrcontact],
	 [organisationid]
	 from 	[dbo].[selectiontable]	) as sel
ON 
 sel.[organisationid] = oh.[organisationid]			-- 3446 updated



select *
from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null





select year( [date_entered]) , count (*) as qty 
from [tm_orderheader_orphans_20191120]
where NEWContactID is null
and 
[source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)
group by year( [date_entered])
order by year( [date_entered])




select *
from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null and 
[source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)
order by date_entered desc






select *
from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null and 
[source] in (
'IFS'
)
order by date_entered desc			-- can i join to ifs data?



select count (*) 
from [IFS_Load].[dbo].[IFS_Orderheader_USE]		as ifs
	inner join 
	(
select distinct order_no
 from 
[tm_orderheader_orphans_20191120]	
where NEWContactID is null and 
[source] in (
'IFS'
)	)			as x		
	ON 
ifs.order_no = x.[ORDER_NO]			-- 2678 joining 



update x
set x.ifscustomerid = ifs.[CUSTOMER_ID]
from [IFS_Load].[dbo].[IFS_Orderheader_USE]		as ifs
	inner join 
	(
select   order_no, ifscustomerid
 from 
[tm_orderheader_orphans_20191120]	
where NEWContactID is null and 
[source] in (
'IFS'
)	)			as x		
	ON 
ifs.order_no = x.[ORDER_NO]					-- 2678


-- now use lookup t0 sort newcontactid



update oh
set oh.NEWContactID = lkp.contactid
from [tm_orderheader_orphans_20191120]		as oh
	inner join 
	ifs_scv_lookup_new						as lkp
ON 
	oh.iFSCustomerID = lkp.iFSnumber
	inner join 
	tam_scv.dbo.contacts					as c
ON 
	c.contactid = lkp.contactid
where
 iFSCustomerID is not null			-- 2662
 and 
 NEWContactID is null



 

select *
from 
	[tm_orderheader_orphans_20191120]	
where NEWContactID is null and 
[source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)
order by date_entered desc






select year( [date_entered]) , count (*) as qty , count (distinct contactID)
from [tm_orderheader_orphans_20191120]
where NEWContactID is null
and 
[source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)
group by year( [date_entered])
order by year( [date_entered])


select count (*) from   [tm_orderheader_orphans_20191120]
where NEWContactID is NOT null

-- so that is 6624 fixed







select count (*) ,  count (distinct contactid)
from
  [tm_orderheader_orphans_20191120]
where NEWContactID is   null


select count (Distinct contactid) 
from  [tm_orderheader_orphans_20191120]



--=============================================================================
-- QD-234 --

 
SELECT TOP (1000) [ID]
      ,[ContactID]
      ,[Brand]
      ,[Channel]
      ,[DateEdited]
      ,[UpdatedBy]
	  --Select count (*) 
  FROM [TAM_SCV].[dbo].[contactpermissions]		-- 7621181


  select count (*) as qty				-- 61729
	, count (distinct cp.contactid)		-- 48258
  from  [TAM_SCV].[dbo].[contactpermissions]			as cp
	left join 
	[dbo].[contacts]									as c
	ON 
cp.contactid = c.contactid
where 
c.contactid is null			


Select cp.* from [TAM_SCV].[dbo].[contactpermissions]			as cp
	left join 
	[dbo].[contacts]									as c
	ON 
cp.contactid = c.contactid
where 
c.contactid is null
order by dateedited





select year( cp.[dateedited])as year , count (*) as qty 
from [TAM_SCV].[dbo].[contactpermissions]			as cp
	left join 
	[dbo].[contacts]									as c
	ON 
cp.contactid = c.contactid
where 
c.contactid is null
group by year( cp.[dateedited])
order by year( cp.[dateedited])





/*Is there any more detail we can get on these? The 2018-2019 volumes aren't too concerning but we need to identify what the 2017 names were.*/


select distinct cp.contactid 
into #missingcp
from [TAM_SCV].[dbo].[contactpermissions]			as cp
	left join 
	[dbo].[contacts]									as c
	ON 
cp.contactid = c.contactid
where 
c.contactid is null
and 
year( cp.[dateedited]) = '2017'




select * from #missingcp		as cp
	inner join 
	(select distinct personid from transactions)		as t
on 
cp.contactid  = t.personid			-- 3 here,  not really helping 




select * from #missingcp		as cp
	inner join 
	(select distinct contactid from tmorder_header)		as t
on		
cp.contactid  = t.contactid			-- 2 here , again not helping 





select * from #missingcp		as cp
	inner join 
	(select distinct personid from [dbo].[ArchiveTransactions]
	where[ArchiveDate] > '20170101')		as t
on		
cp.contactid  = t.personid		-- only 42 here so that si nto going to help 






select * from #missingcp		as cp
	inner join 
	(select distinct contactid from [dbo].[ArchiveContacts]
	where [ArchiveDate] > '20170101')		as t
on		
cp.contactid  = t.contactid		-- 110 here 



select * from #missingcp		as cp
	inner join 
	(select distinct contactid from [dbo].[ArchiveProfiles]
	where [ArchiveDate] > '20170101')		as t
on		
cp.contactid  = t.contactid		-- still 110
 --=======================================================================================================================================================================
-- Orderlines vs oRderheaders -- are there any orphans
	

select top 100 * from [dbo].[TMOrder_Header]
where [source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
)



select count (*) from
(select [order_no], [source] 
	from  [dbo].[TMOrder_Header]
where [source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
))		as oh
left join 
(select Distinct [order_no], [source] 
	from  [dbo].[TMOrder_Header]
where [source] in (
'ALANR','FE','FO','FR','GE','IFS','JBMS RB','JBMS UK','JBMS VM','JBMS YP','Prolog','RB',
'T&M','UK','UKPLANTS','Vernon','Web'
))		as ol
on 
	oh.order_no = ol.order_no
		and 
	oh.[Source] = ol.[Source]
where 
oh.order_no is not null
and 
ol.order_no is null					-- 0





--QD-210 -- 

select count (*)
 from [dbo].[contacts]			as c
	inner join 
	[dbo].[profiles]			as p
ON 
p.contactid = c.contactid
	left join 
	(select distinct personid from transactions where grossordervalue > 0 )			as t
ON 
c.contactid = t.personid 
where
anonymised = 1
and 
t.personid is null


select top 100 * from transactions

select top 100 p.* from 
   [dbo].[contacts]			as c
inner join 
   [dbo].[profiles]			as p
ON 
p.contactid = c.contactid
	left join 
	(select distinct personid  from transactions where grossordervalue > 0 )			as t
ON 
c.contactid = t.personid 
where
anonymised = 1
and 
t.personid is null
order by dateadded desc



select [description], count (*)  as qty 
from 
   [dbo].[contacts]			as c
inner join 
   [dbo].[profiles]			as p
ON 
p.contactid = c.contactid
	left join 
	(select distinct personid  from transactions where grossordervalue > 0 )			as t
ON 
c.contactid = t.personid 
where
anonymised = 1
and 
t.personid is null
group by [description]
order by Count (*) desc
