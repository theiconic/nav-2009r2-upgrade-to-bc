-- 3 mins

UPDATE [Cronus$Purch_ Inv_ Line]
SET [Order No_] = [Order No_ TI], [Order Line No_] = [Order Line No_ TI]
WHERE [Order No_ TI] <> '' AND [Order No_] = ''


/*

This is only for open documents, ledger entries and historical data will be updated gradually after going live

*/
-- 10 sec
UPDATE t
SET t.[User Name] = twl.[User Name]
FROM [User] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User Name]
WHERE t.[User Name] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$User Setup] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$G_L Budget Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[Requester ID] = twl.[User Name]
FROM [Cronus$Requisition Line] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Requester ID]
WHERE t.[Requester ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Requisition Line] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[Created By] = twl.[User Name]
FROM [Cronus$Reservation Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Created By]
WHERE t.[Created By] <> ''
GO

UPDATE t
SET t.[Changed By] = twl.[User Name]
FROM [Cronus$Reservation Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Changed By]
WHERE t.[Changed By] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Selected Dimension] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[Sender ID] = twl.[User Name]
FROM [Cronus$Approval Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Sender ID]
WHERE t.[Sender ID] <> ''
GO
 
UPDATE t
SET t.[Approver ID] = twl.[User Name]
FROM [Cronus$Approval Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Approver ID]
WHERE t.[Approver ID] <> ''
GO
 
UPDATE t
SET t.[Last Modified By User ID] = twl.[User Name]
FROM [Cronus$Approval Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Last Modified By User ID]
WHERE t.[Last Modified By User ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Approval Comment Line] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[Running as User ID] = twl.[User Name]
FROM [Cronus$Job Queue] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[Running as User ID]
WHERE t.[Running as User ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Job Queue Entry] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Analysis Selected Dimension] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Warehouse Employee] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO

UPDATE t
SET t.[User ID] = twl.[User Name]
FROM [Cronus$Warehouse Journal Line] t
INNER JOIN [Cronus$Temp Windows Login] twl
	ON twl.[User ID] = t.[User ID]
WHERE t.[User ID] <> ''
GO
