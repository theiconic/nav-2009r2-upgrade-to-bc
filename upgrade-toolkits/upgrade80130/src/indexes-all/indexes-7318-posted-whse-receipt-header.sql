
PRINT 'Posted Whse_ Receipt Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Posted Whse_ Receipt Header]
(
	[Location Code] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Posted Whse_ Receipt Header]
(
	[Whse_ Receipt No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Receipt Header [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Posted Whse_ Receipt Header]
(
	[PO No_] ASC,
	[Vendor Shipment No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Posted Whse_ Receipt Header - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

