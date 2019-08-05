PRINT 'Sales Cr.Memo Line [7] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$7] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Order No_] ASC,
	[Order Line No_] ASC,
	[Posting Date] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr.Memo Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Return Receipt No_] ASC,
	[Return Receipt Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr.Memo Line - Done - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

-- Secondary importance >>

PRINT '**************************** Sales Cr_Memo Line ****************************'
GO
PRINT 'Sales Cr_Memo Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Job Contract Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Sales Cr_Memo Line]
(
	[Document No_] ASC,
	[WHT Business Posting Group] ASC,
	[WHT Product Posting Group] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Sales Cr_Memo Line - Done ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO



