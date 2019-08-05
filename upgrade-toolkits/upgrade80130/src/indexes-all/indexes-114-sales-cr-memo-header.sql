SET ANSI_PADDING ON
GO

PRINT 'Sales Cr_Memo Header [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Return Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Posting Date] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Sell-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Bill-to Customer No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

SET ANSI_PADDING ON
GO
PRINT '**************************** Sales Cr_Memo Header ****************************'
GO

PRINT 'Sales Cr_Memo Header [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Prepayment Order No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Pre-Assigned No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[EDI Cr_ Memo] ASC,
	[EDI Outbound Entry No_] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header [8] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$8] ON [dbo].[Cronus$Sales Cr_Memo Header]
(
	[Document Exchange Status] ASC,
	[No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Header - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO


