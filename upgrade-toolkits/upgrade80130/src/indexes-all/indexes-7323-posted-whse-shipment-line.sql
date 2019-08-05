
PRINT 'Posted Whse_ Shipment Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Posted Whse_ Shipment Line]
(
	[Posted Source No_] ASC,
	[Posting Date] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Shipment Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Posted Whse_ Shipment Line]
(
	[Source Type] ASC,
	[Source Subtype] ASC,
	[Source No_] ASC,
	[Source Line No_] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Shipment Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Seconary importance >>

PRINT 'Posted Whse_ Shipment Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Posted Whse_ Shipment Line]
(
	[Whse_ Shipment No_] ASC,
	[Whse Shipment Line No_] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Shipment Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Posted Whse_ Shipment Line]
(
	[Source No_] ASC,
	[Source Document] ASC,
	[No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Posted Whse_ Shipment Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

