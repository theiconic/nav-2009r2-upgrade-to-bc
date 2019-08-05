SET ANSI_PADDING ON
GO

PRINT '**************************** Sales Shipment Header ****************************'
GO

PRINT 'Sales Shipment Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Posting Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Sell-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Bill-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Second importance >>
SET ANSI_PADDING ON
GO

PRINT '**************************** Sales Shipment Header ****************************'
GO

PRINT 'Sales Shipment Header [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Shipment Header]
(
	[EDI Shipment] ASC,
	[EDI Outbound Entry No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Shipment Header [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Shipment Header]
(
	[Salesperson Code] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO
PRINT 'Sales Shipment Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

