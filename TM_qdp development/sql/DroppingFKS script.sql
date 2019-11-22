
use [TM_BVG_QDP_dev] 



if object_id ('#x') is not null 
drop table #x;

CREATE TABLE #x -- feel free to use a permanent table
(
  drop_script NVARCHAR(MAX),
  create_script NVARCHAR(MAX)
);
  
DECLARE @drop   NVARCHAR(MAX) = N'',
        @create NVARCHAR(MAX) = N'';

-- drop is easy, just build a simple concatenated list from sys.foreign_keys:
SELECT @drop += N'
ALTER TABLE ' + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name) 
    + ' DROP CONSTRAINT ' + QUOTENAME(fk.name) + ';'
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS ct
  ON fk.parent_object_id = ct.[object_id]
INNER JOIN sys.schemas AS cs 
  ON ct.[schema_id] = cs.[schema_id];

INSERT #x(drop_script) SELECT @drop;

-- create is a little more complex. We need to generate the list of 
-- columns on both sides of the constraint, even though in most cases
-- there is only one column.
SELECT @create += N'
ALTER TABLE ' 
   + QUOTENAME(cs.name) + '.' + QUOTENAME(ct.name) 
   + ' ADD CONSTRAINT ' + QUOTENAME(fk.name) 
   + ' FOREIGN KEY (' + STUFF((SELECT ',' + QUOTENAME(c.name)
   -- get all the columns in the constraint table
    FROM sys.columns AS c 
    INNER JOIN sys.foreign_key_columns AS fkc 
    ON fkc.parent_column_id = c.column_id
    AND fkc.parent_object_id = c.[object_id]
    WHERE fkc.constraint_object_id = fk.[object_id]
    ORDER BY fkc.constraint_column_id 
    FOR XML PATH(N''), TYPE).value(N'.[1]', N'nvarchar(max)'), 1, 1, N'')
  + ') REFERENCES ' + QUOTENAME(rs.name) + '.' + QUOTENAME(rt.name)
  + '(' + STUFF((SELECT ',' + QUOTENAME(c.name)
   -- get all the referenced columns
    FROM sys.columns AS c 
    INNER JOIN sys.foreign_key_columns AS fkc 
    ON fkc.referenced_column_id = c.column_id
    AND fkc.referenced_object_id = c.[object_id]
    WHERE fkc.constraint_object_id = fk.[object_id]
    ORDER BY fkc.constraint_column_id 
    FOR XML PATH(N''), TYPE).value(N'.[1]', N'nvarchar(max)'), 1, 1, N'') + ');'
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS rt -- referenced table
  ON fk.referenced_object_id = rt.[object_id]
INNER JOIN sys.schemas AS rs 
  ON rt.[schema_id] = rs.[schema_id]
INNER JOIN sys.tables AS ct -- constraint table
  ON fk.parent_object_id = ct.[object_id]
INNER JOIN sys.schemas AS cs 
  ON ct.[schema_id] = cs.[schema_id]
WHERE rt.is_ms_shipped = 0 AND ct.is_ms_shipped = 0;

UPDATE #x SET create_script = @create;

PRINT @drop;
PRINT @create;



select * from #x





ALTER TABLE [sat].[SCVcontacts] DROP CONSTRAINT [fk_SCVcontactssatellitehash];
ALTER TABLE [sat].[SCVorderheader] DROP CONSTRAINT [fk_SCVorderheaderssatellitehash];
ALTER TABLE [sat].[SCVorderline] DROP CONSTRAINT [fk_SCVorderlinesatellitehash];
ALTER TABLE [link].[customeremail] DROP CONSTRAINT [fk_emailLink];
ALTER TABLE [link].[customeremail] DROP CONSTRAINT [fk_customerLink];
ALTER TABLE [link].[customeraddress] DROP CONSTRAINT [fk_custaddressLink];
ALTER TABLE [link].[customeraddress] DROP CONSTRAINT [fk_custLink];
ALTER TABLE [link].[customerphone] DROP CONSTRAINT [fk_phoneLink];
ALTER TABLE [link].[customerphone] DROP CONSTRAINT [fk_custphLink];
ALTER TABLE [link].[orderheaderorderline] DROP CONSTRAINT [fk_ordheaderLink];
ALTER TABLE [link].[orderheaderorderline] DROP CONSTRAINT [fk_ordlineLink];
ALTER TABLE [link].[customerorderheader] DROP CONSTRAINT [fk_Custordheader];

ALTER TABLE [sat].[SCVcontacts] ADD CONSTRAINT [fk_SCVcontactssatellitehash] FOREIGN KEY ([HashKey]) REFERENCES [hub].[customer]([HashKey]);
ALTER TABLE [link].[customeremail] ADD CONSTRAINT [fk_customerLink] FOREIGN KEY ([CustHash]) REFERENCES [hub].[customer]([HashKey]);
ALTER TABLE [link].[customeraddress] ADD CONSTRAINT [fk_custLink] FOREIGN KEY ([CustHash]) REFERENCES [hub].[customer]([HashKey]);
ALTER TABLE [link].[customerphone] ADD CONSTRAINT [fk_custphLink] FOREIGN KEY ([CustHash]) REFERENCES [hub].[customer]([HashKey]);
ALTER TABLE [link].[customeremail] ADD CONSTRAINT [fk_emailLink] FOREIGN KEY ([EmailHash]) REFERENCES [hub].[email]([HashKey]);
ALTER TABLE [link].[customeraddress] ADD CONSTRAINT [fk_custaddressLink] FOREIGN KEY ([AddressHash]) REFERENCES [hub].[address]([HashKey]);
ALTER TABLE [link].[customerphone] ADD CONSTRAINT [fk_phoneLink] FOREIGN KEY ([PhoneHash]) REFERENCES [hub].[phone]([HashKey]);
ALTER TABLE [sat].[SCVorderheader] ADD CONSTRAINT [fk_SCVorderheaderssatellitehash] FOREIGN KEY ([HashKey]) REFERENCES [hub].[orderheader]([HashKey]);
ALTER TABLE [link].[orderheaderorderline] ADD CONSTRAINT [fk_ordheaderLink] FOREIGN KEY ([orderheaderhash]) REFERENCES [hub].[orderheader]([HashKey]);
ALTER TABLE [link].[customerorderheader] ADD CONSTRAINT [fk_Custordheader] FOREIGN KEY ([orderheaderhash]) REFERENCES [hub].[orderheader]([HashKey]);
ALTER TABLE [sat].[SCVorderline] ADD CONSTRAINT [fk_SCVorderlinesatellitehash] FOREIGN KEY ([HashKey]) REFERENCES [hub].[orderline]([HashKey]);
ALTER TABLE [link].[orderheaderorderline] ADD CONSTRAINT [fk_ordlineLink] FOREIGN KEY ([orderlinehash]) REFERENCES [hub].[orderline]([HashKey]);
