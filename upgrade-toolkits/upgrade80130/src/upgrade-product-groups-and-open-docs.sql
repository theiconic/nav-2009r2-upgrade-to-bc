USE DynamicsNAV
GO

DECLARE @ProductGroupItemCategory TABLE 
(
	ItemCategory nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	ProductGroup nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	NewItemCategory nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL,
	NewDescription nvarchar(50) Collate Latin1_General_100_CI_AS NOT NULL
)

INSERT INTO @ProductGroupItemCategory 
( ItemCategory, ProductGroup, NewItemCategory, NewDescription)
SELECT pg.[Item Category Code], pg.Code, pg.[Item Category Code] + '-' + pg.Code, pg.[Description] 
FROM [Cronus$Product Group] pg
WHERE pg.[Item Category Code] <> ''

INSERT INTO [Cronus$Item Category]
	(Code, Description, [Parent Category]
	,[Indentation],[Presentation Order],[Has Children],[Last Modified Date Time],[Id],[Manifest Signature Reqd_]
    ,[Web Id],[Web Guid],[Display Order],[Xml Package],[Published],[Show In Product Browser]
	,[Column Width],[Page Size],[Skin Id],[Template Name],[Wholesale])
SELECT 
	NewItemCategory, NewDescription, ItemCategory
	,0,0,0,'1753-01-01 00:00:00.000','00000000-0000-0000-0000-000000000000',0
	,0,'',1,'',1,1
	,0,0,0,'',0	
FROM @ProductGroupItemCategory pgic
LEFT JOIN [Cronus$Item Category] ic
	ON ic.Code = pgic.NewItemCategory
WHERE ic.Code IS NULL

UPDATE i
SET [Item Category Code] = NewItemCategory
FROM [Cronus$Item] i
INNER JOIN @ProductGroupItemCategory pgic
	ON pgic.ItemCategory = i.[Item Category Code] AND pgic.ProductGroup = i.[Product Group Code]
WHERE i.[Item Category Code] <> NewItemCategory


-- Open Documents
PRINT 'Processing Sales Line' 
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Sales Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Purchase Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Purchase Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Transfer Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Transfer Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.[Item No_]
WHERE t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Requisition Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Requisition Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 2 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Service Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Service Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.No_
WHERE t.Type = 1 AND t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Standard Item Journal Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Standard Item Journal Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.[Item No_]
WHERE t.[Item Category Code] <> i.[Item Category Code]
GO

PRINT 'Processing Item Journal Line'
GO
UPDATE t
SET [Item Category Code] = i.[Item Category Code]
FROM [dbo].[Cronus$Item Journal Line] t
INNER JOIN [dbo].[Cronus$Item] i (nolock)
ON i.No_ = t.[Item No_]
WHERE t.[Item Category Code] <> i.[Item Category Code]
GO