
PRINT '**************************** Sales Invoice Line ****************************'
GO

PRINT 'Sales Invoice Line [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Type] ASC,
	[No_] ASC,
	[Location Code] ASC,
	[Posting Date] ASC,
	[Quantity] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Shipment No_] ASC,
	[Shipment Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>
PRINT '**************************** Sales Invoice Line ****************************'
GO

PRINT 'Sales Invoice Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Type] ASC,
	[No_] ASC,
	[Location Code] ASC,
	[Shipment Date] ASC,
	[Quantity] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Document No_] ASC,
	[WHT Business Posting Group] ASC,
	[WHT Product Posting Group] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Order ItemID] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Job Contract Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Invoice Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Line - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

