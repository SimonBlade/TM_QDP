--[dbo].[CUSTPACKINGSLIPJOUR]


select top 100 * from [dbo].[CUSTPACKINGSLIPJOUR]		-- packing slips -- 


select count (*) from [dbo].[CUSTPACKINGSLIPJOUR]				-- 2243484


select distinct refnum, count (*) as qty
from  [dbo].[CUSTPACKINGSLIPJOUR]			-- all 0 


select count (*) from [dbo].[CUSTPACKINGSLIPJOUR]
where salesid is   null		--  0 


select count (*) 
from  [dbo].[CUSTPACKINGSLIPJOUR]		as slip
	inner join 
		[dbo].[SALESTABLE]		as sales
	ON 
slip.salesid = sales.salesid			-- 2218326			-- so more or less joining!


select top 100 * from [dbo].[SALESTABLE]

-- [dbo].[CUSTPACKINGSLIPTRANS]
select top 100 * from [dbo].[CUSTPACKINGSLIPTRANS]

-- [dbo].[DIMENSIONATTRIBUTE]	
Select  * from [dbo].[DIMENSIONATTRIBUTE]				-- ??  19 rows, very top level lookup


-- [dbo].[DIMENSIONATTRIBUTEVALUE]	
Select  * from [dbo].[DIMENSIONATTRIBUTEVALUE]			-- ??


-- [dbo].[DIMENSIONATTRIBUTEVALUESETITEM]
Select  * from [dbo].[DIMENSIONATTRIBUTEVALUESETITEM]	-- ??


-- DIRPARTYLOCATION
select count (*) from [dbo].[DIRPARTYLOCATION]			-- 6878862

select top 100 * from [dbo].[DIRPARTYLOCATION]			-- table full of flags related to address


-- DIRPARTYLOCATIONROLE
select count (*) from [dbo].[DIRPARTYLOCATIONROLE]		-- 8997917

Select top 100  * from [dbo].[DIRPARTYLOCATIONROLE]		  -- does this relate to address?


-- [dbo].[ECORESPRODUCTTRANSLATION]

Select top 100 * from [dbo].[ECORESPRODUCTTRANSLATION]		-- product ID Lookup



Select top 100 * from [dbo].[ECORESPRODUCTTRANSLATION]	
where product = '5637154386'


== Chamaecyparis Obtusa Meroki Twin 5 Litre Pot x 1


select   * from [dbo].[INVENTITEMGROUPITEM]	
where recid = '5637154386'


select top 100  * from  [dbo].[SALESLINE]
where ITEMID = '73812'			-- nope




select top 100  * from  [dbo].[SALESLINE]
where name like '%Chamaecyparis Obtusa Meroki%'		-- no , try other way round 



Select top 100 * from [dbo].[ECORESPRODUCTTRANSLATION]	
where name = 'Osteospermum Hardy Collection 9 Jumbo Plugs'		-- yep comes back with 2 rows


select top 100  * from  [dbo].[SALESLINE]
where name = 'Osteospermum Hardy Collection 9 Jumbo Plugs'	


select   * from [dbo].[INVENTITEMGROUPITEM]	
where itemid = '10161'









--- so assume this joins to sales 

Select top 100 * from [dbo].[SALESTABLE]		-- not on the header

Select top 100 * from [dbo].[SALESLINE]




-- [dbo].[EXCHANGERATE]

select top 100 * from [dbo].[EXCHANGERATE]				-- will this ever be needed?

-- [dbo].[INVENTITEMGROUP]

Select count (*) from [dbo].[INVENTITEMGROUP]  -- 330 

select top 100 * from [dbo].[INVENTITEMGROUP]	-- group info eg, T&M Seed/T&M Plant etc 


-- [dbo].[INVENTITEMGROUPITEM]

select count (*) from [dbo].[INVENTITEMGROUPITEM]			-- 57620

select  top 100  * from [dbo].[INVENTITEMGROUPITEM]					-- must join to [INVENTITEMGROUP]

-- is ITemID the productID?



-- check product table in T&M Server

select top 100 * from tam_scv.dbo.products
order by created desc			-- unsure  0- cant see any IDs



-- [dbo].[INVENTITEMPRICE]	


Select count(*) from [dbo].[INVENTITEMPRICE]				-- 22676

Select top 100 * from [dbo].[INVENTITEMPRICE]			-- unit price per item





--[dbo].[INVENTTABLE]

select count (*) from [dbo].[INVENTTABLE]				-- 28810

select top 100 * from [dbo].[INVENTTABLE]				-- inventory --- DQR  -- unsure what is needed on here


--[dbo].[INVENTTABLEMODULE]

select count (*) from [dbo].[INVENTTABLEMODULE]			-- 87321

Select top 100 * from [dbo].[INVENTTABLEMODULE]


--[dbo].[LOGISTICSADDRESSCOUNTRYREGION]

Select count (*) from [dbo].[LOGISTICSADDRESSCOUNTRYREGION]			-- 245

select * from [dbo].[LOGISTICSADDRESSCOUNTRYREGION]				-- this is a lkp for the country field


--[dbo].[LOGISTICSADDRESSSTATE]

Select count (*) from[dbo].[LOGISTICSADDRESSSTATE]					-- 2758

select  * From [dbo].[LOGISTICSADDRESSSTATE]					-- this has the country names on



-- logistic location
select count (*) from [dbo].[LOGISTICSLOCATION]			-- 6649633

select top 100 * from  [dbo].[LOGISTICSLOCATION]	



--[dbo].[LOGISTICSLOCATIONROLE]

select count (*) from[dbo].[LOGISTICSLOCATIONROLE]

select top 100 * from [dbo].[LOGISTICSLOCATIONROLE]			-- Location type



-- [dbo].[LOGISTICSPOSTALADDRESS]
 

select count (*)  from [dbo].[LOGISTICSPOSTALADDRESS]			-- 4090008  - so these might be contact addresses? DQR

select top 5000 * from [dbo].[LOGISTICSPOSTALADDRESS]
order by recid desc

select top 100 deliverypostaladdress from salestable


select top 5000 * from [dbo].[LOGISTICSPOSTALADDRESS]
where recid = 5638044971

-- do they all join?
		
select count (*) 
	 from [dbo].[LOGISTICSPOSTALADDRESS]	as ad
	inner join 
	(select distinct  deliverypostaladdress from salestable) as sales
ON 
ad.recid = sales.deliverypostaladdress			-- 999191


select count (*) 
	 from [dbo].[LOGISTICSPOSTALADDRESS]	as ad
	right join 
	(select distinct  deliverypostaladdress from salestable) as sales
ON 
ad.recid = sales.deliverypostaladdress			
where 
ad.recid is null		-- only 2, so think this is how i get my address




-- what is the unique ID

select recID, count (*) As qty 
from [dbo].[LOGISTICSPOSTALADDRESS]
group by recID
having count (*) > 1			-- yep, this is unique addressID


select distinct countryregionID, count (*) as qty 
from [dbo].[LOGISTICSPOSTALADDRESS]
group by countryregionID			--  joins to [dbo].[LOGISTICSADDRESSCOUNTRYREGION] lookup 




--[dbo].[OCCCASHPAYMENTTABLE]

Select count (*) from [dbo].[OCCCASHPAYMENTTABLE]			-- 1344145

select top 100 * From [dbo].[OCCCASHPAYMENTTABLE]				-- unsure what this is ?


--[dbo].[OCSRESPONSECODETABLE]

Select count (*) from [dbo].[OCSRESPONSECODETABLE]			-- 9465

select   * From [dbo].[OCSRESPONSECODETABLE]			-- ordercodes



-- [dbo].[OSSBRANDMAILINGPREFERENCES]

Select count (*) from [dbo].[OSSBRANDMAILINGPREFERENCES]		-- 4920527
select top 100 * from [dbo].[OSSBRANDMAILINGPREFERENCES]		-- preferences, this is the only obvious one!



Select custaccount, count (*) 
from [dbo].[OSSBRANDMAILINGPREFERENCES]
group by custaccount
having count (*)> 1
order by count (*)  desc


select * from [dbo].[OSSBRANDMAILINGPREFERENCES]
where custaccount = '14558538'


select * from [dbo].[OSSBRANDMAILINGPREFERENCES]
where custaccount = '10047522'


Select brandID, custaccount, count (*) 
from [dbo].[OSSBRANDMAILINGPREFERENCES]
group by brandID, custaccount
having count (*)> 1
order by count (*)  desc


--[dbo].[OSSKITCOMPONENTTABLE]

select count (*) from [dbo].[OSSKITCOMPONENTTABLE]				-- 12609 

select top 100 * from [dbo].[OSSKITCOMPONENTTABLE]				-- makes up a KIT from ITems






-- [dbo].[OSSLINECANCELREASONTABLE]

select count (*) from[dbo].[OSSLINECANCELREASONTABLE]			-- 34

select top 100 * from [dbo].[OSSLINECANCELREASONTABLE]			-- lookup 


--[dbo].[OSSORDERVALUE]


select count (*) from[dbo].[OSSORDERVALUE]			-- 1449800

select top 100 * from [dbo].[OSSORDERVALUE]			-- #??

select salesid, count (*) as qty 
from OSSORDERVALUE
group by salesid
having count (*) > 1

select * from [dbo].[SALESTABLE] 

/*
"Yes, this is the order header info.
BALANCE = Net Goods
CHARGES = Net Delivery
PROMOTIONAL DISCOUNT - believe this is discount on order, but can I see some samples with this populated, as none in sample file

TAX - total tax on the order for both goods and delivery*/


select * from [dbo].[OSSORDERVALUE]			-- #??
where 
PROMOTIONALDISCOUNT > 0 
or 
COUPONDISCCHARGES > 0 
or
OTHERCHARGES > 0




-- [dbo].[PRICEDISCTABLE]

Select count (*) from [dbo].[PRICEDISCTABLE]		-- 192021


select top 100   * from [dbo].[PRICEDISCTABLE]			-- discount?


-- [dbo].[RETURNREASONCODE]

select count (*) from  [dbo].[RETURNREASONCODE]			-- 304

select   * from [dbo].[RETURNREASONCODE]				-- lookup for return reason 


-- [dbo].[SALESLINE]

select count (*) from  [dbo].[SALESLINE]				-- 4458108  -- 

select top 100 * from  [dbo].[SALESLINE]				-- all order lines

select count (*) 
from  [dbo].[SALESLINE]
where salesid not like  'SO%' 
and 
salesid not like 'RO%'			-- 61695


select * from [dbo].[SALESLINE]
where salesid not like  'SO%' 
and 
salesid not like 'RO%'				-- DQR 


--[dbo].[SALESLINEDELETE]


select count (*) from [dbo].[SALESLINEDELETE]			-- 246110

select * from [dbo].[SALESLINEDELETE]					--- DQR - are these deleted from orderlines?

select top 100 * from [dbo].[SALESLINE]
--where InventTransID = 'BVG-3786055'		--


select * from [dbo].[SALESLINEDELETE]	
where  InventTransID = 'BVG-3786055'	




-- [dbo].[SALESTABLE]

select count (*) from [dbo].[SALESTABLE]				-- 1441161


select top 100 * from [dbo].[SALESTABLE]				-- orderheaders


-- [dbo].[SALESTABLEDELETE]

select count (*) from  [dbo].[SALESTABLEDELETE]			-- 132149

select top 100 * from [dbo].[SALESTABLEDELETE]
where salesid = 'RO-0001345'


select top 100 * from [dbo].[SALESTABLE]	
where salesid = 'RO-0001345'


select top 100 * from [dbo].[OSSORDERVALUE]
where salesid = 'RO-0001345'

--[dbo].[SHIPCARRIERTRACKING]

select count (*) from [dbo].[SHIPCARRIERTRACKING]		-- 4680461

select top 100 * from [dbo].[SHIPCARRIERTRACKING]		-- tracking number - is it required?		-- DQR 


--[dbo].[TAMITEMDELIVERYWINDOW]


select count (*) from [dbo].[TAMITEMDELIVERYWINDOW]			-- 101780


select top 10000 * from [dbo].[TAMITEMDELIVERYWINDOW]		--  DQR -- needed?


-- [dbo].[TAXDATA]

select count (*) from  [dbo].[TAXDATA]					-- 37 

select top 100 * from [dbo].[TAXDATA]					-- needed? it is a lookup proba


-- [dbo].[TAXGROUPDATA]


select count (*) from  [dbo].[TAXGROUPDATA]					-- 62

select top 100 * from [dbo].[TAXGROUPDATA]


-- [dbo].[TAXONITEM]


select count (*)from[dbo].[TAXONITEM]					--  55 


select top 100 * from [dbo].[TAXONITEM]					-- needed?



-----------------------------------

--============================================================================================
-- VA sent me the queries

SELECT QUOTENAME('abcdef', '()');


SELECT  top 100 
 quotename(t1.SALESID,'"') AS ORDER_NO
 , t1.recid AS LINE_NO
 ,  quotename(t1.CUSTACCOUNT,'"') AS CUSTOMER_NO_PAY
 ,  quotename(t1.ITEMID,'"') AS CATALOG_NO
 ,  quotename(replace(t1.name,N'�' COLLATE Latin1_General_BIN,'e'),'"')  AS CATALOG_DESC
 , t1.salesqty AS BUY_QTY_DUE
 , convert(date,t1.shippingdateconfirmed) AS PLANNED_DUE_DATE
 , round((t1.SALESPRICE/t5.revrate)/rate,2) as SALE_UNIT_PRICE
, round(t1.SALESPRICE/Rate,2) AS SALE_UNIT_PRICE_GROSS 
, quotename(t1.DLVMODE,'"') AS SHIP_VIA_CODE
, quotename(case when t1.SALESSTATUS = 0 then 'None'
				 when t1.SALESSTATUS = 1 then 'Open Order' 
				 when t1.SALESSTATUS = 2 then 'Delivered' 
				 when t1.SALESSTATUS = 3 then 'Invoiced'
				 when t1.SALESSTATUS = 4 then 'Cancelled' 
				 when t1.SALESSTATUS = 5 then 'Converted'
				 end,'"')  AS STATUS
,  quotename(osslinecancelreason,'"') as CANCELLATION_CODE,  quotename(replace(replace(replace(t1.DELIVERYNAME,char(11),' '),char(13),''),char(10),''),'"') as DeliveryName, quotename(replace(t4.STREET,char(10),', '),'"')  AS ADDRESS1,  quotename(t4.CITY,'"') as City,  quotename(t4.STATE,'"') AS COUNTY,  quotename(t4.ZIPCODE,'"') AS ZIP_CODE,  quotename(t4.COUNTRYREGIONID,'"') AS COUNTRY_DB
--INTO ##TMPQB6
FROM
TAM_AX.dbo.salesline AS t1 
	LEFT OUTER JOIN
TAM_AX.dbo.salestable AS t3 
ON
 t1.SALESID = t3.SALESID
	LEFT OUTER JOIN
TAM_AX.dbo.custtable AS t2 
ON 
t1.CUSTACCOUNT = t2.ACCOUNTNUM 
	LEFT OUTER JOIN
TAM_AX.dbo.LogisticsPostalAddress AS t4
ON 
t4.RECID = t1.DELIVERYPOSTALADDRESS
	LEFT OUTER JOIN
[dbo].[TaxRateView]		as t5 
ON
t5.taxgroup =  t1.TAXGROUP
and 
t5.TAXITEMGROUP= t1.TAXITEMGROUP
	LEFT OUTER JOIN
[dbo].[CurrentExRate]  AS T6 
ON 
T6.Code = T1.CURRENCYCODE
 
 
 
/*TaxRateView:	*/


SELECT        B.TAXGROUP
			, C.TAXITEMGROUP
			, d.TAXVALUE
			, d.TAXVALUE / 100 AS ConvRate
			, 1 + d.TAXVALUE / 100 AS RevRate
FROM  TAM_AX.dbo.taxgroupdata AS B
 LEFT OUTER JOIN
      TAM_AX.dbo.taxonitem AS C
 ON
 C.TAXCODE = B.TAXCODE
 LEFT OUTER JOIN
	  TAM_AX.dbo.taxdata AS d 
ON 
C.TAXCODE = d.TAXCODE
WHERE 
 (NOT (C.TAXCODE IS NULL)) 
 AND
  (d.TAXFROMDATE <= GETDATE()) AND (d.TAXTODATE >= GETDATE())
 
 
/*CurrentExRate:	*/
 
SELECT        T3.TOCURRENCYCODE AS Code
		, T4.EXCHANGERATE / 100 AS Rate
FROM     TAM_AX.dbo.exchangeratecurrencypair AS T3 
LEFT OUTER JOIN
         TAM_AX.dbo.exchangerate AS T4
 ON 
 T4.EXCHANGERATECURRENCYPAIR = T3.RECID 
 AND
  T4.VALIDTO >= GETDATE() 
  AND 
  T4.VALIDFROM <= GETDATE()
  LEFT OUTER JOIN
      TAM_AX.dbo.exchangeratetype AS t5
 ON 
 t5.RECID = T3.EXCHANGERATETYPE
WHERE
        (t5.NAME = 'Default')
UNION
SELECT  'GBP' AS Code, 1 AS Rate




-- so now need to work out how it all fits together after DQR answers:


select top 100 * from [SHIPCARRIERTRACKING]

--SALESID & PACKINGSLIPID - need to use in conjunction together to match to correct order line on the CUSTPACKINGSLIPJOUR
-- TRACKINGNUMBER -courier tracking reference

Select top 100  *
from CUSTPACKINGSLIPJOUR			 as slip
	inner join 
	[SHIPCARRIERTRACKING]			as track
on 
slip.SALESID  = track.SALESID
	and
slip.PACKINGSLIPID  = track.PACKINGSLIPID



Select top 100  
SALESID, PACKINGSLIPID 
from CUSTPACKINGSLIPJOUR			


SELECT * FROM TAXDATA		-- LOOKUP

SELECT * FROM TAXGROUPDATA	-- LOOKUP

TAXDATA 	TAXCODE and TAXVALUE fields as these denote what % tax is paid on a product
TAXGROUPDATA	need TAXCODE and TAXGROUP - believe this is it from the code I provided but if you spot something else please advise.



-- THIS must jointo orderline>?

select top 100 * from salesline


-- taxgroup  and taxitemgroup already on here?
select  taxgroup, taxitemgroup , count (*) As qty 
from salesline
group by taxgroup, taxitemgroup
order by count (*) desc


/*
taxgroup	taxitemgroup	qty
DOM	STANDARD	3523324
DOM	ZERO	787724
DEC	STANDARD	26165
EUC	STANDARD	18904
EUC	ZERO	13786
FRC	STANDARD	13581
DOM	C15	10975
DOM	C17	10597
IRLC	STANDARD	10047
ROW	STANDARD	8184
ROW	ZERO	6463
DOM	C10	4701
FRC	ZERO	4328
IRLC	ZERO	3282
DOM	C5	3176
DEC	ZERO	2814
DOM	C11	2120
DOM	C2	1498
DOM	C8	1290
DOM	C9	1276
DOM	C12	1016
DOM	C4	455
DOM	C16	446
DEC	C4	396
DOM	C3	299
DEC	C3	263
DOM	C7	211
DOM	C18	204
DOM	C19	184
DOM	C1	116
FRC	C4	66
FRC	C3	64
DOM	C14	52
DOM	C6	48
	STANDARD	26
FRC	C11	18
EUC	C9	3
ROW	C11	2
ROW	C9	1
	ZERO	1
EUC	C12	1
IRLC	C14	1
*/

select * from taxdata
select * from taxgroupdata
select top 100 * from salesline


select top 100 ol.taxgroup
	,ol.taxitemgroup
	,td.taxcode
	,tg.taxgroup
	,taxvalue
from [dbo].[salesline]		as ol
	inner join 
	taxgroupdata				as tg
	on 
	ol.taxgroup = tg.taxgroup
	inner join 
	[TAXDATA]		as  td
	on 
	tg.taxCode = td.taxCode
where
tg.taxgroup <>  ol.taxgroup				-- so taxgroup always the same anyway?
-- bu if they need itemgroup then both tbls required


select top 100 * from salesline
select top 100 * from saleslineDELETE


SELECT COUNT (*) 
FROM salesline		AS OL
	INNER JOIN 
	saleslineDELETE					AS DEL
ON 
	OL.INVENTTRANSID = DEL.INVENTTRANSID

	-- 463?
	SELECT COUNT (*) FROM  saleslineDELETE			--246K so not correct join 
		-- can't see a join 

SELECT TOP 100 * FROM oSSORDERVALUE

Select salesid, count (*)
from oSSORDERVALUE
group by salesid
having count (*) > 1		-- def join on salesid


select   ov.salesid, balance, charges, tax, totalinvoice, ossordervalue
from salestable		as oh
inner join 
	OSSORDERVALUE	as ov
ON ov.salesid  = oh.salesid 
where 
ossordervalue <> totalinvoice				--  so have a discrepancy

/*
Hi, there is a OSSORDERVALUE field in the actual salestable, which in 32654 cases, does not match
the ‘totalinvoice’ filed in the actual OSSORDERVALUE  table. It does look like the value on the 
OSSORDERVALUE  is correct as predicted, so should we ignore the value
in Salestable as a rule?*/

on DELIVERYPOSTALADDRESS


select top 100 * from [dbo].[LOGISTICSPOSTALADDRESS]

select count (*) From salestable		as oh
	inner join 
[dbo].[LOGISTICSPOSTALADDRESS]			as [add]
	on 
oh.DELIVERYPOSTALADDRESS = [add].recid			-- 1441121



select count (*) From salestable		as oh
	left join 
[dbo].[LOGISTICSPOSTALADDRESS]			as [add]
	on 
oh.DELIVERYPOSTALADDRESS = [add].recid	
where 
[add].recid is null			-- 40



select distinct salesid,	DELIVERYPOSTALADDRESS
From salestable		as oh
	left join 
[dbo].[LOGISTICSPOSTALADDRESS]			as [add]
	on 
oh.DELIVERYPOSTALADDRESS = [add].recid	
where 
[add].recid is null	



select top 100 ol.taxgroup
	,ol.taxitemgroup
	,td.taxcode
	,tg.taxgroup
	,taxvalue
from [dbo].[salesline]		as ol
	inner join 
	taxgroupdata				as tg
	on 
	ol.taxgroup = tg.taxgroup
	inner join 
	[TAXDATA]		as  td
	on 
	tg.taxCode = td.taxCode
	 




	--  we only require the following fields which relate to product purchase price:
ITEMRELATION - this will link to order lines
ACCOUNTRELATION - Supplier
AMOUNT - the value paid for that product
CURRENCY - the currency in which it is purchased


SELECT TOP 10 * FROM PRICEDISCTABLE		-- how does this join to lines?


select distinct itemrelation from PRICEDISCTABLE

select top 100 * from salesline		as ol
	inner join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation			-- must be 

select count (*)			-- 4458108
, count (distinct salesid)	-- 1494949
from salesline
	
select    count (*)							-- 4437051
		, count (distinct salesid)			-- 1486763
		, count (distinct itemrelation)		-- 15051
from salesline		as ol
	inner join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation				-- so mainly joinin


	select    count (*)						-- 21057
		, count (distinct salesid)			-- 19134
		, count (distinct itemrelation)		-- 0
from salesline		as ol
	left join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation				

where 
x.itemrelation is null




	select     *-- 0
from salesline		as ol
	left join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation				

where 
x.itemrelation is null

select select    count (*)					-- 4437051
		, count (distinct salesid)			-- 1486763
		, count (distinct itemrelation)		-- 15051
from salesline		as ol
	inner join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation				-- so mainly joinin


	select   ol.*			-- 19134
		 
from salesline		as ol
	left join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation				

where 
x.itemrelation is null			-- all KB Products?




select   ol.itemid, count(*)as qty 		 
from salesline		as ol
	left join 
	(
select distinct itemrelation from PRICEDISCTABLE
	)		as x
	on ol.itemid = x.itemrelation				

where 
x.itemrelation is null
group by ol.itemid
order by count(*) desc



select   itemrelation , count (*)  
from PRICEDISCTABLE
group by itemrelation
having count (*) > 1


select * from PRICEDISCTABLE 
where itemrelation ='16023'



select * from OSSKITCOMPONENTTABLE 

Select itemid, kitid , count (*) As qty 
from OSSKITCOMPONENTTABLE
group by itemid, kitid 
having count (*)> 1		--0 good. 



 

 
 
 select count (*) From OSSBRANDMAILINGPREFERENCES			-- 4920527

 select top 100 * from OSSBRANDMAILINGPREFERENCES

 select top 100 * from [dbo].[CUSTTABLE]

 select top 100 * from salestable

 -- The only data we require is from INVENTTABLEMODULE - ITEMID, MODULETYPE, PRICE and TAXITEMGROUP

 select top 100 * from  INVENTTABLEMODULE


 select top 10 * from[dbo].[INVENTITEMGROUPITEM]  [dbo].[OSSBRANDMAILINGPREFERENCES]