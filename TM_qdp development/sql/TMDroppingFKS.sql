

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
