
-- Secondary importance >>
PRINT '**************************** Return Receipt Line ****************************'
GO

PRINT 'Return Receipt Line [1] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$1] ON [dbo].[Cronus$Return Receipt Line]
(
	[Return Order No_] ASC,
	[Return Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [2] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$2] ON [dbo].[Cronus$Return Receipt Line]
(
	[Blanket Order No_] ASC,
	[Blanket Order Line No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [3] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$3] ON [dbo].[Cronus$Return Receipt Line]
(
	[Item Rcpt_ Entry No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [4] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$4] ON [dbo].[Cronus$Return Receipt Line]
(
	[Bill-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [5] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$5] ON [dbo].[Cronus$Return Receipt Line]
(
	[Sell-to Customer No_] ASC,
	[Document No_] ASC,
	[Line No_] ASC
)WITH (ONLINE=ON)
GO

PRINT 'Return Receipt Line [6] - ' + CAST(GETDATE() AS NVARCHAR(MAX))
GO
CREATE UNIQUE NONCLUSTERED INDEX [TITEMP$6] ON [dbo].[Cronus$Return Receipt Line]
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
PRINT 'Return Receipt Line - Done' + CAST(GETDATE() AS NVARCHAR(MAX))
GO

