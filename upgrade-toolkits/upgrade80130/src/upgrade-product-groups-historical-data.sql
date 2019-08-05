USE DynamicsNAV
GO

-- Historical Data
PRINT 'Processing Sales Shipment Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Sales Shipment Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Sales Invoice Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Sales Invoice Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Sales Cr_Memo Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Sales Cr_Memo Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Purch_ Rcpt_ Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Purch_ Rcpt_ Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Purch_ Inv_ Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Purch_ Inv_ Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Item Ledger Entry'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Item Ledger Entry] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.[Item No_]
WHERE t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Sales Line Archive'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Sales Line Archive] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Purchase Line Archive'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Purchase Line Archive] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Transfer Shipment Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Transfer Shipment Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.[Item No_]
WHERE t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Transfer Receipt Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Transfer Receipt Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.[Item No_]
WHERE t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Service Shipment Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Service Shipment Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 1 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Service Invoice Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Service Invoice Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 1 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Service Cr_Memo Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Service Cr_Memo Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 1 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Return Shipment Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Return Shipment Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Return Receipt Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Return Receipt Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO
