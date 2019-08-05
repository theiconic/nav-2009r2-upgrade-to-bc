
-- Secondary importance >>
PRINT '**************************** Return Shipment Line ****************************'
GO

PRINT 'Return Shipment Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Return Shipment Line]
(
	[Return Order No_] ASC,
	[Return Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Return Shipment Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Return Shipment Line]
(
	[Pay-to Vendor No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Return Shipment Line]
(
	[Buy-from Vendor No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Return Shipment Line]
(
	[Location Code] ASC,
	[Type] ASC,
	[No_] ASC,
	[Original Sales Order No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Shipment Line - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
