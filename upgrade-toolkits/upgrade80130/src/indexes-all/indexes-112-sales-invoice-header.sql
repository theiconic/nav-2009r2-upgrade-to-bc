SET ANSI_PADDING ON
GO

PRINT '**************************** Sales Invoice Header ****************************'
GO

PRINT 'Sales Invoice Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [11] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$11] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Posting Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Sell-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Bill-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

SET ANSI_PADDING ON
GO

PRINT '**************************** Sales Invoice Header ****************************'
GO

PRINT 'Sales Invoice Header [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Prepayment Order No_] ASC,
	[Prepayment Invoice] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [10] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$10] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Tax Document Marked] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [12] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$12] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Document Exchange Status] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [13] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$13] ON [dbo].[Cronus$Sales Invoice Header]
(
	[EDI Invoice] ASC,
	[EDI Outbound Entry No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Pre-Assigned No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Printed Tax Document] ASC,
	[Bill-to Customer No_] ASC,
	[Currency Code] ASC,
	[Payment Discount _] ASC,
	[Posted Tax Document] ASC,
	[Tax Document Marked] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header [9] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$9] ON [dbo].[Cronus$Sales Invoice Header]
(
	[Tax Document Type] ASC,
	[Bill-to Customer No_] ASC,
	[Currency Code] ASC,
	[Payment Discount _] ASC,
	[Printed Tax Document] ASC,
	[Posted Tax Document] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Invoice Header - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


