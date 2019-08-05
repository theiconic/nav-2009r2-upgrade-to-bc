
-- Secondary importance >>

PRINT 'Posted Whse_ Shipment Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Posted Whse_ Shipment Header]
(
	[Location Code] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Posted Whse_ Shipment Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Posted Whse_ Shipment Header]
(
	[Whse_ Shipment No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Posted Whse_ Shipment Header - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
